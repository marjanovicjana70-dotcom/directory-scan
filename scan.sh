#!bin/bash
set -e
export CURRENT_DIR=$PWD

while true; do

clear

echo "You are currently inside ${CURRENT_DIR}"
echo ""

printf "SCAN THE WHOLE DIRECTORY --------- (1)
-
SCAN DIRECTORY FOR LARGE FILES --- (2) 
-
SCAN DIRECTORY FOR DUPLICATES ---- (3)
-
SCAN DIRECTORY FOR OLD FILES ----- (4)
-
SCAN DIRECTORY FOR TEMP FILES ---- (5)
-
-
-
-
EXIT (0)\n"



read -p "What would you like to do? ((0) is to quit) " command


case $command in 
    1)
        clear
        source directoryOpt.sh
    ;;

    2)
        clear
        source largeFiles.sh

    ;;
    0)
        clear
        echo "You quit the program"
        exit
    ;;
    *)
        echo "not an option"
esac

done






