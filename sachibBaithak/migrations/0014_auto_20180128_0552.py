# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-28 05:52
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sachibBaithak', '0013_auto_20180128_0550'),
    ]

    operations = [
        migrations.AlterField(
            model_name='budgetbaktabya',
            name='datesubmited',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='\u092a\u0947\u0936 \u0917\u0930\u093f\u090f\u0915\u094b \u0938\u092e\u092f '),
        ),
        migrations.AlterField(
            model_name='budgetbaktabya',
            name='dateupdated',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='\u0938\u091a\u094d\u092f\u093e\u0907\u090f\u0915\u094b \u0938\u092e\u092f '),
        ),
        migrations.AlterField(
            model_name='sachibbaithak',
            name='datesubmited',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='\u092a\u0947\u0936 \u0917\u0930\u093f\u090f\u0915\u094b \u0938\u092e\u092f '),
        ),
        migrations.AlterField(
            model_name='sachibbaithak',
            name='dateupdated',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='\u0938\u091a\u094d\u092f\u093e\u0907\u090f\u0915\u094b \u0938\u092e\u092f '),
        ),
        migrations.AlterField(
            model_name='sachibbaithakmain',
            name='datesubmited',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='\u092a\u0947\u0936 \u0917\u0930\u093f\u090f\u0915\u094b \u0938\u092e\u092f '),
        ),
        migrations.AlterField(
            model_name='sachibbaithakmain',
            name='dateupdated',
            field=models.CharField(blank=True, max_length=255, null=True, verbose_name='\u0938\u091a\u094d\u092f\u093e\u0907\u090f\u0915\u094b \u0938\u092e\u092f '),
        ),
    ]
