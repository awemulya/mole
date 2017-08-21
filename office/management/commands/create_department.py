# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.management.base import BaseCommand
from django.contrib.auth.models import Group
from office.models import Department, Ministry

class Command(BaseCommand):
    help = 'Create default Department'

    def handle(self, *args, **options):
        ministry1, created = Ministry.objects.get_or_create(name="test")
        
        department_list = ['कृषि बिभाग', 'शिक्षा बिभाग','स्वास्थ्य बिभाग ','जल तथा मौसम बिभाग','घरेलु तथा साना उद्योग बिभाग','सडक बिभाग','पशु सेवा बिभाग',
         ]
        for department in department_list:
            new_department, created = Department.objects.get_or_create(name=department, ministry=ministry1)
            if created:
                self.stdout.write('Successfully created department .. "%s"' % department)