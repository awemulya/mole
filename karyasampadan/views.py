# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
import datetime

from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import FormView, ListView, TemplateView
from office.models import Office
from django.db.models import Prefetch
from karyasampadan.models import SampadanKaryakram, SampadanMonthlyProgress
from karyasampadan.forms import MonthlyProgressForm, MonthlyKaryasampadanForm, MonthlyChildKaryasampadanForm
from userrole.mixins import CreateView, OfficeView, OfficerMixin, UpdateView
from django.views.generic.edit import CreateView as BaseCreateView
from django.core.urlresolvers import reverse
from reports.npdateconverter import NepaliDateConverter
from django.contrib import messages
from django.contrib.auth.models import User
from notifications.signals import notify
from channels import Group
import json
from reports.models import Months

class MonthlyProgressView(object):
    model = SampadanMonthlyProgress
    form_class = MonthlyProgressForm

class MonthlyKaryasampadanView(object):
    model = SampadanKaryakram
    form_class = MonthlyKaryasampadanForm


class MonthlyControlList(OfficeView, OfficerMixin, MonthlyKaryasampadanView, ListView):
    template_name = 'karyasampadan/monthly_control.html'

    def get_context_data(self,  **kwargs):
        data = super(MonthlyControlList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        return data

    def get_queryset(self):

        qs =  super(MonthlyControlList, self).get_queryset().filter(main_suchak__isnull=True).prefetch_related(Prefetch('karyasampadan_parent__sampadan_monthlyprogress', queryset=SampadanMonthlyProgress.objects.order_by('-month__id')))
        return qs

class MonthlyKaryakramCreateView(OfficeView, MonthlyKaryasampadanView, CreateView):
    template_name = "karyasampadan/karyakram_form.html"
    def get_success_url(self):
        return reverse('karyasampadan:monthly-control-list', args=(self.object.office.id,))

class MonthlyChildKaryakramCreateView(OfficeView, MonthlyKaryasampadanView, CreateView):
    form_class = MonthlyChildKaryasampadanForm
    template_name = "karyasampadan/karyakram_form.html"
    def form_valid(self, form):
        super(MonthlyChildKaryakramCreateView, self).form_valid(form)
        form.instance.main_suchak = SampadanKaryakram.objects.get(pk=self.kwargs.get('karyakram_id'),)
        self.object = form.save()
        return redirect(reverse('karyasampadan:monthly-control-list', args=(self.object.office.id,)))

    def get_success_url(self):
        return reverse('karyasampadan:monthly-control-list', args=(self.object.office.id,))

class MonthlyProgressList(OfficeView, OfficerMixin, TemplateView):
    template_name = 'karyasampadan/monthly_all_progress_list.html'

    def get_context_data(self,  **kwargs):
        data = super(MonthlyProgressList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['karyakram'] = SampadanKaryakram.objects.get(pk=self.kwargs.get('karyakram_id'))
        karyakram_id = self.kwargs.get('karyakram_id')
        data['months'] = Months.objects.raw('SELECT * FROM reports_months LEFT JOIN karyasampadan_sampadanmonthlyprogress ON reports_months.id = karyasampadan_sampadanmonthlyprogress.month_id AND karyasampadan_sampadanmonthlyprogress.sampadankaryakram_id = %s', [karyakram_id])
        return data

class MonthlyProgressCreateView(OfficeView, MonthlyProgressView, UpdateView):
    template_name = 'karyasampadan/monthlyprogress_form.html'
    def get_object(self):
        month_id = self.kwargs['month_id']
        karyakram_id = self.kwargs['karyakram_id']
        monthly_pragati, created = SampadanMonthlyProgress.objects.get_or_create(sampadankaryakram_id=karyakram_id, fiscal_year_id=1, month_id=month_id)
        return monthly_pragati


    def get_success_url(self):
        converter = NepaliDateConverter()
        self.object.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if self.object.datesubmited is None:
            self.object.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object.save()
        return reverse('karyasampadan:monthly-all-progress-list',args=(self.object.sampadankaryakram.office.id, self.object.sampadankaryakram.id))

class MonthlyProgressDetail(OfficeView, OfficerMixin, TemplateView):
    template_name = 'karyasampadan/monthly_progress_detail.html'

    def get_context_data(self,  **kwargs):
        data = super(MonthlyProgressDetail, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        karyakram = SampadanKaryakram.objects.get(pk=self.kwargs.get('karyakram_id'))
        # if  karyakram.get_monthly_progress().first():
        #     a = karyakram.get_monthly_progress().first().month_id
        # else:
        #     a = 0
        data['history'] = karyakram.get_monthly_progress()
        data['karyakram'] = karyakram
        karyakram_id = self.kwargs.get('karyakram_id')
        data['months'] = Months.objects.raw('SELECT * FROM reports_months LEFT JOIN reports_monthlyprogress ON reports_months.id = reports_monthlyprogress.month_id AND reports_monthlyprogress.karyakram_id = %s', [karyakram_id])
        return data
