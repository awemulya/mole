# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-06 06:12
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('reports', '0002_auto_20170706_0517'),
    ]

    operations = [
        migrations.RenameField(
            model_name='lakxya',
            old_name='datesubmitted',
            new_name='datesubmited',
        ),
        migrations.RenameField(
            model_name='pragati',
            old_name='datesubmitted',
            new_name='datesubmited',
        ),
    ]
