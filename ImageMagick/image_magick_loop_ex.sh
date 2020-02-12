#!/bin/bash

#List of different  regions--NO COMMAS
region_array=("Barents Sea" "Central Arctic" "East Greenland Sea" "Kara-Laptev" "panArctic")

#Now, we'll loop through each region and place our scatter plot and bias plot next to each other.  We'll resize the images to be the same size, and add a white  border of 20 pixels to each panel.

for i in "${region_array[@]}"; do
    #
    echo "now running region "$i""
    #
    convert -bordercolor white -border 30 -resize 650x450 +append min_SIE_vs_VRILE_count_"$i"_obs.png predicted_vs_actual_minimum_SIE_"$i"_obs.png SCATTER_AND_BIAS_"$i"_obs.png
    #
    echo "saving region "$i""

done
