# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from .models import KaryaKram, FiscalYear, Lakxya, Pragati, OfficeBudget, OfficeSetting, MonthlyProgress, Months, MonthlyKaryaKram
admin.site.register(KaryaKram)
admin.site.register(FiscalYear)
admin.site.register(Lakxya)
admin.site.register(Pragati)
admin.site.register(OfficeBudget)
admin.site.register(OfficeSetting)
admin.site.register(MonthlyKaryaKram)
admin.site.register(MonthlyProgress)
admin.site.register(Months)