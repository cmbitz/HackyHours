#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Feb 13 12:52:37 2020

@author: andrewpauling
"""


import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import xarray as xr
import os.path
import pickle as pkl
from xcesm import convert_hs2p
import time


fname = 'SOMcontrol_tinterp.pkl'

if os.path.isfile(fname):
    start=time.time()
    print(f'Loading {fname}')

    with open(fname, 'rb') as f:
        t = pkl.load(f)

    print('Done')
    end = time.time()
    print(f'Elapsed time = {end-start}')
else:
    start = time.time()
    print('Interpolating data...')
    ddir = '/Users/andrewpauling/Documents/PhD/isotope/data/som'
    dfile = 'SOMcontrol.cam.h0.T.000101-000112.nc'
    psfile = 'SOMcontrol.cam.h0.PS.000101-000112.nc'
    ncf = os.path.join(ddir, dfile)
    ncps = os.path.join(ddir, psfile)

    ds = xr.open_dataset(ncf)
    dsps = xr.open_dataset(ncps)

    lev = np.array([10., 20., 30., 50., 70., 100., 150., 200., 250.,
                    300., 400., 500., 600., 650., 700., 750., 800., 850.,
                    900., 950., 1000.])

    t = convert_hs2p(ds, 'T', lev, psfile=dsps)

    print('Done')
    print(f'Saving to {fname}')

    with open(fname, 'wb') as f:
        pkl.dump(t, f)

    print('Done')
    end = time.time()
    print(f'Elapsed time = {end-start}')
