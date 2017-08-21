# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.models import User, Group
from django.db import models
from django.utils.translation import gettext as _
from django.db.models.signals import post_save
from django.dispatch import receiver
import datetime
class Post(models.Model):
	post = models.TextField(max_length=30)
	value = models.TextField(max_length=30)

	def __str__(self):
		return self.post



class Office(models.Model):
	name = models.CharField(max_length=255)
	address = models.CharField(max_length=255, blank=True)
	district = models.CharField(max_length=255, blank=True)
	email = models.CharField(max_length=255, blank=True)
	phone = models.CharField(max_length=255, blank=True)
	fax = models.CharField(max_length=255, blank=True)
	yearly_budget = models.CharField(max_length=255, blank=True)
	office_time = models.CharField(max_length=255, blank=True)
	no_of_workers = models.CharField(max_length=255, blank=True)
	vehicle = models.CharField(max_length=255, blank=True)
	head_name = models.CharField(max_length=255, blank=True)
	head_post = models.CharField(max_length=255, blank=True)
	head_phone_no = models.CharField(max_length=255, blank=True)
	head_assign_date = models.CharField(max_length=255, blank=True)
	head_act_time = models.CharField(max_length=255, blank=True)
	infoofficer_name = models.CharField(max_length=255, blank=True)
	infoofficer_post = models.CharField(max_length=255, blank=True)
	infoofficer_phone_no = models.CharField(max_length=255, blank=True)
	infoofficer_assign_date = models.CharField(max_length=255, blank=True)
	infoofficer_act_time = models.CharField(max_length=255, blank=True)
	accountant_name = models.CharField(max_length=255, blank=True)
	accountant_post = models.CharField(max_length=255, blank=True)
	accountant_phone_no = models.CharField(max_length=255, blank=True)
	accountant_assign_date = models.CharField(max_length=255, blank=True)
	accountant_act_time = models.CharField(max_length=255, blank=True)

	OPMimage = models.ImageField(upload_to='ompimage', null=True, blank=True)


	def __unicode__(self):
		return u'%s'%(self.name)




class Profile(models.Model):
	user = models.OneToOneField(User, on_delete=models.CASCADE)
	Offices = models.ForeignKey(Office, on_delete=models.CASCADE, blank=True, null=True)
	email_isconfirmed = models.BooleanField(default=False)
	#post = models.ForeignKey(Post, on_delete=models.CASCADE, default='4')
	name = models.CharField(max_length=30, blank=True)
	phoneno = models.CharField(max_length=30, blank=True)

	assign_date = models.DateField(null=True, blank=True)
	birth_date = models.DateField(null=True, blank=True)
	#photo_url = models.CharField(max_length=30, null=True)
	photo = models.ImageField(null=True, blank=True)


	def __str__(self):
		return str(self.user)

@receiver(post_save, sender=User)
def update_user_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)
    instance.profile.save()



class GroupProfile(models.Model):
    group = models.OneToOneField(Group, unique=True)
    level = models.IntegerField(primary_key=True)
    
    def __str__(self):
		return str(self.group)
# Create your models here.


class Form(models.Model):

	#name = models.CharField(max_length=30)
	formtype = models.CharField(max_length=10, blank=True)

	title = models.TextField(blank=True)
	karchasirsak = models.TextField(blank=True)
	ekai = models.CharField(max_length=30, blank=True)
	Office = models.ForeignKey(Office, on_delete=models.CASCADE)
	createdon = models.DateField(_("Date"), default=datetime.date.today)
	updatedon = models.DateField(default=datetime.date.today)
	def __unicode__(self):
		return u'%s'%(self.title)

# @receiver(post_save, sender=Form)
# def update_forms(sender, instance, created, **kwargs):
#     if created:
#     	if instance.formtype == "Project":
#     		a = Form.formtype
#     		# Currentacts.objects.create(form=instance)
#     		# Allacts.objects.create(form=instance)
#     		# instance.currentacts.save()
#     		# instance.allacts.save()
        
#     	# Yearly.objects.create(form=instance)
#     	# First.objects.create(form=instance)
#      #    Second.objects.create(form=instance)
#      #    Third.objects.create(form=instance)
#         Form_status.objects.create(form=instance)
#     # instance.yearly.save()
#     # instance.first.save()
#     # instance.second.save()
#     # instance.third.save()
#     instance.form_status.save()




class Yearly(models.Model):
	form = models.OneToOneField(Form, unique=True)
	parinam_aim = models.CharField(max_length=30, blank=True)
	bhar_aim = models.CharField(max_length=30, blank=True)
	budget_aim = models.CharField(max_length=30, blank=True)
	
	parinam_progress = models.CharField(max_length=30, blank=True)
	bhar_progress = models.CharField(max_length=30, blank=True)
	laagat_progress = models.CharField(max_length=30, blank=True)


	createdon = models.DateField(_("Date"), default=datetime.date.today)
	updatedon = models.DateField(default=datetime.date.today)

	def __unicode__(self):
		return u'%s'%(self.form.title)

class First(models.Model):
	form = models.OneToOneField(Form, unique=True)

	parinam_aim = models.CharField(max_length=30, blank=True)
	bhar_aim = models.CharField(max_length=30, blank=True)
	budget_aim = models.CharField(max_length=30, blank=True)
	
	parinam_progress = models.CharField(max_length=30, blank=True)
	bhar_progress = models.CharField(max_length=30, blank=True)
	laagat_progress = models.CharField(max_length=30, blank=True)

	createdon = models.DateField(_("Date"), default=datetime.date.today)
	updatedon = models.DateField(default=datetime.date.today)

	def __unicode__(self):
		return u'%s'%(self.form.title)

class Second(models.Model):
	form = models.OneToOneField(Form, unique=True)

	parinam_aim = models.CharField(max_length=30, blank=True)
	bhar_aim = models.CharField(max_length=30, blank=True)
	budget_aim = models.CharField(max_length=30, blank=True)
	
	parinam_progress = models.CharField(max_length=30, blank=True)
	bhar_progress = models.CharField(max_length=30, blank=True)
	laagat_progress = models.CharField(max_length=30, blank=True)


	createdon = models.DateField(_("Date"), default=datetime.date.today)
	updatedon = models.DateField(default=datetime.date.today)

	def __unicode__(self):
		return u'%s'%(self.form.title)

class Third(models.Model):
	form = models.OneToOneField(Form, unique=True)

	parinam_aim = models.CharField(max_length=30, blank=True)
	bhar_aim = models.CharField(max_length=30, blank=True)
	budget_aim = models.CharField(max_length=30, blank=True)
	
	parinam_progress = models.CharField(max_length=30, blank=True)
	bhar_progress = models.CharField(max_length=30, blank=True)
	laagat_progress = models.CharField(max_length=30, blank=True)


	createdon = models.DateField(_("Date"), default=datetime.date.today)
	updatedon = models.DateField(default=datetime.date.today)

	def __unicode__(self):
		return u'%s'%(self.form.title)


class Form_status(models.Model):
	V_STATUS = (
		('v', 'verified'),
		('u', 'unverified'),
		)
	C_STATUS = (
		('c', 'complete'),
		('u', 'uncomplete'),
		)
	form = models.OneToOneField(Form, on_delete=models.CASCADE)
	v_status = models.CharField(max_length=1, choices=V_STATUS, default='u')
	C_status = models.CharField(max_length=1, choices=C_STATUS, default='u')

	def __unicode__(self):
		return u'%s'%(self.form.title)
