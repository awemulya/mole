# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime

from django.db import models

# Create your models here.

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




		