#!/bin/bash
#
LIB='../../../bin/prep-lib.sh'
if [ ! -f $LIB ]; then      #??
  echo $LIB does not exist! #??
  exit 2                    #??
fi                          #??
source $LIB
#----------------------------------------
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "Prep number n" \
    "Exit script."
  exit 1
fi

DEST="../../02_Exercises/a02"
CLT="client"
SRV="backend"
# declare -a server=($(ls 0*_server.js))

case $1 in
0)
  createTargetDir "${DEST}"
  cp -r ${SRV} "${DEST}/${SRV}"
  cp "00-Exercise.md" "${DEST}"
  ;;
1)
  TARGET=${DEST}
  declare -a fileArray=($(ls 0{1..6}*.sh))
  fileArray+=('App_dockerfile')
  for file in "${fileArray[@]}"
  do
     removeSolution ${file} "${TARGET}/${file}"
  done
  ;;
2)
  TARGET=${DEST}
  declare -a fileArray=($(ls *.js))
  fileArray+=('package.json')
  for file in "${fileArray[@]}"
  do
    if [[ ${file} = "trafficlight.test.js" ]]; then
     #removeSolution ${file} "${DEST}/${CLT}/${file}"
     removeSolution ${file} "${DEST}/${file}"
    else
       #cp ${file} "${DEST}/${CLT}/${file}"
       cp ${file} "${DEST}/${file}"
    fi
  done
  ;;

*)
  echo "Incorrect choice entered!"
  ;;
esac
