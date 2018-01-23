# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from reports.models import Office, FiscalYear, Months, KaryaKram, OfficeSetting


from django.db import models

class SampadanKaryakram(models.Model):
    main_suchak = models.ForeignKey('self', verbose_name="मुख्य सूचक", blank=True, null=True, related_name="karyasampadan_parent", help_text="")
    name = models.CharField(max_length=255, verbose_name="सूचक",)
    office = models.ForeignKey(Office, verbose_name="निकाय")
    fiscal_year = models.ForeignKey(FiscalYear, verbose_name="वित्तीय वर्ष")

    def get_monthly_progress(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.sampadan_monthlyprogress.filter(fiscal_year=fiscal_year).order_by('-month_id')
        # fiscal_year=self.office.OfficeSetting.fiscal_year
        #      return self.sampadan_monthlyprogress.filter(fiscal_year=fiscal_year).order_by('-month_id')
        #        
class SampadanMonthlyProgress(models.Model):
    sampadan_karyakram = models.ForeignKey(SampadanKaryakram, verbose_name=" कार्यक्रम", related_name="sampadan_monthlyprogress", help_text="")
    fiscal_year = models.ForeignKey(FiscalYear, verbose_name="वित्तीय वर्ष")
    month=models.ForeignKey(Months)
    pragati = models.TextField(verbose_name="महिनाको प्रगती")
    pragati_till_date = models.TextField(verbose_name="हाल सम्मको प्रगती")
    comments = models.TextField(verbose_name="कैफियत")
    datesubmited = models.CharField(max_length=255, null=True, blank=True)
    dateupdated = models.CharField(max_length=255, null=True, blank=True)
 