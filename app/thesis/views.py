from otree.api import Currency as c, currency_range
from otree.api import safe_json
from . import models
from ._builtin import Page, WaitPage
from .models import Constants
import numpy as np
import sys
import time
from otree.models_concrete import (PageTimeout, PageCompletion)
import random
import collections
import json 




class Games_Introduction(Page):
    # form_fields=['contribution']
    """Description of the game: How to play and returns expected"""

    def vars_for_template(self):
        self.player.endowment = Constants.endowment
        self.player.endowment100 = Constants.endowment100
        self.player.endowment80 = Constants.endowment80
        self.player.endowment75=Constants.endowment75
        self.player.endowment60=Constants.endowment60
        self.player.endowment40=Constants.endowment40

        return {'endowment': self.player.endowment}

    def is_displayed(self):
        return self.round_number==1

    # def vars_for_template(self):
    #     x = self.player.contribution
    #     return {'x': x}

class SRA_Introduction(Page):

    def vars_for_template(self):
        return {'hi': 'hi'}


#This class sends information to the Questions.html page
class Dictator(Page):
    form_model = models.Player
    #form_fields = ['answer']
    form_fields = ['dictator_donation']



    def vars_for_template(self):
        
        return {'x': 'Dictator Game'}

class GeneralizedDictator(Page):
    form_model = models.Player
    #form_fields = ['answer']
    form_fields = ['gendictator{}'.format(i) for i in range(0, Constants.number_rows)]


    def vars_for_template(self):
        
        return {'x': 'Generalized Dictator Game'}


class Ultimatum1(Page):
    form_model = models.Player
    #form_fields = ['answer']
    form_fields = ['ultimatum1_donation']



    def vars_for_template(self):
        
        return {'x': 'Ultimatum Game 1'}

class Trust1(Page):
    form_model = models.Player
    #form_fields = ['answer']
    form_fields = ['trust1_donation']



    def vars_for_template(self):
        
        return {'x': 'Trust Game 1'}


class PublicGoods(Page):
    form_model = models.Player
    form_fields = ['public_donation']

    def vars_for_template(self):
        return {'x': 'Public Goods Game'}


class Ultimatum2(Page):
    form_model = models.Player
    form_fields = ['ultchoice{}'.format(i) for i in range(0, Constants.num_rows)]
    #Need to figure out how to make this currency and not just numbers.
    #In HTML page, I put in $ sign before, but need to be currency - ok for showing purposes right now

    # def before_next_page(self):
    #     # find normalized payoff
    #     self.session.vars['ult_amount'] = [self.player.ultchoice0,
    #                                         self.player.ultchoice1,
    #                                         self.player.ultchoice2,
    #                                         self.player.ultchoice3,
    #                                         self.player.ultchoice4,
    #                                         self.player.ultchoice5,
    #                                         self.player.ultchoice6,
    #                                         self.player.ultchoice7,
    #                                         self.player.ultchoice8,
    #                                         self.player.ultchoice9,
    #                                         self.player.ultchoice10].index(False)


    def vars_for_template(self):
        return {'x': 'Ultimatum Game 2',
                'choice_numbers': range(0, Constants.num_rows)
                }


class Trust2(Page):
    form_model=models.Player
    form_fields = ['trustchoice{}'.format(i) for i in range(1, Constants.number_rows)]

    

    def vars_for_template(self):
        hi=[]
        for i in range(0,Constants.num_rows):
            hi.append(3*i)
        return{'x': 'Trust Game 2',
                'choice_numbers': range(1, Constants.number_rows),
                'multiplied': hi}

class SRA(Page):
    form_model = models.Player
    form_fields = ['choice{}'.format(i) for i in range(0, Constants.n_rows)]

    def vars_for_template(self):
        return{'x': 'SRA'}
        

#This class sends information to Results.html
class DictatorResults(Page):


    def vars_for_template(self):
        self.player.dictator_keep()
        
        return {'keep': self.player.dictator_keep,}

class GeneralizedDictatorResults(Page):


    def vars_for_template(self):
        self.player.generalized_dictator()
        
        return {'keep': self.player.generalized_dictator_keep,
                'give': self.player.generalized_dictator_give,
                'donate': self.player.generalized_dictator_donation}


# class Ultimatum1Results(Page):

#     def vars_for_template(self):
#         self.player.ultimatum1()
#         return{'keep': self.player.ultimatum1_keep}

page_sequence = [
    Games_Introduction,
    Dictator,
    # DictatorResults,
    GeneralizedDictator,
    # GeneralizedDictatorResults,
    Ultimatum1,
    Trust1,
    PublicGoods,
    Ultimatum2,
    Trust2,
    SRA_Introduction,
    SRA,

    # ResultsWaitPage,
    # Information_Earnings,
    # Information_Wage,


]
