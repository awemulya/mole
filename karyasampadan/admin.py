# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin

from .models import SampadanKaryakram, SampadanMonthlyProgress
admin.site.register(SampadanKaryakram)
admin.site.register(SampadanMonthlyProgress)
