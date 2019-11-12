#!/bin/csh -f

if ( "$1" == "" ) then
    set casename = b40.1850.2deg.003
else
    set casename = $1
endif

echo $casename

set mo = 1
while ($mo <= 12)
  set mostr = `printf '%02d' $mo`;  # back quotes execute the command 
  echo $mostr;                      # no quotes causes variables to be replaced by what they equal
  echo ${casename}_${mostr}_climo.nc   
  echo '${casename}_${mostr}_climo.nc'; # normal quotes means make it literal
  echo 

#uncomment when you have data
#  ncea ${casename}.*-${mostr}.nc ${casename}_${mostr}_climo.nc

  @ mo ++
end

# same thing in a for loop

foreach mo (`seq 1 12`)
  set mostr = `printf '%02d' $mo`
  echo ${casename}_${mostr}_climo.nc   

#uncomment when you have data
#  ncea ${casename}.*-$mo.nc ${casename}_${mo}_climo.nc

end


