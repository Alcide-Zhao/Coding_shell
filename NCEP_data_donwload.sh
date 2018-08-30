#! bin/bash
#echo -n "Entering the variable name > "
#read variable
cd /exports/csce/datastore/geos/users/s1667168/obs/tmin/
for year in {1948..2017}; do
    wget "ftp://ftp.cdc.noaa.gov/Datasets/ncep.reanalysis.dailyavgs/surface_gauss/tmax.2m.gauss.${year}.nc"
done

for year in {1948..2017}; do
    ncpdq -a -lat tmin.2m.gauss.${year}.nc TN.2m.gauss.${year}.nc
done
