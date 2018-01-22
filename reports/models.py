# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models

from office.models import Office
from django.dispatch import receiver
from django.db.models.signals import post_save

class FiscalYear(models.Model):
    date_range = models.CharField(verbose_name="वित्तीय वर्ष", max_length=255)

    def __unicode__(self):
        return u'%s' % (self.date_range)

class OfficeBudget(models.Model):
    budget_year = models.ForeignKey(FiscalYear, verbose_name="वित्तीय वर्ष", related_name="fiscal_year")
    office = models.ForeignKey(Office, verbose_name="कार्यालय", related_name="office")
    unit = models.CharField(verbose_name="युनिट", max_length=255, blank=True, null=True)
    budget_rs = models.FloatField(verbose_name="बजेट", default=0.00)
    nepalsarkar = models.FloatField(verbose_name="नेपाल सरकार", default=0.00)
    sastha = models.FloatField(verbose_name="संस्था", default=0.00)
    janasamglanta = models.FloatField(verbose_name="जनसंग्लग्नता", default=0.00)
    loan = models.FloatField(verbose_name="ऋण", default=0.00)
    upadan = models.FloatField(verbose_name="उपदान", default=0.00)
    dritasastha = models.FloatField(verbose_name="दातृसंस्था", default=0.00)
    antarik = models.FloatField(verbose_name="आन्तरिक", default=0.00)
    baidesikh = models.FloatField(verbose_name="बैदेशिक", default=0.00)

    def __unicode__(self):
        return u'%s' % (self.budget_year)

class OfficeSetting(models.Model):
    fiscal_year = models.ForeignKey(FiscalYear, verbose_name="वित्तीय वर्ष", blank=True, null=True, related_name="settings")
    office = models.OneToOneField(Office, verbose_name="कार्यालय", related_name="settings", on_delete=models.CASCADE)
    is_active = models.BooleanField(default=True)
    

    def __unicode__(self):
        return u'%s' % (self.fiscal_year)

class Months(models.Model):
    month = models.CharField(max_length=25, blank=True)

    def __unicode__(self):
        return u'%s' % (self.month)

    def get_monthly_progress(self, month):
        return self.MonthlyProgress.filter(month__id=month)

AWADHI_CHOICES = (
        (4, 'बार्षिक'),
        (1, 'प्रथम'),
        (2, 'दितिय'),
        (3, 'तृतीय'),
    )

@receiver(post_save, sender=Office)
def update_office_setting(sender, instance, created, **kwargs):
    if created:
        OfficeSetting.objects.create(office=instance)
    fiscal_year = FiscalYear.objects.get(pk=1)
    instance.settings.fiscal_year = fiscal_year
    instance.settings.save()

