# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-28 10:20
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('reports', '0041_remove_monthlyprogress_office'),
    ]

    operations = [
        migrations.RenameField(
            model_name='monthlyprogress',
            old_name='karyakram',
            new_name='monthlykaryakram',
        ),
    ]
