# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-14 09:01
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('reports', '0021_auto_20180114_0859'),
    ]

    operations = [
        migrations.AlterField(
            model_name='monthlyprogress',
            name='karyakram',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='monthlyprogress', to='reports.MonthlyKaryaKram', verbose_name=' \u0915\u093e\u0930\u094d\u092f\u0915\u094d\u0930\u092e'),
        ),
    ]