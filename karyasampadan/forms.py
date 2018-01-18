from django import forms

from .models import SampadanKaryakram, SampadanMonthlyProgress


class MonthlyProgressForm(forms.ModelForm):

    class Meta:
        model = SampadanMonthlyProgress
        exclude = ('id','sampadan_karyakram', 'month', 'fiscal_year', 'datesubmited', 'dateupdated', 'pragati_till_date')


class MonthlyKaryasampadanForm(forms.ModelForm):

   
    class Meta:
        model = SampadanKaryakram
        exclude = ('main_suchak', 'office', )



class MonthlyChildKaryasampadanForm(forms.ModelForm):

    class Meta:
        model = SampadanKaryakram
        exclude = ('main_suchak', 'office',)
    