# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-02-19 16:48
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('karyasampadan', '0002_auto_20180122_0538'),
    ]

    operations = [
        migrations.RenameField(
            model_name='sampadanmonthlyprogress',
            old_name='sampadan_karyakram',
            new_name='sampadankaryakram',
        ),
    ]