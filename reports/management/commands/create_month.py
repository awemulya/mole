# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.management.base import BaseCommand
from reports.models import Months

class Command(BaseCommand):
    help = 'Create default Months'

    def handle(self, *args, **options):

        months_list = ['बैशाख', 'जेठ', 'असार', 'श्रावण', 'भदौ', 'आश्विन', 'कार्तिक', 'मंसिर', 'पुष', 'माघ', 'फाल्गुन', 'चैत्र']

        for month in months_list:
            new_month, created = Months.objects.get_or_create(month=month)
            if created:
                self.stdout.write('Successfully created month .. "%s"' % month)