from django.conf.urls import url
from django.contrib import admin
from django.conf.urls import include, url
from django.conf import settings
from django.conf.urls.static import static
# from office.views import DashboardView
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^users/', include("users.urls", namespace="users")),
    url(r'^reports/', include("reports.urls", namespace="reports")),
    url(r'', include("office.urls", namespace="office")),
    url(r'^userrole/', include("userrole.urls", namespace="role")),
    # url(r'^sachibbaithak/', include("sachibBaithak.urls", namespace="sachibBaithak")),
    # url(r'^karyasampadan/', include("karyasampadan.urls", namespace="karyasampadan")),
    url(r'^comments/', include("comments.urls", namespace="comments")),
    url(r'^forms/', include("forms.urls", namespace="forms")),
              ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
# urlpatterns += url(r'^$', DashboardView.as_view(), name='dashboard'),


if settings.DEBUG:
    import debug_toolbar
    urlpatterns = [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns


