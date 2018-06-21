# -*- coding: utf-8 -*-
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic.list import ListView

from forms.models import DarbandiVivaran


def index(request):
    return HttpResponse("Hello, world.")


class DarbandiVivaranCreateView(CreateView):
    model = DarbandiVivaran
    template_name = "forms/darbarndi_vivaran_create.html"
    success_url = reverse_lazy("forms:darbandi-list")
    fields = '__all__'


class DarbandiVivaranListView(ListView):
    model = DarbandiVivaran
    paginate_by = 10
    template_name = "forms/darbarndi_vivaran_list.html"


class DarbandiVivaranDetailView(DetailView):
    model = DarbandiVivaran
    template_name = "forms/darbarndi_vivaran_detail.html"


class DarbandiVivaranUpdateView(UpdateView):
    model = DarbandiVivaran
    fields = '__all__'
    template_name = "forms/darbarndi_vivaran_create.html"
    success_url = reverse_lazy("forms:darbandi-list")

