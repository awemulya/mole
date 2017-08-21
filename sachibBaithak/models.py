# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from reports.models import FiscalYear
from office.models import Office

# Create your models here.
class SachibBaithakMain(models.Model):
    office = models.ForeignKey(Office)
    dateofbaithak = models.CharField(verbose_name="बैठक गरिएको मिति ", max_length=10, null=True, blank=True)
    chairmanship = models.CharField(verbose_name="अध्यक्षता ", max_length=10, null=True, blank=True)
    datesubmited = models.CharField(verbose_name="पेश गरिएको समय ", max_length=10, null=True, blank=True)
    dateupdated = models.CharField(verbose_name="सच्याइएको समय ", max_length=10, null=True, blank=True)

class SachibBaithak(models.Model):

    fiscal_year = models.ForeignKey(FiscalYear,verbose_name="वित्तीय वर्ष")
    sachibbaithakmain = models.ForeignKey(SachibBaithakMain)
    datesubmited = models.CharField(verbose_name="पेश गरिएको समय ", max_length=10, null=True, blank=True)
    dateupdated = models.CharField(verbose_name="सच्याइएको समय ", max_length=10, null=True, blank=True)
    nirnayaharu = models.TextField(verbose_name="निर्णयहरु ")
    jimmewar_nikaya = models.CharField(verbose_name="जिम्मेवार निकाय ", max_length=100)
    karyanayan_awastha = models.TextField(verbose_name="कर्यनयन अवस्था ")
    samaya_sima = models.CharField(verbose_name="समय सिमा ", max_length=100)

class BudgetBaktabya(models.Model):
    office = models.ForeignKey(Office)
    budhano = models.CharField(verbose_name="बुदा न", max_length=10, null=True, blank=True)
    karyakrams = models.TextField(verbose_name="कार्यक्रमहरु ", max_length=10, null=True, blank=True)
    pragati = models.TextField(verbose_name="प्रगति ", max_length=10, null=True, blank=True)
    problems = models.TextField(verbose_name="समस्या ", max_length=10, null=True, blank=True)
    solutions = models.TextField(verbose_name="सावधान ", max_length=10, null=True, blank=True)
    datesubmited = models.CharField(verbose_name="पेश गरिएको समय ", max_length=10, null=True, blank=True)
    dateupdated = models.CharField(verbose_name="सच्याइएको समय ", max_length=10, null=True, blank=True)