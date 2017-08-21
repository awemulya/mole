# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.core.management.base import BaseCommand
from django.contrib.auth.models import Group
from office.models import Ministry

class Command(BaseCommand):
    help = 'Create default Ministry'

    def handle(self, *args, **options):
        Ministry_list = ['कृषि विकास मन्त्रालय','शिक्षा मन्त्रालय','संघीय मामिला र स्थानीय विकास मन्त्रालय','स्वास्थ्य मन्त्रालय','भौतिक पूर्वाधार र यातायात मन्त्रालय',
                         'जनसंख्या र वातावरण मन्त्रालय','घरेलु तथा साना उद्योग मन्त्रालय','महिला बालबालिका तथा समाज कल्याण मन्त्रालय','पशुपन्छी विकास मन्त्रालय ',
                         'सिचाई मन्त्रालय'

        ]
        for ministry in Ministry_list:
            new_ministry, created = Ministry.objects.get_or_create(name=ministry)
            if created:
                self.stdout.write('Successfully created ministry .. "%s"' % ministry)
