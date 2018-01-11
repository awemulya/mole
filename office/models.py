# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

# Create your models here.

class Ministry(models.Model):
	name = models.CharField(verbose_name="नाम", max_length=255)

	def __unicode__(self):
		return u'%s'%(self.name)

class Department(models.Model):
	ministry = models.ForeignKey(Ministry, verbose_name="मन्त्रालय", related_name="department", on_delete=models.CASCADE)
	name = models.CharField(verbose_name="नाम", max_length=255)

	def __unicode__(self):
		return u'%s'%(self.ministry) + " -- " + u'%s'%(self.name)

class District(models.Model):
	district = models.CharField(verbose_name="जिल्ला", max_length=255)
	
	def __unicode__(self):
		return u'%s'%(self.district)


class Office(models.Model):
	name = models.CharField(verbose_name="नाम", max_length=255)
	address = models.CharField(verbose_name="ठेगाना", max_length=255, blank=True)
	#district = models.ManyToManyField(District, verbose_name="जिल्ला", related_name="office")
	email = models.CharField(verbose_name="इमेल", max_length=255, blank=True)
	description = models.TextField(verbose_name="विवरण", null=True, blank=True)
	phone = models.CharField(verbose_name="फोन", max_length=255, blank=True)
	fax = models.CharField(verbose_name="फ्याकस", max_length=255, blank=True)
	office_time = models.CharField(verbose_name="कार्यालय समय", max_length=255, blank=True)
	image = models.ImageField(verbose_name="तस्बिर", upload_to='ompimage', null=True, blank=True)
	department = models.ForeignKey(Department, verbose_name="बिभाग", on_delete=models.CASCADE)
	lat = models.CharField(max_length=255, blank=True)
	lon = models.CharField(max_length=255, blank=True)
	
	def __unicode__(self):
		return u'%s'%(self.name)

	def get_latest_yearly_pragati(self):
		return Pragati.objects.filter(karyakram__office = a)