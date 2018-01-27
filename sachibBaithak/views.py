# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime

from django.shortcuts import render, redirect
from reports.models import FiscalYear
from .models import SachibBaithak, SachibBaithakMain, BudgetBaktabya
from office.models import Office
from django.views.generic import UpdateView, ListView, CreateView, TemplateView
from .forms import BudgetBaktabyaForm, SachibBaithakAdminCreateForm, SachibBaithakAdminForm, SachibBaithakUserForm, SachibBaithakMainForm
from userrole.mixins import OfficerMixin, OfficeView
from reports.npdateconverter import NepaliDateConverter
from django.core.urlresolvers import reverse

# Create your views here.
class SachibBaithakAdminCreateView(object):
    model = SachibBaithak
    form_class = SachibBaithakAdminCreateForm

class SachibBaithakMainView(object):
    model = SachibBaithakMain
    form_class = SachibBaithakMainForm

class SachibBaithakAdminView(object):
    model = SachibBaithak
    form_class = SachibBaithakAdminForm

class SachibBaithakUserView(object):
    model = SachibBaithak
    form_class = SachibBaithakUserForm

class BudgetBaktabyaView(object):
    model = BudgetBaktabya
    form_class = BudgetBaktabyaForm


class SachibBaithakMainListView(OfficeView, OfficerMixin, ListView):
    model = SachibBaithakMain
    template_name = 'sachibBaithak/sachibbaithak_main_list.html'

    def get_context_data(self, **kwargs):
        data = super(SachibBaithakMainListView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['object_list'] = SachibBaithakMain.objects.filter(office_id=self.kwargs.get('office'))
        return data

class SachibBaithakMainCreateView(OfficeView, OfficerMixin, SachibBaithakMainView, CreateView):
    template_name = 'sachibBaithak/sachibbaithak_form.html'

    def get_context_data(self, **kwargs):
        data = super(SachibBaithakMainCreateView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        return data

    def form_valid(self, form):
        super(SachibBaithakMainCreateView, self).form_valid(form)
        form.instance.office = Office.objects.get(pk=self.kwargs.get('office'),)
        converter = NepaliDateConverter()
        form.instance.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object = form.save()
        return redirect(reverse('sachibBaithak:sachibbaithak-main-list', args=(self.object.office.id,)))

    def get_success_url(self):
        return reverse('sachibBaithak:sachibbaithak-main-list', args=(self.object.office.id,))


class SachibBaithakCreateView(OfficerMixin, SachibBaithakAdminCreateView, CreateView):
    template_name = 'sachibBaithak/sachibbaithak_form.html'

    def get_context_data(self,  **kwargs):
        data = super(SachibBaithakCreateView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        return data

    def form_valid(self, form):
        form.instance.sachibbaithakmain_id = self.kwargs.get('main_id')
        converter = NepaliDateConverter()
        form.instance.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object = form.save()
        return redirect(reverse('sachibBaithak:sachibbaithak-list',args=(self.kwargs.get('office'),self.kwargs.get('main_id'))))
        
    def get_success_url(self):
        return reverse('sachibBaithak:sachibbaithak-list',args=(self.kwargs.get('office'),self.kwargs.get('main_id')))


class SachibBaithakmainUpdateView(OfficerMixin, SachibBaithakMainView, UpdateView):
    template_name = 'sachibBaithak/sachibbaithak_form.html'

    def get_context_data(self,  **kwargs):
        data = super(SachibBaithakmainUpdateView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        return data
    
    def get_success_url(self):
        converter = NepaliDateConverter()
        self.object.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if self.object.datesubmited is None:
            self.object.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object.save()
        return reverse('sachibBaithak:sachibbaithak-main-list', args=(self.object.office.id,))


class BudgetBaktabyaListView(OfficerMixin, BudgetBaktabyaView, TemplateView):
    template_name = 'budgetbaktabya/all_budgetbaktabya_list.html'

    def get_context_data(self,  **kwargs):
        data = super(BudgetBaktabyaListView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['object_list'] = BudgetBaktabya.objects.filter(office_id=self.kwargs.get('office'))
        return data

class BudgetBaktabyaCreateView(OfficerMixin, BudgetBaktabyaView, CreateView):
    template_name = 'budgetbaktabya/budgetbaktabya_form.html'

    def get_context_data(self,  **kwargs):
        data = super(BudgetBaktabyaCreateView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['object_list'] = BudgetBaktabya.objects.filter(office_id=self.kwargs.get('office'))
        return data

    def form_valid(self, form):
        form.instance.office = Office.objects.get(pk=self.kwargs.get('office'),)
        converter = NepaliDateConverter()
        form.instance.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object = form.save()
        return redirect(reverse('sachibBaithak:budgetbaktabya-list', args=(self.object.office.id,)))

    def get_success_url(self):
        return reverse('sachibBaithak:budgetbaktabya-list', args=(self.object.office.id,))

class BudgetBaktabyaUpdateView(OfficerMixin, BudgetBaktabyaView, UpdateView):
    template_name = 'budgetbaktabya/budgetbaktabya_form.html'

    def get_context_data(self,  **kwargs):
        data = super(BudgetBaktabyaUpdateView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['object_list'] = BudgetBaktabya.objects.filter(office_id=self.kwargs.get('office'))
        return data
    
    def get_success_url(self):
        converter = NepaliDateConverter()
        self.object.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if self.object.datesubmited is None:
            self.object.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object.save()
        return reverse('sachibBaithak:budgetbaktabya-list', args=(self.object.office.id,))


class SachibBaithakListView(OfficerMixin, TemplateView):
    model = SachibBaithak
    template_name = 'sachibBaithak/sachibbaithak_list.html'

    def get_context_data(self, **kwargs):
        data = super(SachibBaithakListView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['mainbaithak'] = SachibBaithakMain.objects.get(pk=self.kwargs.get('pk'))
        data['object_list'] = SachibBaithak.objects.filter(sachibbaithakmain_id=self.kwargs.get('pk'))
        return data


class SachibBaithakadminUpdateView(OfficerMixin, SachibBaithakAdminView, UpdateView):
    template_name = 'sachibBaithak/sachibbaithak_form.html'

    def get_context_data(self, **kwargs):
        data = super(SachibBaithakadminUpdateView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['mainbaithak'] = SachibBaithakMain.objects.get(pk=self.kwargs.get('pk'))
        data['object_list'] = SachibBaithak.objects.filter(sachibbaithakmain_id=self.kwargs.get('pk'))
        return data

    def get_success_url(self):
        converter = NepaliDateConverter()
        self.object.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if self.object.datesubmited is None:
            self.object.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object.save()
        return reverse('sachibBaithak:sachibbaithak-list',args=(self.object.sachibbaithakmain.id, self.kwargs.get('office'), ))

class SachibBaithakuserUpdateView(OfficerMixin, SachibBaithakUserView, UpdateView):
    template_name = 'sachibBaithak/sachibbaithak_form.html'
    
    def get_success_url(self):
        converter = NepaliDateConverter()
        self.object.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if self.object.datesubmited is None:
            self.object.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object.save()
        return reverse('sachibBaithak:sachibbaithak-list',args=(self.object.sachibbaithakmain.id, self.kwargs.get('office'),))
