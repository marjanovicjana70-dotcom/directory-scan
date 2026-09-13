#!/bin/bash
function writeFD(){

read -p "write in the name: " fileName      

if [[ $1 == "1" ]]; then

      touch "$fileName"
else 
      mkdir "$fileName"

fi
local exit_code="$?"
     clear
      if [[ "$exit_code" == 0 ]]; then

      echo "Succesfully created."
      else 
      echo "Unsuccesfully created."

fi



}

function deleteFD(){

read -p "write in the name: " fileOrDirName

read -p "Are you sure you want to delete this ? [y/n] " answer

if [[ "$answer" == "y" || "$answer" == "Y" ]]; then

  rm -rf "$fileOrDirName"
  clear
  echo "Successfully deleted."
  return


   
fi

echo "Unsuccessfully deleted."



}


function editF(){

read -p "What file do you want to edit ?  " fileName 

read -p "Vim or nano ? [v/n] " editor

if [[ $editor == "v" || $editor == "V" ]]; then

vim $fileName

elif [[ $editor == "n" || $editor == "N" ]]; then

nano $fileName

fi

local exit_code="$?"
clear
if [[ "$exit_code" == "0" ]]; then

echo "Successfully entered editor"

else

echo "Unsuccessfully entered editor"

fi

}

function DirMove(){

if [[ "$1" == "1" ]]; then

read -p "Type in a directory.. " dirName
cd "$dirName"

else 

cd ..

fi
local exit_code="$?"
    clear

if [[ "$exit_code" == 0 ]];
then
echo "Successfully moved directories"
else
echo "Unsuccessfully move directories"
fi

echo "We are inside $PWD now"
CURRENT_DIR=$PWD
}

while true; 

do

echo ""
tree $CURRENT_DIR

echo "What would you like to do? ((0) is to quit) "

printf "MAKE A FILE ------------- (1)
-
DELETE A FILE ------------ (2)
-
EDIT A FILE -------------- (3)
-
MAKE A DIRECTORY --------- (4)
-
DELETE A DIRECTORY ------- (5)
-
GO INSIDE A DIRECTORY ---- (6)
-
LEAVE DIRECTORY ---------- (7)
-
GO BACK ------------------ (8)

-
-
-
-
EXIT (0)\n"

read -p "Enter a number: " numPick

case $numPick in

    1)

     writeFD "1"

    ;;

    2)
    deleteFD 
    ;;

    3)
    editF
    ;;

    4)
    writeFD "2"
    ;;

    5)
    deleteFD 
    ;;

    6)
    DirMove "1"
    ;;
    7)
    DirMove "2"
    ;;
    8)
    return
    ;;
    0)
    clear
    echo "you exited the program"
    exit

esac

done