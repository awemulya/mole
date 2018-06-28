# -*- coding: utf-8 -*-
from django.http import HttpResponse
from django.urls import reverse_lazy
from django.views.generic import TemplateView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic.list import ListView

from forms.models import DarbandiVivaran, BhautikPurwadhar, RajaswaVivaran,\
 BerujuVivaran, AawashekBajet, PrastawitKaryakram, NaksaShrestaVivaran



class FormDashboardView(TemplateView):
    template_name = "forms/form_dashboard.html"


class DarbandiVivaranCreateView(CreateView):
    model = DarbandiVivaran
    template_name = "forms/darbarndi_vivaran_create.html"
    success_url = reverse_lazy("forms:darbandi_list")
    fields = '__all__'


class DarbandiVivaranListView(ListView):
    model = DarbandiVivaran
    paginate_by = 10
    template_name = "forms/darbarndi_vivaran_list.html"


# class DarbandiVivaranDetailView(DetailView):
#     model = DarbandiVivaran
#     template_name = "forms/darbarndi_vivaran_detail.html"


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


class RajaswaVivaranUpdateView(UpdateView):
    model = RajaswaVivaran
    fields = '__all__'
    template_name = "forms/rajaswa_vivaran_create.html"
    success_url = reverse_lazy("forms:rajaswa_list")


class BerujuVivaranCreateView(CreateView):
    model = BerujuVivaran
    template_name = "forms/beruju_vivaran_create.html"
    success_url = reverse_lazy("forms:beruju_create")
    fields = '__all__'


class BerujuVivaranListView(ListView):
    model = BerujuVivaran
    paginate_by = 10
    template_name = "forms/beruju_vivaran_list.html"


class BerujuVivaranUpdateView(UpdateView):
    model = BerujuVivaran
    fields = '__all__'
    template_name = "forms/beruju_vivaran_create.html"
    success_url = reverse_lazy("forms:beruju_list")


class BerujuVivaranCreateView(CreateView):
    model = BerujuVivaran
    template_name = "forms/beruju_vivaran_create.html"
    success_url = reverse_lazy("forms:beruju_create")
    fields = '__all__'


class BerujuVivaranListView(ListView):
    model = BerujuVivaran
    paginate_by = 10
    template_name = "forms/beruju_vivaran_list.html"


class BerujuVivaranUpdateView(UpdateView):
    model = BerujuVivaran
    fields = '__all__'
    template_name = "forms/beruju_vivaran_create.html"
    success_url = reverse_lazy("forms:beruju_list")


class AawashekBajetCreateView(CreateView):
    model = AawashekBajet
    template_name = "forms/aawashek_bajet_create.html"
    success_url = reverse_lazy("forms:aawashek_bajet_create")
    fields = '__all__'


class AawashekBajetListView(ListView):
    model = AawashekBajet
    paginate_by = 10
    template_name = "forms/aawashek_bajet_list.html"


class AawashekBajetUpdateView(UpdateView):
    model = AawashekBajet
    fields = '__all__'
    template_name = "forms/aawashek_bajet_create.html"
    success_url = reverse_lazy("forms:aawashek_bajet_list")


class PrastawitKaryakramCreateView(CreateView):
    model = PrastawitKaryakram
    template_name = "forms/prastawit_karyakram_create.html"
    success_url = reverse_lazy("forms:prastawit_karyakram_create")
    fields = '__all__'


class PrastawitKaryakramListView(ListView):
    model = PrastawitKaryakram
    paginate_by = 10
    template_name = "forms/prastawit_karyakram_list.html"


class PrastawitKaryakramUpdateView(UpdateView):
    model = PrastawitKaryakram
    fields = '__all__'
    template_name = "forms/prastawit_karyakram_create.html"
    success_url = reverse_lazy("forms:prastawit_karyakram_list")


class NaksaShrestaVivaranCreateView(CreateView):
    model = NaksaShrestaVivaran
    template_name = "forms/naksa_shrestavivaran_create.html"
    success_url = reverse_lazy("forms:naksa_shrestavivaran_create")
    fields = '__all__'


class NaksaShrestaVivaranListView(ListView):
    model = NaksaShrestaVivaran
    paginate_by = 10
    template_name = "forms/naksa_shrestavivaran_list.html"


class NaksaShrestaVivaranUpdateView(UpdateView):
    model = NaksaShrestaVivaran
    fields = '__all__'
    template_name = "forms/naksa_shrestavivaran_create.html"
    success_url = reverse_lazy("forms:naksa_shrestavivaran_list")