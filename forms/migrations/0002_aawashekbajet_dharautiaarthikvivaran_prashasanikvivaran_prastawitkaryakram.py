# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-06-24 09:32
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('forms', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='AawashekBajet',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('sirshak', models.CharField(max_length=50)),
                ('rakam', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='DharautiAarthikVivaran',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('aamdani', models.IntegerField(default=0)),
                ('kharcha', models.IntegerField(default=0)),
                ('banki', models.IntegerField(default=0)),
                ('nagat_banki', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='PrashasanikVivaran',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('type', models.IntegerField(choices=[(0, '\u0915 \u0936\u094d\u0930\u0947\u0923\u0940'), (1, '\u0916 \u0936\u094d\u0930\u0947\u0923\u0940'), (2, '\u0917 \u0936\u094d\u0930\u0947\u0923\u0940'), (3, '\u0918 \u0936\u094d\u0930\u0947\u0923\u0940'), (4, '\u0919 \u0936\u094d\u0930\u0947\u0923\u0940')], default=0)),
                ('pramukh_naam', models.CharField(max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='PrastawitKaryakram',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('karyakram', models.CharField(max_length=50)),
                ('yikai', models.CharField(max_length=50)),
                ('lachhya', models.CharField(max_length=50)),
                ('bajet_anuman', models.IntegerField(default=0)),
                ('kaifiyat', models.CharField(blank=True, max_length=250, null=True)),
            ],
        ),
    ]