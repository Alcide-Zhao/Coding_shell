# !bin/bash
cd /exports/csce/datastore/geos/users/s1667168/RCP/
#declare -a sector=('anthropogenic','ships','air','biomassburning')
SCENARIO='RCP85'
RES='0.5x0.5'

# donload
# for YEAR in {2005..2100}; do
	# for SPECIES in OC BC SO2; do
		# for SECTOR in anthropogenic ships aircraft biomassburning; do
			# file="http://accmip-emis.iek.fz-juelich.de/data/accmip/gridded_netcdf/accmip_interpolated/0.5x0.5/${YEAR}/accmip_interpolated_emissions_${SCENARIO}_${SPECIES}_${SECTOR}_${YEAR}_${RES}.nc.gz"
			# nohup wget $file &>/dev/null & 	
		# done
	# done
# done

# # decompress
# file_list=""
# for SPECIES in OC BC SO2; do
	# for SECTOR in anthropogenic ships aircraft biomassburning; do
		# for YEAR in {2005..2100}; do
			# file="accmip_interpolated_emissions_${SCENARIO}_${SPECIES}_${SECTOR}_${YEAR}_${RES}.nc.gz"
			# file_list="${file_list} ${file} "
			# eval "gunzip -f ${file}"
		# done
		# # cmd="ncrcat -h ${file_list}accmip_interpolated_emissions_${SCENARIO}_${SPECIES}_${SECTOR}_2005_2100_${RES}.nc"
		# # echo $cmd
		# # eval $cmd
	# done
# done
# Concatenating files (appending in time)				
# file_list=""
# for SPECIES in BC; do
	# for SECTOR in anthropogenic ships biomassburning; do
		# for YEAR in {2006..2100}; do
			# file="accmip_interpolated_emissions_${SCENARIO}_${SPECIES}_${SECTOR}_${YEAR}_${RES}.nc"
			# file_list="${file_list} ${file} "
		# done
		# cmd="ncrcat -h ${file_list}accmip_interpolated_emissions_${SCENARIO}_${SPECIES}_${SECTOR}_2005_2100_${RES}.nc"
		# eval $cmd
	# done
# done