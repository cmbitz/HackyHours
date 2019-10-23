#!/bin/bash

# put this script on your laptop and run it after you run remote_notebook.sh on sipn.atmos.uw.edu
# you may have to change the 9999 to some other port if it was used
# I recommend you select some random number that no one else is likely to use
# so perhaps 9921 or 9955 or whatever

ssh -N -f -L localhost:9999:localhost:9999 bitz@sipn.atmos.uw.edu
