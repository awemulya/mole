# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime

from django.db import models

# Create your models here.


SHRENI_TYPES = (
    (0, 'क श्रेणी'),
    (1, 'ख श्रेणी'),
    (2, 'ग श्रेणी'),
    (3, 'घ श्रेणी'),
    (4, 'ङ श्रेणी'),
)


class PrashasanikVivaran(models.Model):
    type = models.IntegerField(choices=SHRENI_TYPES, default=0)
    pramukh_naam = models.CharField(max_length=50)


    def __str__(self):
        return self.pramukh_naam


class DarbandiVivaran(models.Model):
    pad_naam = models.CharField(max_length=50)
    shreni = models.CharField(max_length=50)
    darbandi_sankhya = models.IntegerField(default=0)
    padpurti_sankhya = models.IntegerField(default=0)
    rikta_sankhya = models.IntegerField(default=0)
    mag_gareko_sankhya = models.IntegerField(default=0)
    ramana_huna_banki = models.IntegerField(default=0)
    phajil_sankhya = models.IntegerField(default=0)
    kaifiyat = models.CharField(max_length=250, null=True, blank=True)
    office = models.CharField(max_length=50)

    def __str__(self):
        return self.pad_naam


class BhautikPurwadhar(models.Model):
    bibaran = models.CharField(max_length=250)
    parimand = models.IntegerField(default=0)
    chalu_halat = models.IntegerField(default=0)
    bigreko = models.IntegerField(default=0)
    marmat = models.IntegerField(default=0)
    kaifiyat = models.CharField(max_length=250, null=True, blank=True)
    office = models.CharField(max_length=50)

    def __str__(self):
        return self.bibaran


class AamdaniKharcha(models.Model):
    sirshak = models.CharField(max_length=50)
    biniyojit = models.IntegerField(default=0)
    kharcha = models.IntegerField(default=0)
    prapta_rakam = models.IntegerField(default=0)
    kharcha_bibaran = models.IntegerField(default=0)
    kaifiyat = models.CharField(max_length=250, null=True, blank=True)

    def __str__(self):
        return self.sirshak


class RajaswaVivaran(models.Model):
    rajaswo_sirshak = models.CharField(max_length=50)
    rakam = models.IntegerField(default=0)

    def __str__(self):
        return self.rajaswo_sirshak


class BerujuVivaran(models.Model):
    beruju_prakar = models.CharField(max_length=250)
    beruju_rakam = models.IntegerField(default=0)
    phachheut_rakam = models.IntegerField(default=0)
    phachheut_banki_rakam = models.IntegerField(default=0)
    samparichhyan_rakam = models.IntegerField(default=0)
    kaifiyat = models.CharField(max_length=250, null=True, blank=True)

    def __str__(self):
        return self.beruju_prakar  


class DharautiAarthikVivaran(models.Model):
    aamdani = models.IntegerField(default=0)
    kharcha = models.IntegerField(default=0)
    banki = models.IntegerField(default=0)
    nagat_banki = models.IntegerField(default=0)

    def __str__(self):
        return self.aamdani


class AawashekBajet(models.Model):
    sirshak = models.CharField(max_length=50)
    rakam = models.IntegerField(default=0)

    def __str__(self):
        return self.sirshak


class PrastawitKaryakram(models.Model):
    karyakram = models.CharField(max_length=50)
    yikai = models.CharField(max_length=50)
    lachhya = models.CharField(max_length=50)
    bajet_anuman = models.IntegerField(default=0)
    kaifiyat = models.CharField(max_length=250, null=True, blank=True)

    def __str__(self):
        return self.karyakram



class NaksaShrestaVivaran(models.Model):
    vivaran = models.CharField(max_length=250)
    parimand = models.IntegerField(default=0)
    kaifiyat = models.CharField(max_length=250, null=True, blank=True)

    def __str__(self):
        return self.vivaran

