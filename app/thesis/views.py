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




class Introduction(Page):
    # form_fields=['contribution']
    """Description of the game: How to play and returns expected"""

    def vars_for_template(self):
        self.player.endowment = Constants.endowment
        return {'endowment': self.player.endowment}

    def is_displayed(self):
        return self.round_number==1

    # def vars_for_template(self):
    #     x = self.player.contribution
    #     return {'x': x}


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
    form_fields = ['generalized_dictator_donation']



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
    Introduction,
    Dictator,
    DictatorResults,
    GeneralizedDictator,
    GeneralizedDictatorResults,
    Ultimatum1,
    Trust1,
    PublicGoods,
    # ResultsWaitPage,
    # Information_Earnings,
    # Information_Wage,


]
