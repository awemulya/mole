# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-28 11:24
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('reports', '0042_auto_20180128_1020'),
    ]

    operations = [
        migrations.RenameField(
            model_name='monthlyprogress',
            old_name='monthlykaryakram',
            new_name='karyakram',
        ),
    ]
