# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib.auth.mixins import LoginRequiredMixin
from django.urls import reverse_lazy
from django.views.generic import ListView, TemplateView, DetailView
from django.shortcuts import render, get_object_or_404

from reports.models import KaryaKram, OfficeSetting
from .models import Office, District
from .forms import OfficeForm, UserForm, OfficeEditForm, OfficeBudgetForm, ProfileUpdateForm

from userrole.mixins import CreateView, UpdateView, DeleteView, OfficerMixin, AdminAssistantMixin, AdminAssistantMixin, OfficeHeadMixin

from django.views.generic import View
from django.shortcuts import render, redirect
from django.http import HttpResponse

from django.shortcuts import render, redirect
from django.contrib.auth.models import User, Group
from .tokens import account_activation_token
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_text
from django.utils.http import urlsafe_base64_decode
from django.core.urlresolvers import reverse

from django.contrib.auth.models import User,Group
from userrole.models import UserRole
from reports.models import OfficeBudget, FiscalYear, KaryaKram, Pragati, MonthlyProgress, MonthlyKaryaKram
from sachibBaithak.models import SachibBaithak, BudgetBaktabya, SachibBaithakMain
from karyasampadan.models import SampadanKaryakram
from users.models import Profile

from django.views.generic.detail import DetailView
class OfficeView(object):
    model = Office
    success_url = reverse_lazy('office:office-list')
    form_class = OfficeForm

class BudgetView(object):
    model = OfficeBudget
    success_url = reverse_lazy('office:office-list')
    form_class = OfficeBudgetForm

class ProfileUpdateView(object):
    model = Profile
    #success_url = reverse_lazy('office:office-list')
    form_class = ProfileUpdateForm

class ProfileUpdateView(LoginRequiredMixin, OfficerMixin, ProfileUpdateView, UpdateView):
    template_name = 'office/user_profile.html'

    def get_object(self):
        profile = Profile.objects.get(user__id=self.kwargs.get('pk')) 
        return profile

    def get_success_url(self):
        return reverse('office:profile-detail',args=(self.kwargs.get('pk'),))

class ProfileDetailView(LoginRequiredMixin, OfficerMixin, DetailView):
    model = Profile
    template_name = 'office/user_profile_detail.html'

    def get_context_data(self, **kwargs):
        context = super(ProfileDetailView, self).get_context_data(**kwargs)
        user = User.objects.filter(pk = self.kwargs.get('pk'))
        context['role'] = UserRole.get_active_roles(user)
        context['office'] = UserRole.get_office(self.kwargs.get('pk'))
        return context

    def get_object(self):
        profile = Profile.objects.get(user__id=self.kwargs.get('pk')) 
        return profile

class OfficeUserView(LoginRequiredMixin, OfficerMixin, TemplateView):
    template_name = 'office/users.html'

    def get_context_data(self, **kwargs):
        context = super(OfficeUserView, self).get_context_data(**kwargs)

        context['office'] = kwargs.get('pk')
        context['head'] = UserRole.get_office_user('Office Head', kwargs.get('pk'))
        context['assistant'] = UserRole.get_office_user('Information Officer', kwargs.get('pk'))
        return context

class OfficeDetailView(LoginRequiredMixin, OfficeView, DetailView):
    def get_context_data(self, **kwargs):
        context = super(OfficeDetailView, self).get_context_data(**kwargs)
        context['budget'] = OfficeBudget.objects.filter(office__id=self.kwargs.get('pk'))
        return context

class OfficeViewDataDetail(LoginRequiredMixin, OfficeView, DetailView):
    template_name = 'office/view_data.html'
    def get_context_data(self, **kwargs):
        context = super(OfficeViewDataDetail, self).get_context_data(**kwargs)
        context['pragati'] = Pragati.objects.filter(office__id=self.kwargs.get('pk'))
        context['monthlyprogress'] = MonthlyKaryaKram.objects.filter(office__id=self.kwargs.get('pk'))
        context['sachibbaithak'] = SachibBaithakMain.objects.filter(office__id=self.kwargs.get('pk'))
        context['sampadansuchak'] = SampadanKaryakram.objects.filter(office__id=self.kwargs.get('pk'))
        context['budgetbaktabya'] = BudgetBaktabya.objects.filter(office__id=self.kwargs.get('pk'))
        return context




class OfficeListView(LoginRequiredMixin, AdminAssistantMixin, OfficeView, ListView):
    context_object_name = 'all_offices'
    pass


class OfficeCreateView(LoginRequiredMixin, AdminAssistantMixin, OfficeView, CreateView):
    def from_valid(self, form):
        self.object = form.save()
        os = OfficeSetting(office=self.object, fiscal_year=FiscalYear(pk=1))
        os.save()

    
    def get_success_url(self):
        return reverse_lazy('office:office-list')

class OfficeUpdateView(LoginRequiredMixin, OfficerMixin, OfficeView, UpdateView):
    template_name = 'office/office-update.html'
    form_class = OfficeEditForm
    def get_success_url(self):
            return reverse('office:office-dashboard',args=(self.object.id,))  


