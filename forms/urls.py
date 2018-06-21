from django.conf.urls import url

from forms.views import DarbandiVivaranCreateView, DarbandiVivaranListView,\
 DarbandiVivaranUpdateView, BhautikPurwadharCreateView, BhautikPurwadharListView,\
  BhautikPurwadharUpdateView, RajaswaVivaranCreateView, RajaswaVivaranListView,\
   RajaswaVivaranUpdateView
from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^darbandi-vivaran-create/$', DarbandiVivaranCreateView.as_view(), name='darbandi_create'),
    url(r'^darbandi-vivaran-list/$', DarbandiVivaranListView.as_view(), name='darbandi_list'),
    url(r'^darbandi-vivaran-update/(?P<pk>\d+)/$', DarbandiVivaranUpdateView.as_view(), name='darbandi_update'),
    url(r'^bhautik-purwadhar-create/$', BhautikPurwadharCreateView.as_view(), name='bhautik_create'),
    url(r'^bhautik-purwadhar-list/$', BhautikPurwadharListView.as_view(), name='bhautik_list'),
    url(r'^bhautik-purwadhar-update/(?P<pk>\d+)/$', BhautikPurwadharUpdateView.as_view(), name='bhautik_update'),
    url(r'^rajaswa-vivaran-create/$', RajaswaVivaranCreateView.as_view(), name='rajaswa_create'),
    url(r'^rajaswa-vivaran-list/$', RajaswaVivaranListView.as_view(), name='rajaswa_list'),
    url(r'^rajaswa-vivaran-update/(?P<pk>\d+)/$', RajaswaVivaranUpdateView.as_view(), name='rajaswa_update'),
]
