from otree.api import (
    models, widgets, BaseConstants, BaseSubsession, BaseGroup, BasePlayer, 
    Currency as c, currency_range
)
import random
import json
from django import forms

author = 'Your name here'

doc = """
A quiz app that reads its questions from a spreadsheet
(see triangle.csv in this directory).
There is 1 set of payoffs withing the triangle per page;
the number of pages in the game
is determined by the number of payoff sets in the CSV.
See the comment below about how to randomize the order of pages.
"""

#Defines attributes of game that remain constant throughout game
class Constants(BaseConstants):
    name_in_url = 'thesis'
    players_per_group = None
    num_rounds=1
    num_rows=11
    
    endowment = c(10)
    


class Subsession(BaseSubsession):

    pass

#Defines how groups opterate
#Since we do not have groups, class is not used
class Group(BaseGroup):

    pass






#Defines attributes for each player
class Player(BasePlayer):

    endowment = models.CurrencyField()
    dictator_donation = models.CurrencyField()
    generalized_dictator_donation = models.CurrencyField()
    dictator_keep = models.CurrencyField()
    generalized_dictator_keep = models.CurrencyField()
    generalized_dictator_give = models.CurrencyField()
    ultimatum1_donation=models.CurrencyField()
    ultimatum1_keep = models.CurrencyField()
    trust1_donation = models.CurrencyField()
    trust1_keep = models.CurrencyField()
    public_donation = models.CurrencyField()

    #strategy method
    ultchoice0 = models.BooleanField()
    ultchoice1 = models.BooleanField()
    ultchoice2 = models.BooleanField()
    ultchoice3 = models.BooleanField()
    ultchoice4 = models.BooleanField()
    ultchoice5 = models.BooleanField()
    ultchoice6 = models.BooleanField()
    ultchoice7 = models.BooleanField()
    ultchoice8 = models.BooleanField()
    ultchoice9 = models.BooleanField()
    ultchoice10 = models.BooleanField()

    ult_amount = models.IntegerField()

    trustchoice0 = models.IntegerField()
    trustchoice1 = models.IntegerField()
    trustchoice2 = models.IntegerField()
    trustchoice3 = models.IntegerField()
    trustchoice4 = models.IntegerField()
    trustchoice5 = models.IntegerField()
    trustchoice6 = models.IntegerField()
    trustchoice7 = models.IntegerField()
    trustchoice8 = models.IntegerField()
    trustchoice9 = models.IntegerField()
    trustchoice10 = models.IntegerField()







    def dictator_keep(self):
        self.dictator_keep = self.endowment - self.dictator_donation

    def generalized_dictator(self):
        self.generalized_dictator_keep = self.endowment - self.generalized_dictator_donation
        self.generalized_dictator_give = 2*self.generalized_dictator_donation

    def ultimatum1(self):
        self.ultimatum1_keep = self.endowment - self.ultimatum1
        self.ultimatum1_give = self.ultimatum1_donation

    # def trust1(self):
    #     self.trust1_keep = self.endowment - self.trust1_donation








