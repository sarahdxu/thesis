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
    number_rows=11
    
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
    dictator_donation = models.CurrencyField(min=0, max=10)
    generalized_dictator_donation = models.CurrencyField()
    dictator_keep = models.CurrencyField()
    generalized_dictator_keep = models.CurrencyField()
    generalized_dictator_give = models.CurrencyField()
    ultimatum1_donation=models.CurrencyField(min=0, max=10)
    ultimatum1_keep = models.CurrencyField()
    trust1_donation = models.CurrencyField(min=0, max=10)
    trust1_keep = models.CurrencyField()
    public_donation = models.CurrencyField(min=0, max=10)

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

    trustchoice1 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 1 point, i.e. you received 3 points?', min=0, max=3)
    trustchoice2 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 2 points, i.e. you received 6 points?', min=0, max=6)
    trustchoice3 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 3 points, i.e. you received 9 points?', min=0, max=9)
    trustchoice4 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 4 points, i.e. you received 12 points?', min=0, max=12)
    trustchoice5 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 5 points, i.e. you received 15 points?', min=0, max=15)
    trustchoice6 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 6 points, i.e. you received 18 points?', min=0, max=18)
    trustchoice7 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 7 points, i.e. you received 21 points?', min=0, max=21)
    trustchoice8 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 8 points, i.e. you received 24 points?', min=0, max=24)
    trustchoice9 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 9 points, i.e. you received 27 points?', min=0, max=27)
    trustchoice10 = models.IntegerField(verbose_name='How much would you give back to Player 1 if they gave you 10 points, i.e. you received 30 points)?', min=0, max=30)
    # trustchoice10 = models.IntegerField()

    choice0 = models.PositiveIntegerField(verbose_name='I have allowed someone to go ahead of me in line',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice1 = models.PositiveIntegerField(verbose_name='I have given directions to a stranger',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)
    choice2 = models.PositiveIntegerField(verbose_name='I have gone out of my way to meet with someone to help them with a task (e.g. help proofread their paper, listen to their presentation, etc)',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice3 = models.PositiveIntegerField(verbose_name='I have donated money at the cash register when buying groceries',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice4 = models.PositiveIntegerField(verbose_name='I have given money to a stranger (or an acquaintance I don’t know too well) in need',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice5 = models.PositiveIntegerField(verbose_name='I have donated instead of sold my clothes/used items',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice6 = models.PositiveIntegerField(verbose_name='I have donated to a charity',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice7 = models.PositiveIntegerField(verbose_name='I have donated blood',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice8 = models.PositiveIntegerField(verbose_name='I have done volunteer work for a charity/organization',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice9 = models.PositiveIntegerField(verbose_name='I have delayed an elevator/held door open for stranger(s)',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)
    choice10 = models.PositiveIntegerField(verbose_name='I have signed an online petition / shared a cause on social media',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice11 = models.PositiveIntegerField(verbose_name='I have lent an acquaintance that I don’t know too well with something of value to me (clothes, tools, etc)',
                                        choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice12 = models.PositiveIntegerField(verbose_name='I have pointed out a clerk’s error (at a supermarket, restaurant) in undercharging me',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice13 = models.PositiveIntegerField(verbose_name='I have let an acquaintance that I don’t know too well stay at my place',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)
    choice14 = models.PositiveIntegerField(verbose_name='I have donated money/coins into Salvation army bell-ringers',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice15 = models.PositiveIntegerField(verbose_name='I have helped a classmate who I did not know that well with a homework assignment when my knowledge was greater than his/hers',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice16 = models.PositiveIntegerField(verbose_name='I have offered to give a ride to someone without asking to be paid for it',
                                        choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)

    choice17 = models.PositiveIntegerField(verbose_name='I have helped carry a stranger’s belongings (e.g. groceries)',
                                        choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)
    choice18 = models.PositiveIntegerField(verbose_name='I have offered my seat on a bus/train to a stranger who was standing',
                                        choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
                                    widget = widgets.RadioSelect)
    choice19 = models.PositiveIntegerField(verbose_name='I have helped an acquaintance with moving in/ moving out of their dorm/apartment/house',
                                            choices=[
                                                [1, 'Never'],
                                                [2, 'Once'],
                                                [3, 'More than once'],
                                                [4, 'Often'],
                                                [5, 'Very often'],
                                                ],
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








