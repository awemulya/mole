# -*- coding: utf-8 -*-
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic.list import ListView

from forms.models import DarbandiVivaran, BhautikPurwadhar, RajaswaVivaran


def index(request):
    return HttpResponse("Hello, world.")


class DarbandiVivaranCreateView(CreateView):
    model = DarbandiVivaran
    template_name = "forms/darbarndi_vivaran_create.html"
    success_url = reverse_lazy("forms:darbandi_list")
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
    success_url = reverse_lazy("forms:darbandi_list")


class BhautikPurwadharCreateView(CreateView):
    model = BhautikPurwadhar
    template_name = "forms/bhautik_purwadhar_create.html"
    success_url = reverse_lazy("forms:bhautik_create")
    fields = '__all__'


class BhautikPurwadharListView(ListView):
    model = BhautikPurwadhar
    paginate_by = 10
    template_name = "forms/bhautik_purwadhar_list.html"


class BhautikPurwadharDetailView(DetailView):
    model = BhautikPurwadhar
    template_name = "forms/bhautik_purwadhar_detail.html"


class BhautikPurwadharUpdateView(UpdateView):
    model = BhautikPurwadhar
    fields = '__all__'
    template_name = "forms/bhautik_purwadhar_create.html"
    success_url = reverse_lazy("forms:bhautik_list")



class RajaswaVivaranCreateView(CreateView):
    model = RajaswaVivaran
    template_name = "forms/rajaswa_vivaran_create.html"
    success_url = reverse_lazy("forms:rajaswa_create")
    fields = '__all__'


class RajaswaVivaranListView(ListView):
    model = RajaswaVivaran
    paginate_by = 10
    template_name = "forms/rajaswa_vivaran_list.html"


class RajaswaVivaranDetailView(DetailView):
    model = RajaswaVivaran
    template_name = "forms/rajaswa_vivaran_detail.html"


class RajaswaVivaranUpdateView(UpdateView):
    model = RajaswaVivaran
    fields = '__all__'
    template_name = "forms/rajaswa_vivaran_create.html"
    success_url = reverse_lazy("forms:rajaswa_list")