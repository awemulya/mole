from django import forms
from .models import SachibBaithak, SachibBaithakMain, BudgetBaktabya

class SachibBaithakAdminForm(forms.ModelForm):
    class Meta:
        model = SachibBaithak
        exclude = ( 'datesubmited', 'dateupdated', 'sachibbaithakmain')

class SachibBaithakListForm(forms.ModelForm):
    class Meta:
        model = SachibBaithak
        exclude = ()

class SachibBaithakAdminCreateForm(forms.ModelForm):
    class Meta:
        model = SachibBaithak
        exclude = ( 'datesubmited', 'dateupdated', 'karyanayan_awastha', 'sachibbaithakmain',)

class SachibBaithakMainForm(forms.ModelForm):
    class Meta:
        model = SachibBaithakMain
        exclude = ( 'datesubmited', 'dateupdated', 'office')

class SachibBaithakUserForm(forms.ModelForm):
    class Meta:
        model = SachibBaithak
        exclude = ( 'datesubmited', 'dateupdated', 'nirnayaharu', 'samaya_sima', 'fiscal_year', 'jimmewar_nikaya', 'sachibbaithakmain')

class BudgetBaktabyaForm(forms.ModelForm):
    class Meta:
        model = BudgetBaktabya
        exclude = ( 'datesubmited', 'dateupdated', 'office')