from django.core.management.base import BaseCommand

from userrole.models import UserRole
from reports.models import OfficeSetting, FiscalYear
from mole.settings import CURRENT_FISCAL_YEAR


class Command(BaseCommand):

    help = 'Update OfficeSettings and UserRole by current fiscal year'

    def handle(self, *args, **options):
        current_fiscal_year = FiscalYear.objects.get(id=CURRENT_FISCAL_YEAR)

        if OfficeSetting.objects.update(fiscal_year=current_fiscal_year):
            self.stdout.write('Successfully updated OfficeSettings')

        if UserRole.objects.update(fiscal_year=current_fiscal_year):
            self.stdout.write('Successfully updated UserRole ')