class OfficeDeleteView(LoginRequiredMixin, AdminAssistantMixin, OfficeView, DeleteView):
    pass




class Monthly(LoginRequiredMixin, OfficerMixin, ListView): 
    template_name = 'reports/monthly.html'
        




class OfficeAddOfficeHeadView(LoginRequiredMixin, AdminAssistantMixin, OfficeView, View):
    def get(self, request, pk):
        user = UserForm()
        return render(request, 'office/addnewuser.html', {'form': user, 'office_id': pk, 'role':'Office Head'})

    def post(self, request, *args, **kwargs):
        form = UserForm(request.POST)
        role= request.POST.get('role')
        office = request.POST.get('office')
        if form.is_valid:
            user = form.save(commit=False)
            user.is_active = False
            user.set_unusable_password()
            user.save()

           
            office_head = Group.objects.get(name="Office Head")
            role, created = UserRole.objects.get_or_create(user=user, group=office_head, office = Office.objects.get(id=request.POST.get('office')))

            #email sending part
            current_site = get_current_site(request)
            subject = 'Activate Your MySite Account'
            message = render_to_string('office/accountconfirm.html',
            {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),})
            user.email_user(subject, message)
            return redirect('office:office-dashboard', pk=office)

class OfficeAddInfoofficerView(LoginRequiredMixin, OfficeHeadMixin, OfficeView, View):
    def get(self, request, pk):
        user = UserForm()
        return render(request, 'office/addnewuser.html', {'form': user, 'office_id': pk, 'role':'Information Officer'})

    def post(self, request, *args, **kwargs):
        form = UserForm(request.POST)
        role= request.POST.get('role')
        office = request.POST.get('office')
        if form.is_valid:
            user = form.save(commit=False)
            user.is_active = False
            user.set_unusable_password()
            user.save()

            information_officer = Group.objects.get(name="Information Officer")
            role, created = UserRole.objects.get_or_create(user=user, group=information_officer, office = Office.objects.get(id=request.POST.get('office')))


            #email sending part
            current_site = get_current_site(request)
            subject = 'Activate Your MySite Account'
            message = render_to_string('office/accountconfirm.html',
            {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),})
            user.email_user(subject, message)
            return redirect('office:office-dashboard', pk=office)

class DeactivateUserView(LoginRequiredMixin, OfficeHeadMixin, OfficeView, View):
    def get(self, request, pk):
        return redirect('user:login')

    def post(self, request, *args, **kwargs):
        form = UserForm(request.POST)
        userid= request.POST.get('userid')
        office = Office.objects.filter(pk=userid)
        return redirect('office:office-users', pk=office.id)

