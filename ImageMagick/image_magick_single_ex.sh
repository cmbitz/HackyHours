#!/bin/bash

#Convert a PNG to a PDF

convert min_SIE_vs_VRILE_count_panArctic_obs.png min_SIE_vs_VRILE_count_panArctic_obs.pdf

echo "converted image from PNG to PDF"

#Now, convert the PNG to a PDF, but shrink it by 25% using the resize command

convert min_SIE_vs_VRILE_count_panArctic_obs.png -resize 75% min_SIE_vs_VRILE_count_panArctic_obs.pdf

echo "converted image from PNG to PDF and resized"

#Add a red border 20 pixels wide

convert min_SIE_vs_VRILE_count_panArctic_obs.png -bordercolor red -border 20 test_border.png

echo "added a red border"

#Add some text on top of  the image after the fact
convert min_SIE_vs_VRILE_count_panArctic_obs.png -pointsize 72 -gravity center -annotate +400+40 "THE TRUTH IS OUT THERE" test_annotate.png

echo "added text"

#Add border and text together
convert min_SIE_vs_VRILE_count_panArctic_obs.png -bordercolor black -border 30 -pointsize 96 -gravity center -fill green -annotate +350+35 "THE TRUTH IS OUT THERE" test_border_annotate_BOTH.png

#Append two images with "Kara" in the name horizontally

convert min_SIE_vs_VRILE_count_Kara*.png +append Kara_stack_horiz.png

echo "stacked Kara Sea images horizontally"

#Append two images with "Kara" in the name vertically

convert min_SIE_vs_VRILE_count_Kara*.png -append Kara_stack_vert.png

echo "stacked Kara Sea images vertically"
