# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('office', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='FiscalYear',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('date_range', models.CharField(max_length=255, verbose_name='\u0935\u093f\u0924\u094d\u0924\u0940\u092f \u0935\u0930\u094d\u0937')),
            ],
        ),
        migrations.CreateModel(
            name='KaryaKram',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255, verbose_name='\u0915\u093e\u0930\u094d\u092f\u0915\u094d\u0930\u092e')),
                ('code', models.CharField(blank=True, max_length=15, null=True, verbose_name='\u0915\u094b\u0921')),
                ('unit', models.CharField(max_length=15, verbose_name='\u092f\u0941\u0928\u093f\u091f')),
                ('kriyakalap', models.CharField(blank=True, max_length=15, null=True, verbose_name='\u0915\u0943\u092f\u093e\u0915\u0932\u093e\u092a')),
                ('karyakram', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='parent', to='reports.KaryaKram', verbose_name='\u0915\u093e\u0930\u094d\u092f\u0915\u094d\u0930\u092e')),
                ('office', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='karyakram', to='office.Office', verbose_name='\u0915\u093e\u0930\u094d\u092f\u093e\u0932\u092f')),
            ],
        ),
        migrations.CreateModel(
            name='Lakxya',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('paridam', models.FloatField(default=0.0, verbose_name='\u092a\u0930\u093f\u092e\u093e\u0923')),
                ('var', models.FloatField(default=0.0, verbose_name='\u092d\u093e\u0930')),
                ('budget', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('awadhi', models.IntegerField(choices=[(0, '\u092c\u093e\u0930\u094d\u0937\u093f\u0915'), (1, '\u092a\u094d\u0930\u0925\u092e'), (2, '\u0926\u093f\u0924\u093f\u092f'), (3, '\u0924\u0943\u0924\u0940\u092f')], default=0, verbose_name='\u0905\u0935\u0927\u093f')),
                ('fiscal_year', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='lakxya', to='reports.FiscalYear', verbose_name='\u0935\u093f\u0924\u094d\u0924\u0940\u092f \u0935\u0930\u094d\u0937')),
                ('karyakram', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='lakxya', to='reports.KaryaKram', verbose_name=' \u0915\u093e\u0930\u094d\u092f\u0915\u094d\u0930\u092e')),
            ],
        ),
        migrations.CreateModel(
            name='LakxyaHistory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('paridam', models.FloatField(default=0.0, verbose_name='\u092a\u0930\u093f\u092e\u093e\u0923')),
                ('var', models.FloatField(default=0.0, verbose_name='\u092d\u093e\u0930')),
                ('budget', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('lakxya', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='history', to='reports.Lakxya', verbose_name='\u0932\u0915\u094d\u0937\u094d\u092f')),
            ],
        ),
        migrations.CreateModel(
            name='OfficeBudget',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('budget_rs', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('nepalsarkar', models.FloatField(default=0.0, verbose_name='\u0928\u0947\u092a\u093e\u0932 \u0938\u0930\u0915\u093e\u0930')),
                ('sastha', models.FloatField(default=0.0, verbose_name='\u0938\u0902\u0938\u094d\u0925\u093e')),
                ('janasamglanta', models.FloatField(default=0.0, verbose_name='\u091c\u0928\u0938\u0902\u0917\u094d\u0932\u0917\u094d\u0928\u0924\u093e')),
                ('loan', models.FloatField(default=0.0, verbose_name='\u090b\u0923')),
                ('upadan', models.FloatField(default=0.0, verbose_name='\u0909\u092a\u0926\u093e\u0928')),
                ('dritasastha', models.FloatField(default=0.0, verbose_name='\u0926\u093e\u0924\u0943\u0938\u0902\u0938\u094d\u0925\u093e')),
                ('antarik', models.FloatField(default=0.0, verbose_name='\u0906\u0928\u094d\u0924\u0930\u093f\u0915')),
                ('baidesikh', models.FloatField(default=0.0, verbose_name='\u092c\u0948\u0926\u0947\u0936\u093f\u0915')),
                ('budget_year', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='fiscal_year', to='reports.FiscalYear', verbose_name='\u0935\u093f\u0924\u094d\u0924\u0940\u092f \u0935\u0930\u094d\u0937')),
                ('office', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='office', to='office.Office', verbose_name='\u0915\u093e\u0930\u094d\u092f\u093e\u0932\u092f')),
            ],
        ),
        migrations.CreateModel(
            name='OfficeSetting',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('is_active', models.BooleanField(default=True)),
                ('fiscal_year', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='settings', to='reports.FiscalYear', verbose_name='\u0935\u093f\u0924\u094d\u0924\u0940\u092f \u0935\u0930\u094d\u0937')),
                ('office', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, related_name='settings', to='office.Office', verbose_name='\u0915\u093e\u0930\u094d\u092f\u093e\u0932\u092f')),
            ],
        ),
        migrations.CreateModel(
            name='Pragati',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('paridam', models.FloatField(default=0.0, verbose_name='\u092a\u0930\u093f\u092e\u093e\u0923')),
                ('var', models.FloatField(default=0.0, verbose_name='\u092d\u093e\u0930')),
                ('budget', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('abp_paridam', models.FloatField(default=0.0, verbose_name='\u092a\u0930\u093f\u092e\u093e\u0923')),
                ('abp_var', models.FloatField(default=0.0, verbose_name='\u092d\u093e\u0930')),
                ('abp_budget', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('pas_paridam', models.FloatField(default=0.0, verbose_name='\u092a\u0930\u093f\u092e\u093e\u0923')),
                ('pas_var', models.FloatField(default=0.0, verbose_name='\u092d\u093e\u0930')),
                ('pas_budget', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('cmh_paridam', models.FloatField(default=0.0, verbose_name='\u092a\u0930\u093f\u092e\u093e\u0923')),
                ('cmh_var', models.FloatField(default=0.0, verbose_name='\u092d\u093e\u0930')),
                ('cmh_budget', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('Kaufiyat', models.TextField(blank=True, null=True, verbose_name='\u0915\u0948\u092b\u093f\u092f\u0924')),
                ('awadhi', models.IntegerField(choices=[(0, '\u092c\u093e\u0930\u094d\u0937\u093f\u0915'), (1, '\u092a\u094d\u0930\u0925\u092e'), (2, '\u0926\u093f\u0924\u093f\u092f'), (3, '\u0924\u0943\u0924\u0940\u092f')], default=1, verbose_name='\u0905\u0935\u0927\u093f')),
                ('additional_file', models.FileField(blank=True, null=True, upload_to=b'', verbose_name='\u092b\u093e\u0907\u0932 \u0905\u092a\u0932\u094b\u0921')),
                ('fiscal_year', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pragati', to='reports.FiscalYear', verbose_name='\u0935\u093f\u0924\u094d\u0924\u0940\u092f \u0935\u0930\u094d\u0937')),
                ('karyakram', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='pragati', to='reports.KaryaKram', verbose_name='\u0915\u093e\u0930\u094d\u092f\u0915\u094d\u0930\u092e')),
            ],
        ),
        migrations.CreateModel(
            name='PragatiHistory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('paridam', models.FloatField(default=0.0, verbose_name='\u092a\u0930\u093f\u092e\u093e\u0923')),
                ('var', models.FloatField(default=0.0, verbose_name='\u092d\u093e\u0930')),
                ('budget', models.FloatField(default=0.0, verbose_name='\u092c\u091c\u0947\u091f')),
                ('pragati', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='history', to='reports.Pragati', verbose_name='\u092a\u094d\u0930\u0917\u0924\u0940')),
            ],
        ),
    ]
