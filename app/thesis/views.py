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
class Question(Page):
    form_model = models.Player
    #form_fields = ['answer']
    form_fields = ['donation']



    def vars_for_template(self):
        
        return {'x': 'Your Decision'}


        

#This class sends information to Results.html
class Results(Page):


    def vars_for_template(self):
        self.player.keep()
        
        return {'keep': self.player.keep,}

page_sequence = [
    Introduction,
    Question,
    # ResultsWaitPage,
    # Information_Earnings,
    # Information_Wage,
    Results,

]
