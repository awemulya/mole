# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-28 07:55
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reports', '0037_auto_20180128_0753'),
    ]

    operations = [
        migrations.AddField(
            model_name='monthlykaryakram',
            name='datesubmited',
            field=models.DateTimeField(auto_now_add=True, max_length=255, null=True),
        ),
        migrations.AddField(
            model_name='monthlykaryakram',
            name='dateupdated',
            field=models.DateTimeField(auto_now=True, max_length=255, null=True),
        ),
    ]