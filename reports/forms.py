from django import forms

from reports.models import KaryaKram, Lakxya, Pragati, OfficeSetting, MonthlyKaryaKram, MonthlyProgress


class KaryakramForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        # first call parent's constructor
        super(KaryakramForm, self).__init__(*args, **kwargs)
        # there's a `fields` property now
        self.fields['office'].required = False
        self.fields['office'].label = ""



    class Meta:
        model = KaryaKram
        exclude = ('karyakram', 'code', 'unit', 'kriyakalap', )

        widgets = {'office': forms.HiddenInput()}


class ChildKaryakramForm(forms.ModelForm):

    def __init__(self, *args, **kwargs):
        # first call parent's constructor
        super(ChildKaryakramForm, self).__init__(*args, **kwargs)
        # there's a `fields` property now
        self.fields['office'].required = False
        self.fields['office'].label = ""
        self.fields['karyakram'].label = ""


    class Meta:
        model = KaryaKram
        exclude = ('kriyakalap', 'fiscal_year',)
        widgets = {'office': forms.HiddenInput(), 'karyakram': forms.HiddenInput()}



class LakxyaForm(forms.ModelForm):
    class Meta:
        model = Lakxya
        exclude = ('karyakram', 'awadhi', 'datesubmited', 'dateupdated',)


class PragatiForm(forms.ModelForm):
    class Meta:
        model = Pragati
        exclude = ('karyakram', 'awadhi', 'datesubmited', 'dateupdated',)


class OfficeSettingsForm(forms.ModelForm):

    class Meta:
        model = OfficeSetting
        exclude = ("is_active","office")

class MonthlyProgressForm(forms.ModelForm):

    class Meta:
        model = MonthlyProgress
        exclude = ('id','karyakram', 'month', 'fiscal_year', 'datesubmited', 'dateupdated', 'pragati_till_date')


class MonthlyKaryakramForm(forms.ModelForm):

   
    class Meta:
        model = MonthlyKaryaKram
        exclude = ('monthly_karyakram', 'office', )



class MonthlyChildKaryakramForm(forms.ModelForm):

    class Meta:
        model = MonthlyKaryaKram
        exclude = ('monthly_karyakram', 'office', )
    