import os
import pickle


class MetaData(object):
    """ CMIP6 storage of data path and info. """

    def __init__(self, main_dir=None, my_dir=None):
        """"""
        self.main_dir = main_dir
        self.my_dir = my_dir
        self.model = {}
        #self.my_model = {}
        
    def add_main_model(self, mod_name='CESM2', center='NCAR', model_label=None, runn=['r1i1p1f1'],sicvar='siconc',volvar='sivol',mldvar='mlotst',grid='gn'):
        """Add a model in the main dir"""

        mod_dir = os.path.join(self.main_dir, center, mod_name)

        # Add directory
        self.model[mod_name] = {'dir': mod_dir, 'grid': grid, 'runn': runn, 'sicvar':sicvar, 'volvar':volvar, 'mldvar':mldvar, 'grid':grid, 'center':center }

        if model_label==None:
             model_label = mod_name

        # Add model label name
        self.model[mod_name]['label'] = model_label

        
    def add_my_model(self, mod_name='CESM2', center=None, model_label=None, runn=['r1i1p1f1'],sicvar='siconc',volvar='sivol',mldvar='mlotst',grid='gn'):
        """Add a model in my dir"""

        mod_dir = os.path.join(self.my_dir)

        # Add directory
        self.model[mod_name] = {'dir': mod_dir, 'grid': grid, 'runn': runn, 'sicvar':sicvar, 'volvar':volvar, 'mldvar':mldvar, 'grid':grid, 'center':center }

        if model_label==None:
             model_label = mod_name

        # Add model label name
        self.model[mod_name]['label'] = model_label

        
    def save(self, filename='CMIP6_DATA.pkl'):
        with open(os.path.join('./', filename), 'wb') as output:  # Overwrites any existing file.
            pickle.dump(self, output, pickle.HIGHEST_PROTOCOL)    
            
    def load(filename='CMIP6_DATA.pkl'):
        return pickle.load( open( os.path.join('./', filename), 'rb' ) )

