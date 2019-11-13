#!/bin/bash -f

if [ "$1" == "" ] 
then
    casename=b40.1850.2deg.003
else
    casename=$1
fi

echo $casename

for mo in `seq 1 12`;
do
  mostr=`printf '%02d' $mo`;  # back quotes execute the command 
  echo $mostr;                      # no quotes causes variables to be replaced by what they equal
  echo ${casename}_${mostr}_climo.nc   
  echo '${casename}_${mostr}_climo.nc'; # normal quotes means make it literal
  echo 

#uncomment when you have data
#  ncea ${casename}.*-${mostr}.nc ${casename}_${mostr}_climo.nc

done


