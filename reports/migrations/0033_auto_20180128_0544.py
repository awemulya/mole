# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-28 05:44
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('reports', '0032_auto_20180125_0902'),
    ]

    operations = [
        migrations.AlterField(
            model_name='lakxya',
            name='datesubmited',
            field=models.DateTimeField(auto_now_add=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='lakxya',
            name='dateupdated',
            field=models.DateTimeField(auto_now=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='monthlyprogress',
            name='datesubmited',
            field=models.DateTimeField(auto_now_add=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='monthlyprogress',
            name='dateupdated',
            field=models.DateTimeField(auto_now=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='pragati',
            name='datesubmited',
            field=models.DateTimeField(auto_now_add=True, max_length=255, null=True),
        ),
        migrations.AlterField(
            model_name='pragati',
            name='dateupdated',
            field=models.DateTimeField(auto_now=True, max_length=255, null=True),
        ),
    ]
