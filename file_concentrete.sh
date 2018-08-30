#! bin/bash
echo -n "Entering the variable name > "
read variable
cd /exports/csce/datastore/geos/users/s1667168/CESM/Temp/rcp85/${variable}/
for no in {1..30}; do
	if [ $no -lt 10 ]; then
		cmd="ncrcat -h \
		b.e11.BRCP85C5CNBDRD.f09_g16.00${no}.cam.h1.${variable}.20060101-20801231.nc \
		b.e11.BRCP85C5CNBDRD.f09_g16.00${no}.cam.h1.${variable}.20810101-21001231.nc \
		b.e11.BRCP85C5CNBDRD.f09_g16.00${no}.cam.h1.${variable}.20060101-21001231.nc"
		rm_cm="rm b.e11.BRCP85C5CNBDRD.f09_g16.00${no}.cam.h1.${variable}.20060101-20801231.nc"
		rm_cm2="rm b.e11.BRCP85C5CNBDRD.f09_g16.00${no}.cam.h1.${variable}.20810101-21001231.nc"
	else
		cmd="ncrcat -h \
		b.e11.BRCP85C5CNBDRD.f09_g16.0${no}.cam.h1.${variable}.20060101-20801231.nc \
		b.e11.BRCP85C5CNBDRD.f09_g16.0${no}.cam.h1.${variable}.20810101-21001231.nc \
		b.e11.BRCP85C5CNBDRD.f09_g16.0${no}.cam.h1.${variable}.20060101-21001231.nc"
		rm_cm="rm b.e11.BRCP85C5CNBDRD.f09_g16.0${no}.cam.h1.${variable}.20060101-20801231.nc"
		rm_cm2="rm b.e11.BRCP85C5CNBDRD.f09_g16.0${no}.cam.h1.${variable}.20810101-21001231.nc"
	fi
	echo $cmd
	eval $cmd
	eval $rm_cm
	eval $rm_cm2
done