#!/usr/bin/env python
# -*- coding: utf-8 -*-

from django.shortcuts import render, get_object_or_404, redirect
from django.http import HttpResponse, JsonResponse
from .decorators import template_based_on_user_type, group_required



from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth.mixins import LoginRequiredMixin, UserPassesTestMixin, PermissionRequiredMixin
from django.views import generic
from django.utils.decorators import method_decorator
#from .forms import OPMForm, UserForm, UserDetailsForm, OfficeForm, ProjectForm, MunicipalityForm, ActivityForm, CurrentactsForm, AllactsForm, YearlyAimForm, FirstAimForm, SecondAimForm, ThirdAimForm, YearlyProgressForm, FirstProgressForm, SecondProgressForm, ThirdProgressForm
from .imagecropper import PhotoForm

from .models import Office, Form, Profile, Form_status


from django.contrib.auth.models import User, Group

from django.views.generic import View
from django.views.generic.edit import CreateView, UpdateView, DeleteView

from .tokens import account_activation_token
from django.utils.encoding import force_bytes
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string
from django.contrib.sites.shortcuts import get_current_site
from django.utils.encoding import force_text
from django.utils.http import urlsafe_base64_decode
from django.contrib.auth import login, authenticate

from pprint import pprint

@login_required(login_url='/login/')
@template_based_on_user_type('supa-admin/dashboard.html', 'supa-manager/dashboard.html', 'office-manager/dashboard.html', 'office-staff/dashboard.html')
def dashboard(request, template='default.html', base_template=''):
	data={}
	data['base_template'] = base_template
	return render(request, template, data)




class AddOffice(LoginRequiredMixin, PermissionRequiredMixin, View):
	permission_required = ('supa.add_office')
	login_url = '/login/'
	redirect_field_name = 'redirect_to'

	@method_decorator(template_based_on_user_type('', '', '', ''))
	def get(self, request, base_template='', *args, **kwargs):
		office = OPMForm(prefix="first")
		data={}
		data['base_template'] = base_template
		return render(request, 'supa-admin/addnewoffice.html', {'form': office, 'base_template':base_template})
		#return HttpResponse('This is GET request')

	def post(self, request, *args, **kwargs):
		opm = OPMForm(request.POST, prefix="first")
		category = request.POST.get('first-category')
		newtype = globals()[category+"Form"](request.POST, prefix="ajax")


		if opm.is_valid():
			newopm = opm.save(commit=False)
			newopm.department = Department.objects.get(id=request.POST.get('department'))
		if newtype.is_valid():
			 	newopm.save()
			 	newtype1 =  newtype.save(commit=False)
			 	newtype1.OPMtype = newopm
			 	newtype1.save()

                #return redirect('question_detail', pk=question.pk)

		return redirect('supa:listoffice')



