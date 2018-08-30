#!/bin/bash

#define a function which finds all the variables names in the file. input argument: $FILE1 (an example filename). output: $VARNAMES (an array with all the variables names).

#define a function to ifnd the smallest and largest time values and combine them a file name for the concatenated time series file:
function find_years_for_new_name() {
   #
   echo "--------- find start and end years and combine to new file name -----------"
   echo "input: an array with all filenames"
   #FILES_H=${1[@]} doesnt work
   #declare -a FILES_H=("${!1}")
   name=$1[@]
   FILES_H=("${!name}")
   #echo "================"
   #echo $name
   #echo ${FILES_H[0]}
   #echo ${FILES_H[1]}
   #echo ${FILES_H[2]}
   #echo "================"
   FREQ_H=$2
   #FILES_H=("$@")
   #echo ${FILES_H[@]}
   #
   unset FNEW
   #for that, sort $FILES by name and choose the first and last one.
   #get year from to for the output file name
   #FILES_SORTED=$'\n' sorted=($(sort <<<"${FILES[*]}"))
   FILES_SORTED=($(for l in ${FILES_H[@]}; do echo $l; done | sort))
   #first file
   FFIRST=${FILES_SORTED[0]}
   #last file
   FLAST=${FILES_SORTED[${#FILES_SORTED[@]}-1]}
   #
   #get the year bits and combine to new filenmae:
   #echo ${FFIRST:1:125}
   if [[ $FREQ_H = "mon" ]]
   then
     IDX=10
   elif [[ $FREQ_H == "day" ]]
   then
     IDX=19
   else
     echo "which frequenY??"
     IDX="PROBLEM"
   fi
   #echo "==================="
   #echo $IDX
   #echo $FFIRST
   #echo "==================="
   YEARFIRST=${FFIRST:${#FFIRST}-IDX} 
   YEARFIRST=${YEARFIRST:0:IDX-3}
   YEARLAST=${FLAST:${#FLAST}-IDX} 
   YEARLAST=${YEARLAST:0:IDX-3}
   #
   #check
   if ! [ "${FLAST:0:${#FLAST}-IDX}" == "${FFIRST:0:${#FFIRST}-IDX}" ]; then
    echo "oh, sth confusing with the filenames."; stop
   fi; #echo "hihihi"
   #else
   #echo "no not the same."
   ##"exit 1" takes me even out of archer. not good. 
   FNEW=${FFIRST:0:${#FFIRST}-IDX}${YEARFIRST}--${YEARLAST}.nc
   FNEW=${FNEW/$FROMDIR/$TODIR}
   #
   echo "output string: new filename "$FNEW
}


#define a function to get all years and from that the decades to combine the files into
function find_decades() {
   #
   echo "--------- find start and end years -----------"
   echo "input: an array with all filenames"
   #FILES_H=${1[@]} doesnt work
   #declare -a FILES_H=("${!1}")
   name=$1[@]
   FILES_H=("${!name}")
   FREQ_H=$2
   #FILES_H=("$@")
   #echo ${FILES_H[@]}
   #
   #for that, sort $FILES by name and choose the first and last one.
   #get year from to for the output file name
   #FILES_SORTED=$'\n' sorted=($(sort <<<"${FILES[*]}"))
   FILES_SORTED=($(for l in ${FILES_H[@]}; do echo $l; done | sort))
   #first file
   FFIRST=${FILES_SORTED[0]}
   #last file
   FLAST=${FILES_SORTED[${#FILES_SORTED[@]}-1]}
   #
   #get the year bits and combine to new filenmae:
   #echo ${FFIRST:1:125}
   if [[ $FREQ_H = "mon" ]]
   then
     IDX=10
   elif [[ $FREQ_H == "day" ]]
   then
     IDX=19
   else
     echo "which frequency??"
     IDX="PROBLEM"
   fi
   YEARFIRST=${FFIRST:${#FFIRST}-IDX} 
   YEARFIRST=${YEARFIRST:0:IDX-3}
   YEARLAST=${FLAST:${#FLAST}-IDX} 
   YEARLAST=${YEARLAST:0:IDX-3}
   #
   #check
   if ! [ "${FLAST:0:${#FLAST}-IDX}" == "${FFIRST:0:${#FFIRST}-IDX}" ]; then
    echo "oh, sth confusing with the filenames."; stop
   fi; #echo "hihihi"
   #else
   #echo "no not the same."
   ##"exit 1" takes me even out of archer. not good. 
   #
   #get year only (w/o month):
   YEARFIRSTYO=${YEARFIRST:0:4}
   YEARLASTYO=${YEARLAST:0:4}
   #
   #floor by default:
   #echo $(($z / $w))
   #get ceil:
   #echo $((($z+$w-1)/$w))
   NODECS=$((($((${#FILES[@]} / 12))+10-1)/10)) 
   #
   if [[ $YEARFIRSTYO -gt 1000 ]]; then
    ### this works for the historical runs, which start for example in year 1850 or 1970:
    DECFIRST=$(($YEARFIRSTYO / 10))
    DECLAST=$(($YEARLASTYO / 10))
    DECADES=$(seq $(( $DECFIRST )) $(($(($NODECS - 1)) + $(($DECFIRST )))))
   else
    ### this works for pi, which starts in year 0
    DECFIRST=$(echo $YEARFIRSTYO | sed 's/^0*//')
    DECLAST=$(echo $YEARLASTYO | sed 's/^0*//')
    DECADES=$(seq $(( $DECFIRST - 1)) $(($(($NODECS - 1)) + $(($DECFIRST - 1)))))
   fi
   #
   #---------
   #for both: add leading zeros
   DECADES_STR=()
   for DEC in ${DECADES[@]}; do 
      b=$(printf "%03d\n" $DEC);
      #echo $b
      DECADES_STR+=($b) #"?-??")
      #c=${b}"?-??"
      #DECADES_STR+=($c) #"?-??")
   done
   #
   #
   echo "output list of strings: decades "${DECADES_STR[@]}
}
