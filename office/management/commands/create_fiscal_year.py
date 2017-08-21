# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.management.base import BaseCommand
from reports.models import FiscalYear

class Command(BaseCommand):
    help = 'Create default Fiscal Year'

    def handle(self, *args, **options):

        fiscal_year_list = ['२०७२-२०७३ ','२०७३-२०७४','२०७४-२०७५','२०७५-२०७६','२०७६-२०७७']

        for fiscal_year in fiscal_year_list:
            new_fiscal_year, created = FiscalYear.objects.get_or_create(date_range=fiscal_year)
            if created:
                self.stdout.write('Successfully created fiscal year .. "%s"' % fiscal_year)