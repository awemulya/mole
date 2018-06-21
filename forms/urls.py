from django.conf.urls import url

from forms.views import DarbandiVivaranCreateView, DarbandiVivaranListView, DarbandiVivaranUpdateView
from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'^darbandi-vivaran-create/$', DarbandiVivaranCreateView.as_view(), name='darbandi-create'),
    url(r'^darbandi-vivaran-list/$', DarbandiVivaranListView.as_view(), name='darbandi-list'),
    url(r'^darbandi-vivaran-update/(?P<pk>\d+)/$', DarbandiVivaranUpdateView.as_view(), name='darbandi-update'),
]