class KaryaKram(models.Model):
    karyakram = models.ForeignKey('self', verbose_name="कार्यक्रम", blank=True, null=True, related_name="parent", help_text="")
    name = models.CharField(max_length=255, verbose_name="कार्यक्रम",)
    office = models.ForeignKey(Office, verbose_name="कार्यालय", related_name="karyakram")
    code = models.CharField(verbose_name="कोड", max_length=255, null=True, blank=True, help_text="")
    unit = models.CharField(verbose_name="युनिट", max_length=255, blank=True, null=True)
    kriyakalap = models.CharField(verbose_name="कृयाकलाप", max_length=255, null=True, blank=True, help_text="")
    fiscal_year = models.ForeignKey(FiscalYear, verbose_name="वित्तीय वर्ष", blank=True, null=True, related_name="pragatiyear")

    @property
    def is_valid(self):
        return True if self.parent.all().count() else False

    def __unicode__(self):
        return u'%s'%(self.name)

    def get_yearly_lakxya(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.lakxya.filter(awadhi=4)
    def get_yearly_pragati(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.pragati.filter(fiscal_year=fiscal_year, awadhi=4)

    def get_first_lakxya(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.lakxya.filter(fiscal_year=fiscal_year, awadhi=1)
        
    def get_first_pragati(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.pragati.filter(fiscal_year=fiscal_year, awadhi=1)
    
    def get_second_lakxya(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.lakxya.filter(fiscal_year=fiscal_year, awadhi=2)
    def get_second_pragati(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.pragati.filter(fiscal_year=fiscal_year, awadhi=2)
    def get_files_submitted(self):
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.pragati.filter(awadhi=4)

    def get_monthly_progress(self):
        #assign ofice fiscal year on office create
        fiscal_year=OfficeSetting.objects.get(office=self.office, is_active=True).fiscal_year
        return self.monthlyprogress.filter(fiscal_year=fiscal_year).order_by('-month_id')

class MonthlyKaryaKram(models.Model):
    monthly_karyakram = models.ForeignKey('self', verbose_name="मासिक कार्यक्रम", blank=True, null=True, related_name="monthly_parent", help_text="")
    name = models.CharField(max_length=255, verbose_name="मासिक कार्यक्रम",)
    office = models.ForeignKey(Office, verbose_name="कार्यालय", related_name="monthly_karyakram")
    fiscal_year = models.ForeignKey(FiscalYear, verbose_name="वित्तीय वर्ष", related_name="monthly_year")
        
class MonthlyProgress(models.Model):
    karyakram = models.ForeignKey(MonthlyKaryaKram, verbose_name=" कार्यक्रम", related_name="monthlyprogress", help_text="")
    fiscal_year = models.ForeignKey(FiscalYear, verbose_name="वित्तीय वर्ष")
    month=models.ForeignKey(Months, related_name="months")
    pragati = models.TextField(verbose_name="महिनाको प्रगती")
    pragati_till_date = models.TextField(verbose_name="हाल सम्मको प्रगती")
    comments = models.TextField(verbose_name="कैफियत")
    datesubmited = models.CharField(max_length=255, null=True, blank=True)
    dateupdated = models.CharField(max_length=255, null=True, blank=True)

class Lakxya(models.Model):
    karyakram = models.ForeignKey(KaryaKram, verbose_name=" कार्यक्रम", related_name="lakxya", help_text="")
    paridam = models.FloatField(verbose_name="परिमाण", default=0.00)
    var = models.FloatField(verbose_name="भार", default=0.00)
    budget = models.FloatField(verbose_name="बजेट", default=0.00)
    awadhi = models.IntegerField(verbose_name="अवधि", choices=AWADHI_CHOICES, default=0)
    datesubmited = models.CharField(max_length=255, null=True, blank=True)
    dateupdated = models.CharField(max_length=255, null=True, blank=True)

    def __unicode__(self):
        return u'%s'%(self.paridam)

class Pragati(models.Model):
    karyakram = models.ForeignKey(KaryaKram, verbose_name="कार्यक्रम", related_name="pragati", help_text="")
    paridam = models.FloatField(verbose_name="परिमाण", default=0.00)
    var = models.FloatField(verbose_name="भार", default=0.00)
    budget = models.FloatField(verbose_name="बजेट", default=0.00)
    abp_paridam = models.FloatField(verbose_name="परिमाण", default=0.00)
    abp_var = models.FloatField(verbose_name="भार", default=0.00)
    abp_budget = models.FloatField(verbose_name="बजेट", default=0.00)
    pas_paridam = models.FloatField(verbose_name="परिमाण", default=0.00)
    pas_var = models.FloatField(verbose_name="भार", default=0.00)
    pas_budget = models.FloatField(verbose_name="बजेट", default=0.00)
    cmh_paridam = models.FloatField(verbose_name="परिमाण", default=0.00)
    cmh_var = models.FloatField(verbose_name="भार", default=0.00)
    cmh_budget = models.FloatField(verbose_name="बजेट", default=0.00)
    Kaufiyat = models.TextField(verbose_name="कैफियत", null=True, blank=True, help_text="")
    awadhi = models.IntegerField(verbose_name="अवधि", choices=AWADHI_CHOICES, default=1)
    additional_file = models.FileField(verbose_name="फाइल अपलोड", null=True, blank=True)
    file_name = models.FileField(verbose_name="फाइल name", null=True, blank=True)
    datesubmited = models.CharField(max_length=255, null=True, blank=True)
    dateupdated = models.CharField(max_length=255, null=True, blank=True)


class PragatiHistory(models.Model):
    paridam = models.FloatField(verbose_name="परिमाण", default=0.00)
    var = models.FloatField(verbose_name="भार", default=0.00)
    budget = models.FloatField(verbose_name="बजेट", default=0.00)
    pragati = models.ForeignKey(Pragati, verbose_name="प्रगती", related_name="history")


class LakxyaHistory(models.Model):
    paridam = models.FloatField(verbose_name="परिमाण", default=0.00)
    var = models.FloatField(verbose_name="भार", default=0.00)
    budget = models.FloatField(verbose_name="बजेट", default=0.00)
    lakxya = models.ForeignKey(Lakxya, verbose_name="लक्ष्य",  related_name="history")


#Months.objects.raw('SELECT * FROM reports_months LEFT JOIN reports_monthlyprogress ON reports_months.id = reports_monthlyprogress.month_id')