class DashboardView(LoginRequiredMixin, TemplateView):

    template_name = "office/dashboard.html"

    def dispatch(self, request, *args, **kwargs):
        
        if request.office:

            return redirect('office:office-dashboard', pk=request.office.id)
        return super(DashboardView, self).dispatch(request, *args, **kwargs)

    def get_context_data(self, **kwargs):
        context = super(DashboardView, self).get_context_data(**kwargs)
        context['offices'] = Office.objects.all()
      
        context['submission_count'] = Pragati.objects.all().count()
        context['offices_count'] = Office.objects.all().count()
        context['users_count'] = User.objects.all().count()

        context['pragati'] = Office.objects.raw("SELECT * FROM office_office LEFT JOIN (SELECT * FROM reports_karyakram LEFT JOIN (SELECT * FROM reports_pragati GROUP BY karyakram_id ORDER BY datesubmited DESC LIMIT 0,1) AS reports_pragati ON reports_karyakram.id = reports_pragati.karyakram_id GROUP BY reports_karyakram.office_id ORDER BY reports_pragati.datesubmited DESC LIMIT 0,1) AS karyakram ON office_office.id=karyakram.office_id")

        context['monthlyprogress'] = Office.objects.raw("SELECT * FROM office_office LEFT JOIN (SELECT * FROM reports_monthlykaryakram LEFT JOIN (SELECT * FROM reports_monthlyprogress GROUP BY karyakram_id ORDER BY datesubmited DESC LIMIT 0,1) AS reports_monthlyprogress ON reports_monthlykaryakram.id = reports_monthlyprogress.karyakram_id GROUP BY reports_monthlykaryakram.office_id ORDER BY reports_monthlyprogress.datesubmited DESC LIMIT 0,1) AS karyakram ON office_office.id=karyakram.office_id")

        context['sachibbaithak'] = Office.objects.raw("SELECT * FROM office_office LEFT JOIN (SELECT * FROM sachibBaithak_sachibbaithakmain LEFT JOIN (SELECT * FROM sachibBaithak_sachibbaithak GROUP BY sachibbaithakmain_id ORDER BY datesubmited DESC LIMIT 0,1) AS sachibBaithak_sachibbaithak ON sachibBaithak_sachibbaithakmain.id = sachibBaithak_sachibbaithak.sachibbaithakmain_id GROUP BY sachibBaithak_sachibbaithakmain.office_id ORDER BY sachibBaithak_sachibbaithak.datesubmited DESC LIMIT 0,1) AS karyakram ON office_office.id=karyakram.office_id")

        context['karyasampadan'] = Office.objects.raw("SELECT * FROM office_office LEFT JOIN (SELECT * FROM karyasampadan_sampadankaryakram LEFT JOIN (SELECT * FROM karyasampadan_sampadanmonthlyprogress GROUP BY sampadankaryakram_id ORDER BY datesubmited DESC LIMIT 0,1) AS karyasampadan_sampadanmonthlyprogress ON karyasampadan_sampadankaryakram.id = karyasampadan_sampadanmonthlyprogress.sampadankaryakram_id GROUP BY karyasampadan_sampadankaryakram.office_id ORDER BY karyasampadan_sampadanmonthlyprogress.datesubmited DESC LIMIT 0,1) AS karyakram ON office_office.id=karyakram.office_id")

        context['budgetbaktabya'] = Office.objects.raw("SELECT * FROM office_office LEFT JOIN (SELECT * FROM sachibBaithak_karyakram LEFT JOIN (SELECT * FROM sachibBaithak_pragati GROUP BY karyakram_id ORDER BY datesubmited DESC LIMIT 0,1) AS sachibBaithak_pragati ON sachibBaithak_karyakram.id = sachibBaithak_budgetbaktabya.karyakram_id GROUP BY sachibBaithak_karyakram.office_id ORDER BY sachibBaithak_budgetbaktabya.datesubmited DESC LIMIT 0,1) AS karyakram ON office_office.id=karyakram.office_id")



        # context['pragati'] = Pragati.objects.raw("SELECT * FROM reports_pragati ORDER BY datesubmited DESC")[:1]
        # context['pragati'] = Pragati.objects.filter(office__id=self.kwargs.get('pk'))       
        # context['bugbaktabya'] = BudgetBaktabya.objects.raw("SELECT * FROM sachibBaithak_budgetbaktabya")
     
        # context['office1'] = KaryaKram.objects.filter(office_id=1).order_by('-id').first()
        # context['office2'] = KaryaKram.objects.filter(office_id=2).order_by('-id').first()
        # context['office3'] = KaryaKram.objects.filter(office_id=3).order_by('-id').first()
        # context['office4'] = KaryaKram.objects.filter(office_id=4).order_by('-id').first()
        # context['office5'] = KaryaKram.objects.filter(office_id=5).order_by('-id').first()
        # context['office6'] = KaryaKram.objects.filter(office_id=6).order_by('-id').first()
        # context['office7'] = KaryaKram.objects.filter(office_id=7).order_by('-id').first()
        # context['office8'] = KaryaKram.objects.filter(office_id=8).order_by('-id').first()

        return context



class OfficeDashboard(LoginRequiredMixin, TemplateView):

    template_name = "office/office_dashboard.html"

    def get_context_data(self, **kwargs):
        if self.request.office:
            pk=self.request.office.id
        else:
            pk=kwargs.get('pk')
        context = super(OfficeDashboard, self).get_context_data(**kwargs)
        office = Office.objects.get(pk=pk)
        context['office'] = office
        context['karyakrams'] = KaryaKram.objects.filter(office__id=kwargs.get("pk"), karyakram__isnull=True).prefetch_related("parent")
        context['activePageOff'] = office.id
        #context['activePage'] = office.district.first().id
        return context

class OfficeKaryakramList(LoginRequiredMixin, TemplateView):

    template_name = "office/office_karyakram_list.html"
    def get_context_data(self, **kwargs):
        context = super(OfficeKaryakramList, self).get_context_data(**kwargs)
        office = Office.objects.get(pk=kwargs.get('pk'))

        context['office'] = office
        context['karyakrams'] = KaryaKram.objects.filter(office=office)
        return context


class DistrictDashboard(LoginRequiredMixin, TemplateView):

    template_name = "office/district_dashboard.html"

    def get_context_data(self, **kwargs):
        context = super(DistrictDashboard, self).get_context_data(**kwargs)
        district = District.objects.get(pk=kwargs.get('pk'))

        context['district'] = district
        context['offices'] = Office.objects.filter(district=district)
       
        context['activePage'] = district.id
        return context
        

class OfficeBudgetUpdateView(LoginRequiredMixin, OfficerMixin, BudgetView, UpdateView):
    template_name = "office/office_budget_form.html"
    def dispatch(self, request, *args, **kwargs):
        return super(OfficeBudgetUpdateView, self).dispatch(request, *args, **kwargs)

    def get_object(self):
        if self.request.office:
            office_id = self.request.office.id
        else:
            office_id = self.kwargs.get('pk')   
        office = Office.objects.get(pk=office_id)
        budgetyear = FiscalYear.objects.get(pk=office.settings.fiscal_year.pk)
        budget, created = OfficeBudget.objects.get_or_create(office=office, budget_year=budgetyear)
        return budget

    def get_success_url(self):
        if self.request.office:
            office_id = self.request.office.id
        else:
            office_id = self.kwargs.get('pk')
        return reverse('office:office-dashboard',args=(office_id,))
