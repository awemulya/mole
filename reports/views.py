# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime
from django.db import transaction
from django.shortcuts import render, redirect
from django.urls import reverse_lazy
from django.views import View
from django.views.generic import FormView, ListView, TemplateView

from office.models import Office
from reports.forms import KaryakramForm, LakxyaForm, PragatiForm, ChildKaryakramForm, OfficeSettingsForm, MonthlyProgressForm, MonthlyKaryakramForm, MonthlyChildKaryakramForm
from reports.models import KaryaKram, Lakxya, Pragati, OfficeSetting, Months, MonthlyKaryaKram, MonthlyProgress
from userrole.mixins import CreateView, OfficeView, OfficerMixin, UpdateView
from django.views.generic.edit import CreateView as BaseCreateView
from django.core.urlresolvers import reverse
from django.db.models import Q
from django.db.models import Prefetch
from .npdateconverter import NepaliDateConverter
from django.contrib import messages
from django.contrib.auth.models import User
from notifications.signals import notify
from channels import Group
import json
class KaryakramView(object):
    model = KaryaKram
    form_class = KaryakramForm


class LakxyaView(object):
    model = Lakxya
    form_class = LakxyaForm


class PragatiView(object):
    model = Pragati
    form_class = PragatiForm

class OfficeSettingView(object):
    model = OfficeSetting
    form_class = OfficeSettingsForm

class MonthlyProgressView(object):
    model = MonthlyProgress
    form_class = MonthlyProgressForm

class MonthlyKaryakramView(object):
    model = MonthlyKaryaKram
    form_class = MonthlyKaryakramForm


class OfficeSettings(OfficeView, OfficerMixin, OfficeSettingView, UpdateView):
    def get_success_url(self):
        return reverse('office:office-detail', args=(self.kwargs.get('office'),))



class KaryakramCreateView(OfficeView, KaryakramView, CreateView):

    def get_success_url(self):
        return reverse('reports:karyakram-control-list', args=(self.object.office.id,))

class ChildKaryakramCreateView(OfficeView, KaryakramView, CreateView):
    form_class = ChildKaryakramForm

    def form_valid(self, form):
        super(ChildKaryakramCreateView, self).form_valid(form)
        form.instance.karyakram = KaryaKram.objects.get(pk=self.kwargs.get('karyakram'),)
        self.object = form.save()
        return redirect(reverse('reports:add-lakxya', args=(self.object.office.id, self.object.id, 0)))

    def get_success_url(self):
        return reverse('reports:add-lakxya', args=(self.object.office.id, self.object.id, 0))

class KaryakramUpdateView(OfficeView, KaryakramView, UpdateView):

    def get_success_url(self):
        return reverse('office:office-dashboard',args=(self.object.office.id,))