@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def officelist(request, template='', base_template=''):
    offices = OPMtype.objects.all()
    data = {}
    data['office_list'] = offices
    data['base_template'] = base_template
    return render(request, 'supa-admin/officelist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def projectlist(request, template='', base_template=''):
    projects = Project.objects.all()
    data = {}
    data['project_list'] = projects
    data['base_template'] = base_template
    return render(request, 'supa-admin/projectlist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def municipalitylist(request, template='', base_template=''):
    municipal = Municipality.objects.all()
    data = {}
    data['municipal_list'] = municipal
    data['base_template'] = base_template
    return render(request, 'supa-admin/municipalitylist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.can_edit_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def officedetail(request, pk, **kwargs):
    opmtype = get_object_or_404(OPMtype, pk=pk)
    data = {}
    data['office'] = opmtype
    data['base_template'] = kwargs.get('base_template')


    forms = Form.objects.filter(OPMtype=opmtype)
    data['formtype'] = opmtype.category 
    data['activities'] = forms
    

    return render(request, 'supa-admin/officedetail.html', data)


@login_required(login_url='/login/')
@permission_required('supa.edit_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def officeedit(request, pk, **kwargs):
    office = get_object_or_404(OPMtype, pk=pk)

    base_template = kwargs.get('base_template')
    form = OPMForm(request.POST or None, instance=office)
    if form.is_valid():
        form.save()
        return redirect('supa:listoffice')
    return render(request, 'supa-admin/officeedit.html', {'form':form, 'base_template':base_template})


@login_required(login_url='/login/')
@permission_required('supa.delete_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def officedelete(request, pk, **kwargs):
    office = get_object_or_404(OPMtype, pk=pk)
    base_template = kwargs.get('base_template')
    if request.method=='POST':
        office.delete()
        return redirect('supa:listoffice')
    return render(request, 'supa-admin/officedelete.html', {'object':office, 'base_template':base_template})


class AddUser(LoginRequiredMixin, PermissionRequiredMixin, View):
	permission_required = ('auth.add_user')
	login_url = '/login/'
	redirect_field_name = 'redirect_to'

	@method_decorator(template_based_on_user_type('', '', '', ''))
	def get(self, request, base_template='', *args, **kwargs):
		user = UserForm()
		data={}
		data['base_template'] = base_template
		return render(request, 'supa-admin/addnewuser.html', {'form': user, 'base_template':base_template})
		#return HttpResponse('This is GET request')

	def post(self, request, *args, **kwargs):

		form = UserForm(request.POST)
		groupid = request.POST.get('staff')
		if form.is_valid:
			user = form.save(commit=False)
			user.is_active = False
			user.set_unusable_password()
			user.save()
			user.profile.OPMtype = OPMtype.objects.get(id=request.POST.get('OPMtype'))
			user.save()


			grp = Group.objects.get(id=groupid)
			grp.user_set.add(user)

			#email sending part
			current_site = get_current_site(request)
			subject = 'Activate Your MySite Account'
			message = render_to_string('supa-admin/accountconfirm.html',
			{
				'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': account_activation_token.make_token(user),})
			user.email_user(subject, message)
			return redirect('supa:dashboard')

def activate(request, uidb64, token):
    try:
        uid = force_text(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None


    if user is not None and account_activation_token.check_token(user, token):

        userform = UserDetailsForm()
        profile = get_object_or_404(Profile, user=uid)
        photoform = PhotoForm(request.POST or None, instance=profile)



        return render(request, 'registration/profiledetails.html', {'uid': uidb64, 'userform':userform, 'photoform':photoform})
    else:
    	return redirect('login')

			#return redirect('question_detail', pk=question.pk)
		#return redirect('supa:listoffice')





def firstlogin(request, *args, **kwargs):

    if request.method=='POST':

    	password1 = request.POST.get('password1')
    	password2 = request.POST.get('password2')

    	if password2 == password1:
	    	usrid = request.POST.get('uidb64')
	    	uid = force_text(urlsafe_base64_decode(usrid))
	    	user = User.objects.get(pk=uid)
	    	user.profile.email_confirmed = True
	    	user.set_password(password2)
	    	user.is_active = True
	    	user.save()

	    	profile = get_object_or_404(Profile, user=uid)
	    	user1 = authenticate(username=user.username, password=password2)
	    	form = PhotoForm(request.POST, request.FILES, instance=profile)



	    	if form.is_valid():
	    		form.save()

	    	login(request, user1)

	    	return redirect('supa:dashboard')
		return redirect('error')

# class SuperuserRequiredMixin(object, permission):
#     @method_decorator(user_passes_test(lambda u: u.has_perm(permission)))
#     def dispatch(self, *args, **kwargs):
#         return super(SuperuserRequiredMixin, self).dispatch(*args, **kwargs)






#	@method_decorator(template_based_on_user_type('supaadmin/bodypart.html', 'ordinary-template.html'))




@login_required(login_url='/login/')

#@permission_required('supa.can_add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def formlist(request, template='', base_template=''):
    forms = Form.objects.all()
    data = {}
    data['form_list'] = forms
    data['base_template'] = base_template
    return render(request, 'forms/formlist.html', data)

@login_required(login_url='/login/')
#@permission_required('supa.can_edit_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def formdetail(request, pk, **kwargs):
    form = get_object_or_404(Form, pk=pk)
    data = {}
    data['form'] = form
    data['base_template'] = kwargs.get('base_template')
    return render(request, 'forms/formdetail.html', data)


@login_required(login_url='/login/')

def ajaxgetdepartment(request):
	mid = request.POST.get('ministry')
	department = Department.objects.filter(ministry=mid)
	html = render_to_string('ajax_temp/ajaxdepartment.html', {'department': Department.objects.filter(ministry=mid)})

	return HttpResponse(html)

@login_required(login_url='/login/')
def ajaxgetcategory(request):
	mid = request.POST.get('category')
	form1 = globals()[mid+"Form"](prefix="ajax")
	html = render_to_string('ajax_temp/ajaxformwizelem.html', {'form': form1})
	return HttpResponse(html)


class Addactivity(LoginRequiredMixin, PermissionRequiredMixin, View):
	permission_required = ('supa.add_form')
	login_url = '/login/'
	redirect_field_name = 'redirect_to'

	def get(self, request, *args, **kwargs):
		activityform = ActivityForm(prefix="activityform")
		currentactsform = CurrentactsForm(prefix="currentactsform")
		allactsform = AllactsForm(prefix="allactsform")


		yearlyform = YearlyAimForm(prefix="yearlyform")
		firstform = FirstAimForm(prefix="firstform")
		secondform = SecondAimForm(prefix="secondform")
		thirdform = ThirdAimForm(prefix="thirdform")

		data={}
		data['base_template'] = 'office-manager/base.html'
		data['activityform'] = activityform
		data['currentactsform'] = currentactsform
		data['allactsform'] = allactsform

		data['yearlyform'] = yearlyform
		data['firstform'] = firstform
		data['secondform'] = secondform
		data['thirdform'] = thirdform

		return render(request, 'office-manager/addnewactivity.html', data)
		#return HttpResponse('This is GET request')

	def post(self, request, *args, **kwargs):
		activityform = ActivityForm(request.POST, prefix="activityform")
		currentactsform = CurrentactsForm(request.POST, prefix="currentactsform")
		allactsform = AllactsForm(request.POST, prefix="allactsform")

		yearlyform = YearlyAimForm(request.POST, prefix="yearlyform")
		firstform = FirstAimForm(request.POST, prefix="firstform")
		secondform = SecondAimForm(request.POST, prefix="secondform")
		thirdform = ThirdAimForm(request.POST, prefix="thirdform")

		category = request.user.profile.OPMtype.category
		if activityform.is_valid() & currentactsform.is_valid() & allactsform.is_valid() & ( category == "Project"):
			newactivity = activityform.save(commit=False)
            		newactivity.OPMtype = request.user.profile.OPMtype
            		newactivity.formtype = request.user.profile.OPMtype.category			
			newactivity.save()

                    	currentacts = currentactsform.save(commit=False)
			currentacts.form = newactivity
			currentacts.save()

			allacts = allactsform.save(commit=False)
			allacts.form = newactivity
			allacts.save()
			yearly = yearlyform.save(commit=False)
			yearly.form = newactivity
			yearly.save()
			first = firstform.save(commit=False)
			first.form = newactivity
			first.save()
			second = secondform.save(commit=False)
			second.form = newactivity
			second.save()
			third = thirdform.save(commit=False)
			third.form = newactivity
			third.save()
		elif activityform.is_valid() & currentactsform.is_valid() & allactsform.is_valid() & ( category != "Project" ):
			newactivity = activityform.save(commit=False)
            		newactivity.OPMtype = request.user.profile.OPMtype
            		newactivity.formtype = request.user.profile.OPMtype.category			
			newactivity.save()
			yearlyform = yearlyform.save(commit=False)
			yearlyform.form = newactivity
			yearlyform.save()
			firstform = firstform.save(commit=False)
			firstform.form = newactivity
			firstform.save()
			secondform = secondform.save(commit=False)
			secondform.form = newactivity
			secondform.save()
			thirdform = thirdform.save(commit=False)
			thirdform.form = newactivity
			thirdform.save()
			return redirect('supa:dashboard')




#views for office manager
@login_required(login_url='/login/')
@group_required('office-manager')
def allactivity(request, template='', base_template=''):
    forms = Form.objects.filter(OPMtype=request.user.profile.OPMtype)
    data = {}
    data['forms'] = forms
    data['base_template'] = 'office-manager/base.html'
    return render(request, 'office-manager/allactivities.html', data)

@login_required(login_url='/login/')
@group_required('office-manager')
def activitydetail(request, pk, **kwargs):
   	activity = get_object_or_404(Form, pk=pk)
   	data = {}
   	data['activity'] = activity
   	data['base_template'] = 'office-manager/base.html'
   	return render(request, 'office-manager/activitydetail.html', data)

@login_required(login_url='/login/')
@group_required('office-manager')
def allactivityreport(request):
    forms = Form.objects.filter(OPMtype=request.user.profile.OPMtype)
    data = {}
    data['formtype'] = request.user.profile.OPMtype.category 
    data['activities'] = forms
    data['base_template'] = 'office-manager/base.html'
    return render(request, 'office-manager/allactivitiesreport.html', data)


#district wise listing
@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def darchulalist(request, template='', base_template=''):
    darchula = OPMtype.objects.filter(district__exact='दर्चुला' )
    data = {}
    data['darchula_list'] = darchula
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/darchulalist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def kanchanpurlist(request, template='', base_template=''):
    kanchanpur = OPMtype.objects.filter(district__exact='कंचनपुर' )
    data = {}
    data['kanchanpur_list'] = kanchanpur
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/kanchanpurlist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def dadeldhuralist(request, template='', base_template=''):
    dadeldhura = OPMtype.objects.filter(district__exact='डडेलधुरा' )
    data = {}
    data['dadeldhura_list'] = dadeldhura
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/dadeldhuralist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def kailalilist(request, template='', base_template=''):
    kailali = OPMtype.objects.filter(district__exact='कैलाली' )
    data = {}
    data['kailali_list'] = kailali
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/kailalilist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def bajanglist(request, template='', base_template=''):
    bajang = OPMtype.objects.filter(district__exact='बझाङ' )
    data = {}
    data['bajang_list'] = bajang
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/bajanglist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def baitadilist(request, template='', base_template=''):
    baitadi = OPMtype.objects.filter(district__exact='बैतडी' )
    data = {}
    data['baitadi_list'] = baitadi
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/baitadilist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def dotilist(request, template='', base_template=''):
    doti = OPMtype.objects.filter(district__exact='डोटी' )
    data = {}
    data['doti_list'] = doti
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/dotilist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def achhamlist(request, template='', base_template=''):
    achham = OPMtype.objects.filter(district__exact='अछाम' )
    data = {}
    data['achham_list'] = achham
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/achhamlist.html', data)

@login_required(login_url='/login/')
@permission_required('supa.add_office', login_url='/login/')
@template_based_on_user_type('', '', '', '')
def bajuralist(request, template='', base_template=''):
    bajura = OPMtype.objects.filter(district__exact='बाजुरा' )
    data = {}
    data['bajura_list'] = bajura
    data['base_template'] = base_template
    return render(request, 'supa-admin/districtlist/bajuralist.html', data)


@login_required(login_url='/login/')
@template_based_on_user_type('', '', '', '')
def staffactivitylist(request, template='', base_template=''):
    forms = Form.objects.filter(OPMtype=request.user.profile.OPMtype)
    data = {}
    data['forms'] = forms
    data['base_template'] = base_template
    return render(request, 'office-staff/staffactivitylist.html', data)

@login_required(login_url='/login/')
@template_based_on_user_type('', '', '', '')
def staffactivityedit(request, pk, **kwargs):

    staffs = get_object_or_404(Form, pk=pk)
    base_template = kwargs.get('base_template')
    form = FirstProgressForm(request.POST)

    if form.is_valid():
        staffs.first.parinam_progress = request.POST.get('parinam_progress')
        staffs.first.bhar_progress = request.POST.get('bhar_progress')
        staffs.first.laagat_progress = request.POST.get('laagat_progress')
        staffs.first.save()
        return redirect('supa:staffactivity')
    return render(request, 'office-staff/staffactivityedit.html', {'form':form, 'base_template':base_template})
