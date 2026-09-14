#!bin/bash
export CURRENT_DIR=$PWD

MESSAGE_DISPLAY=""

function oldOrDup_files(){

clear
echo "This is the layout: "

if [[ "$1" == "1" ]]; then

find . -type f -not -path '*/.*' ! -empty -mtime +6 -exec stat -c "%y %n" {} \; | sort | tree --fromfile 

else 

find . ! -empty -type f -exec md5sum {} + | sort | uniq -w32 -dD | cut -c 35-

fi


if [[ "$?" > 0 ]]; then

echo "Nothing was displayed.."

fi

read -p "CLICK ENTER TO GO BACK ------------->  " click


}


while true; do

clear

eval "$MESSAGE_DISPLAY"

echo "You are currently inside ${CURRENT_DIR}"
echo ""

printf "SCAN THE WHOLE DIRECTORY --------- (1)
-
SCAN DIRECTORY FOR LARGE FILES --- (2) 
-
SCAN DIRECTORY FOR DUPLICATES ---- (3)
-
SCAN DIRECTORY FOR OLD FILES ----- (4) (DEFAULT IS 7 DAYS)
-
-
-
-
EXIT (0)\n"



read -p "What would you like to do? ((0) is to quit) " command


case $command in 
    1)
        clear
        MESSAGE_DISPLAY=""
        source directoryOpt.sh
    ;;

    2)
        clear
        MESSAGE_DISPLAY=""
        source largeFiles.sh

    ;;
              
    3)

    oldOrDup_files "2"
    ;;

    4)
    oldOrDup_files "1"

    ;;
    0)
        clear
        echo "You quit the program"
        exit
    ;;
    *)
        MESSAGE_DISPLAY="echo Not an option.."
esac

done






