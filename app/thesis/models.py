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
    n_rows=20
    number_rows=10
    
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

    trustchoice0 = models.IntegerField(verbose_name='Donated amount: $1 -> Multiplied amount: $3', min=0, max=3)
    trustchoice1 = models.IntegerField(verbose_name='Donated amount: $2 -> Multiplied amount: $6', min=0, max=6)
    trustchoice2 = models.IntegerField(verbose_name='Donated amount: $3 -> Multiplied amount: $9', min=0, max=9)
    trustchoice3 = models.IntegerField(verbose_name='Donated amount: $4 -> Multiplied amount: $12', min=0, max=12)
    trustchoice4 = models.IntegerField(verbose_name='Donated amount: $5 -> Multiplied amount: $15', min=0, max=15)
    trustchoice5 = models.IntegerField(verbose_name='Donated amount: $6 -> Multiplied amount: $18', min=0, max=18)
    trustchoice6 = models.IntegerField(verbose_name='Donated amount: $7 -> Multiplied amount: $21', min=0, max=21)
    trustchoice7 = models.IntegerField(verbose_name='Donated amount: $8 -> Multiplied amount: $24', min=0, max=24)
    trustchoice8 = models.IntegerField(verbose_name='Donated amount: $9 -> Multiplied amount: $27', min=0, max=27)
    trustchoice9 = models.IntegerField(verbose_name='Donated amount: $10 -> Multiplied amount: $30', min=0, max=30)
    trustchoice10 = models.IntegerField()

    choice0 = models.BooleanField(verbose_name='I have signed an online petition / shared a cause on social media', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice1 = models.BooleanField(verbose_name='I have given directions to a stranger', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice2 = models.BooleanField(verbose_name='I have gone out of my way to meet with someone to help them with a task (e.g. help proofread their paper, listen to their presentation, etc)', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice3 = models.BooleanField(verbose_name='I have donated money at the cash register when buying groceries', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice4 = models.BooleanField(verbose_name='I have given money to a stranger (or an acquaintance I don’t know too well) in need', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice5 = models.BooleanField(verbose_name='I have donated instead of sold my clothes/used items', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice6 = models.BooleanField(verbose_name='I have donated to a charity', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice7 = models.BooleanField(verbose_name='I have donated blood', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice8 = models.BooleanField(verbose_name='I have done volunteer work for a charity/organization', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice9 = models.BooleanField(verbose_name='I have delayed an elevator/held door open for stranger(s)', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice10 = models.BooleanField(verbose_name='I have allowed someone to go ahead of me in line', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice11 = models.BooleanField(verbose_name='I have lent an acquaintance that I don’t know too well with something of value to me (clothes, tools, etc)', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice12 = models.BooleanField(verbose_name='I have pointed out a clerk’s error (at a supermarket, restaurant) in undercharging me', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice13 = models.BooleanField(verbose_name='I have let an acquaintance that I don’t know too well stay at my place', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice14 = models.BooleanField(verbose_name='I have donated money/coins into Salvation army bell-ringers', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice15 = models.BooleanField(verbose_name='I have helped a classmate who I did not know that well with a homework assignment when my knowledge was greater than his/hers', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice16 = models.BooleanField(verbose_name='I have offered to give a ride to someone without asking to be paid for it', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice17 = models.BooleanField(verbose_name='I have helped carry a stranger’s belongings (e.g. groceries)', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice18 = models.BooleanField(verbose_name='I have offered my seat on a bus/train to a stranger who was standing', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)
    choice19 = models.BooleanField(verbose_name='I have helped an acquaintance with moving in/ moving out of their dorm/apartment/house', choices=['Never', 'Once', 'More than once', 'Often', 'Very often'],
                                    widget = widgets.RadioSelect)








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








