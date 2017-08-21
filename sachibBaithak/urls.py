from django.conf.urls import url
from sachibBaithak.views import BudgetBaktabyaListView, BudgetBaktabyaCreateView, BudgetBaktabyaUpdateView, SachibBaithakCreateView, SachibBaithakmainUpdateView, SachibBaithakMainCreateView,SachibBaithakListView, SachibBaithakadminUpdateView, SachibBaithakMainListView, SachibBaithakuserUpdateView
app_name = 'sachibBaithak'

urlpatterns = [
    url(r'^create/(?P<office>[0-9]+)/(?P<main_id>[0-9]+)/$', SachibBaithakCreateView.as_view(), name='sachibbaithak-create'),
    url(r'^maincreate/(?P<office>[0-9]+)/$', SachibBaithakMainCreateView.as_view(), name='sachibbaithak-main-create'),
    url(r'^mainupdate/(?P<office>[0-9]+)/(?P<pk>[0-9]+)/$', SachibBaithakmainUpdateView.as_view(), name='sachibbaithak-main-update'),
    url(r'^mainlist/(?P<office>[0-9]+)/$', SachibBaithakMainListView.as_view(), name='sachibbaithak-main-list'),
    url(r'^baithaklist/(?P<office>[0-9]+)/(?P<pk>[0-9]+)/$', SachibBaithakListView.as_view(), name='sachibbaithak-list'),
    url(r'^adminupdate/(?P<office>[0-9]+)/(?P<pk>[0-9]+)/$', SachibBaithakadminUpdateView.as_view(), name='sachibbaithak-admin-update'),
    url(r'^userupdate/(?P<office>[0-9]+)/(?P<pk>[0-9]+)/$', SachibBaithakuserUpdateView.as_view(), name='sachibbaithak-user-update'),
    url(r'^budgetbaktabyalist/(?P<office>[0-9]+)/$', BudgetBaktabyaListView.as_view(), name='budgetbaktabya-list'),
    url(r'^budgetbaktabya/create/(?P<office>[0-9]+)/$', BudgetBaktabyaCreateView.as_view(), name='budgetbaktabya-create'),
    url(r'^budgetbaktabya/update/(?P<office>[0-9]+)/(?P<pk>[0-9]+)/$', BudgetBaktabyaUpdateView.as_view(), name='budgetbaktabya-update'),
    
   ]