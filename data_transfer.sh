#! bin/bash
echo -n "Entering the variable name > "
read variable
for no in {1..30}; do
	if [ $no -lt 10 ]; then
		cmd="sftp -P 22222 s1667168@csce.datastore.ed.ac.uk:/csce/datastore/geos/users/s1667168/CESM/${variable}/fixa/b.e11.BRCP85C5CNBDRD.f09_g16.00${no}.cam.h1.${variable}.20060101-21001231.nc "
	else
		cmd="sftp -P 22222 s1667168@csce.datastore.ed.ac.uk:/csce/datastore/geos/users/s1667168/CESM/${variable}/fixa/b.e11.BRCP85C5CNBDRD.f09_g16.0${no}.cam.h1.${variable}.20060101-21001231.nc "	
	fi
	echo $cmd
	eval $cmd
done