class KaryakramListView(OfficeView, KaryakramView, OfficerMixin, ListView):
    def get_context_data(self, **kwargs):
        data = super(KaryakramListView, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        return data


class LakxyaCreateView(OfficeView, LakxyaView, FormView):
    template_name = 'reports/lakxya_form.html'


    def get(self, request, *args, **kwargs):
        awadhi = self.kwargs['awadhi']
        karyakram_id = self.kwargs['karyakram_id']
        karyakram = KaryaKram.objects.get(pk=karyakram_id)

        if awadhi == '1' and not Lakxya.objects.filter(karyakram=karyakram_id, awadhi=4):
            return redirect(reverse('reports:add-lakxya',args=(karyakram.office.id, karyakram_id, 4)))
        if awadhi == '2' and not Pragati.objects.filter(karyakram=karyakram_id, awadhi=1):
            return redirect(reverse('reports:add-pragati',args=(karyakram.office.id, karyakram_id, 1)))
        if awadhi == '3' and not Pragati.objects.filter(karyakram=karyakram_id, awadhi=2):
            return redirect(reverse('reports:add-pragati',args=(karyakram.office.id, karyakram_id, 2)))

        laxya, created = Lakxya.objects.get_or_create(karyakram=karyakram, awadhi=awadhi)
        form = LakxyaForm(instance=laxya)
        return render(request, 'reports/lakxya_form.html', {'form': form,'awadhi': awadhi, 'karyakram':karyakram, 'office':Office.objects.get(pk=self.kwargs['office'])},)


    def form_valid(self, form):
        converter = NepaliDateConverter()
        lakxya = Lakxya.objects.get(pk=form.data.get('lakxya'))
        lakxya.paridam = form.cleaned_data['paridam']
        lakxya.var = form.cleaned_data['var']
        lakxya.budget = form.cleaned_data['budget']
        lakxya.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if lakxya.datesubmited is None:
            lakxya.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        lakxya.save()


        messages.success(self.request, 'Lakxya Sucessfully Added.')
        if self.request.group.id == 4:
            recipients = User.objects.filter(user_roles__group__name="Office Head", user_roles__office__id=1)
            group = "office_head-"+str(1)
        else:
            recipients = User.objects.filter(user_roles__group__name="Information Officer", user_roles__office__id=1)
            group = "info_officer-"+str(1)
        
        notify.send(self.request.user, recipient=recipients, verb='Updated new pragati', action_object=lakxya, detail_url = '/comment/add/22/')

        Group("%s" % group).send({
            'text': json.dumps({
                'by': str(self.request.user),
                'verb': "commented on",
                'time':"Just Now",
                'detail_url':"/comment/add/22/",
                'action_object':str(lakxya),
            })
        })

        if lakxya.awadhi == 1:
            return redirect(reverse('reports:first-control-list',args=(lakxya.karyakram.office.id, 0,)))
        elif lakxya.awadhi == 2:
            return redirect(reverse('reports:second-control-list',args=(lakxya.karyakram.office.id, 0,)))
        elif lakxya.awadhi == 3:
            return redirect(reverse('reports:third-control-list',args=(lakxya.karyakram.office.id, 0,)))
        elif lakxya.awadhi == 4:
            return redirect(reverse('reports:yearly-control-list',args=(lakxya.karyakram.office.id, 0,)))
        else:
            return redirect(reverse('office:office-dashboard',args=(lakxya.karyakram.office.id,)))


def sendrealtimenotif(group, byuser, url, action_object, verb):
    Group("%s" % group).send({
        'text': json.dumps({
            'by': str(byuser),
            'verb': str(verb),
            'time':"Just Now",
            'detail_url':str(url),
            'action_object':str(action_object),
        })
    })
class PragatiCreateView(OfficeView, PragatiView, UpdateView): 

    def get_context_data(self,  **kwargs):
        data = super(PragatiCreateView, self).get_context_data(**kwargs)
        data['office'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['awadhi'] = self.kwargs['awadhi']
        return data

    def dispatch(self, request, *args, **kwargs):
        awadhi = self.kwargs['awadhi']
        karyakram_id = self.kwargs['karyakram_id']
        karyakram = KaryaKram.objects.get(pk=karyakram_id)
        if awadhi == '1' and not Lakxya.objects.filter(karyakram=karyakram_id, awadhi=1):
            return redirect(reverse('reports:add-lakxya',args=(karyakram.office.id, karyakram_id, 1)))
        if awadhi == '2' and not Lakxya.objects.filter(karyakram=karyakram_id, awadhi=2):
            return redirect(reverse('reports:add-lakxya',args=(karyakram.office.id, karyakram_id, 2)))
        if awadhi == '3' and not Lakxya.objects.filter(karyakram=karyakram_id, awadhi=3):
            return redirect(reverse('reports:add-lakxya',args=(karyakram.office.id, karyakram_id, 3)))
        if awadhi == '4' and not Pragati.objects.filter(karyakram=karyakram_id, awadhi=4):
            return redirect(reverse('reports:add-pragati',args=(karyakram.office.id, karyakram_id, 4)))
        else:
            return super(PragatiCreateView, self).dispatch(request, *args, **kwargs)

    def get_object(self):
        awadhi = self.kwargs['awadhi']
        karyakram_id = self.kwargs['karyakram_id']
        karyakram = KaryaKram.objects.get(pk=karyakram_id)
       
        pragati, created = Pragati.objects.get_or_create(karyakram=karyakram, awadhi=awadhi)
        return pragati


    def get_success_url(self):
        converter = NepaliDateConverter()
        self.object.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if self.object.datesubmited is None:
            self.object.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object.save()


        if self.request.group.id == 4:
            recipients = User.objects.filter(user_roles__group__name="Office Head", user_roles__office__id=1)
            group = "office_head-"+str(1)
        else:
            recipients = User.objects.filter(user_roles__group__name="Information Officer", user_roles__office__id=1)
            group = "info_officer-"+str(1)
        
        notify.send(self.request.user, recipient=recipients, verb='updated pragati', action_object=self.object, detail_url = '/comment/add/22/')

        sendrealtimenotif(group, self.request.user, "", self.object, "verb")
      

        if self.object.awadhi == 1:
            return reverse('reports:first-control-list',args=(self.object.karyakram.office.id, 1))
        elif self.object.awadhi == 2:
            return reverse('reports:second-control-list',args=(self.object.karyakram.office.id, 1))
        elif self.object.awadhi == 3:
            return reverse('reports:third-control-list',args=(self.object.karyakram.office.id, 1))
        elif self.object.awadhi == 4:
            return reverse('reports:yearly-control-list',args=(self.object.karyakram.office.id, 1))
        else:
            return reverse('office:office-dashboard',args=(self.object.karyakram.office.id,))

class ReportView(OfficeView, OfficerMixin, KaryakramView, ListView):
    template_name = 'reports/reports.html'

    def get_context_data(self, **kwargs):
        data = super(ReportView, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['awadhi'] = self.kwargs.get('awadhi')
        return data

    def get_queryset(self):
        # filter fiscal year == office.settings.fiscal year
        qs =  KaryaKram.objects.filter(office__id=self.kwargs.get("office"), lakxya__awadhi=0, pragati__awadhi=4).\
            prefetch_related("lakxya", "pragati")
        return qs

class KaryakramControlList(OfficeView, OfficerMixin, KaryakramView, ListView):
    template_name = 'reports/karyakram_control.html'

    def get_context_data(self,  **kwargs):
        data = super(KaryakramControlList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['awadhi']= self.kwargs.get('awadhi')
        return data 

    def get_queryset(self):  
        qs =  super(KaryakramControlList, self).get_queryset().filter(karyakram__isnull=True).\
            prefetch_related(Prefetch("parent", to_attr='childs'))
        return qs

class YearlyControlList(OfficeView, OfficerMixin, KaryakramView, ListView):
    template_name = 'reports/Yearly_control.html'

    def get_context_data(self,  **kwargs):
        data = super(YearlyControlList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['type']= self.kwargs.get('type')
        return data 

    def get_queryset(self):

        qs = super(YearlyControlList, self).get_queryset().filter(karyakram__isnull=True).prefetch_related(Prefetch('parent__lakxya', queryset=Lakxya.objects.order_by('awadhi')), Prefetch('parent__pragati', queryset=Pragati.objects.order_by('awadhi')))
        return qs


class FirstControlList(OfficeView, OfficerMixin, KaryakramView, ListView):
    template_name = 'reports/First_control.html'

    def get_context_data(self,  **kwargs):
        data = super(FirstControlList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['type']= self.kwargs.get('type')
        return data 
    def get_queryset(self):
        qs = super(FirstControlList, self).get_queryset().filter(karyakram__isnull=True).prefetch_related(Prefetch('parent__lakxya', queryset=Lakxya.objects.order_by('awadhi')), Prefetch('parent__pragati', queryset=Pragati.objects.order_by('awadhi')))
        return qs

class SecondControlList(OfficeView, OfficerMixin, KaryakramView, ListView):
    template_name = 'reports/Second_control.html'

    def get_context_data(self,  **kwargs):
        data = super(SecondControlList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['type']= self.kwargs.get('type')
        return data 
 
    def get_queryset(self): 
        qs =  super(SecondControlList, self).get_queryset().filter(karyakram__isnull=True).prefetch_related(Prefetch('parent__lakxya', queryset=Lakxya.objects.order_by('awadhi')), Prefetch('parent__pragati', queryset=Pragati.objects.order_by('awadhi')))
        return qs

class ThirdControlList(OfficeView, OfficerMixin, KaryakramView, ListView):
    template_name = 'reports/Third_control.html'

    def get_context_data(self,  **kwargs):
        data = super(ThirdControlList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['type']= self.kwargs.get('type')
        return data 

    def get_queryset(self):       
        qs =  super(ThirdControlList, self).get_queryset().filter(karyakram__isnull=True).prefetch_related(Prefetch('parent__lakxya', queryset=Lakxya.objects.order_by('awadhi')), Prefetch('parent__pragati', queryset=Pragati.objects.order_by('awadhi')))
        return qs
        

class FilesSubmitted(OfficerMixin, TemplateView):
    template_name = "reports/filessubmited.html"
    def get_context_data(self, **kwargs):
        context = super(FilesSubmitted, self).get_context_data(**kwargs)
        context['office'] = self.kwargs.get('office')
        context['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        context['karyakrams'] = KaryaKram.objects.filter(office__id=self.kwargs.get('office'), fiscal_year__id=self.request.fiscal_year.id, karyakram__isnull=False)
       
        return context


class MonthlyControlList(OfficeView, OfficerMixin, MonthlyKaryakramView, ListView):
    template_name = 'reports/monthly_control.html'

    def get_context_data(self,  **kwargs):
        data = super(MonthlyControlList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        return data 

    def get_queryset(self):
        
        qs =  super(MonthlyControlList, self).get_queryset().filter(monthly_karyakram__isnull=True).prefetch_related(Prefetch('monthly_parent__monthlyprogress', queryset=MonthlyProgress.objects.order_by('-month__id')))
        return qs
        
class MonthlyKaryakramCreateView(OfficeView, MonthlyKaryakramView, CreateView):
    template_name = "reports/karyakram_form.html"
    def get_success_url(self):
        return reverse('reports:monthly-control-list', args=(self.object.office.id,))

class MonthlyChildKaryakramCreateView(OfficeView, MonthlyKaryakramView, CreateView):
    form_class = MonthlyChildKaryakramForm
    template_name = "reports/karyakram_form.html"
    def form_valid(self, form):
        super(MonthlyChildKaryakramCreateView, self).form_valid(form)
        form.instance.monthly_karyakram = MonthlyKaryaKram.objects.get(pk=self.kwargs.get('karyakram'),)
        self.object = form.save()
        return redirect(reverse('reports:monthly-control-list', args=(self.object.office.id,)))

    def get_success_url(self):
        return reverse('reports:monthly-control-list', args=(self.object.office.id,))

class MonthlyProgressList(OfficeView, OfficerMixin, KaryakramView, TemplateView):
    template_name = 'reports/monthly_all_progress_list.html'

    def get_context_data(self,  **kwargs):
        data = super(MonthlyProgressList, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        data['karyakram'] = MonthlyKaryaKram.objects.get(pk=self.kwargs.get('karyakram_id'))
        karyakram_id = self.kwargs.get('karyakram_id')
        data['months'] = Months.objects.raw('SELECT * FROM reports_months LEFT JOIN reports_monthlyprogress ON reports_months.id = reports_monthlyprogress.month_id AND reports_monthlyprogress.karyakram_id = %s', [karyakram_id])
        return data

class MonthlyProgressCreateView(OfficeView, MonthlyProgressView, UpdateView):        
    def get_object(self):
        month_id = self.kwargs['month_id']
        karyakram_id = self.kwargs['karyakram_id']
        monthly_pragati, created = MonthlyProgress.objects.get_or_create(karyakram_id=karyakram_id, fiscal_year_id=1, month_id=month_id)
        return monthly_pragati


    def get_success_url(self):
        converter = NepaliDateConverter()
        self.object.dateupdated = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        if self.object.datesubmited is None:
            self.object.datesubmited = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        self.object.save()
        return reverse('reports:monthly-all-progress-list',args=(self.object.karyakram.office.id, self.object.karyakram.id))

class MonthlyProgressDetail(OfficeView, OfficerMixin, KaryakramView, TemplateView):
    template_name = 'reports/monthly_progress_detail.html'

    def get_context_data(self,  **kwargs):
        data = super(MonthlyProgressDetail, self).get_context_data(**kwargs)
        data['office'] = self.kwargs.get('office')
        data['office_obj'] = Office.objects.get(pk=self.kwargs.get('office'))
        monthly_karyakram = MonthlyKaryaKram.objects.get(pk=self.kwargs.get('karyakram_id'))
        # if  karyakram.get_monthly_progress().first():
        #     a = karyakram.get_monthly_progress().first().month_id
        # else:
        #     a = 0
        data['history'] = monthly_karyakram.get_monthly_progress()
        data['monthly_karyakram'] = monthly_karyakram
        karyakram_id = self.kwargs.get('karyakram_id')
        data['months'] = Months.objects.raw('SELECT * FROM reports_months LEFT JOIN reports_monthlyprogress ON reports_months.id = reports_monthlyprogress.month_id AND reports_monthlyprogress.karyakram_id = %s', [karyakram_id])
        return data     
