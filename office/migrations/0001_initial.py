# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Department',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='\u0928\u093e\u092e')),
            ],
        ),
        migrations.CreateModel(
            name='District',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('district', models.CharField(max_length=255, verbose_name='\u091c\u093f\u0932\u094d\u0932\u093e')),
            ],
        ),
        migrations.CreateModel(
            name='Ministry',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='\u0928\u093e\u092e')),
            ],
        ),
        migrations.CreateModel(
            name='Office',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='\u0928\u093e\u092e')),
                ('address', models.CharField(blank=True, max_length=255, verbose_name='\u0920\u0947\u0917\u093e\u0928\u093e')),
                ('email', models.CharField(blank=True, max_length=255, verbose_name='\u0907\u092e\u0947\u0932')),
                ('phone', models.CharField(blank=True, max_length=255, verbose_name='\u092b\u094b\u0928')),
                ('fax', models.CharField(blank=True, max_length=255, verbose_name='\u092b\u094d\u092f\u093e\u0915\u0938')),
                ('office_time', models.CharField(blank=True, max_length=255, verbose_name='\u0915\u093e\u0930\u094d\u092f\u093e\u0932\u092f \u0938\u092e\u092f')),
                ('image', models.ImageField(blank=True, null=True, upload_to='ompimage', verbose_name='\u0924\u0938\u094d\u092c\u093f\u0930')),
                ('department', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='office.Department', verbose_name='\u092c\u093f\u092d\u093e\u0917')),
                ('district', models.ManyToManyField(related_name='office', to='office.District', verbose_name='\u091c\u093f\u0932\u094d\u0932\u093e')),
            ],
        ),
        migrations.AddField(
            model_name='department',
            name='ministry',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='department', to='office.Ministry', verbose_name='\u092e\u0928\u094d\u0924\u094d\u0930\u093e\u0932\u092f'),
        ),
    ]
