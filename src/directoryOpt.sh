#!/bin/bash

function writeFD(){
    read -p "Write in the name: " fileName      
    if [[ -z "$fileName" ]]; then
        clear
        echo "Name cannot be empty."
        return
    fi

    if [[ -e "$fileName" ]]; then
        clear
        echo "A file or directory with the name '$fileName' already exists."
        return
    fi

    if [[ "$1" == "1" ]]; then
        touch "$fileName"
    else 
        mkdir "$fileName"
    fi
    local exit_code="$?"
    clear
    if [[ "$exit_code" == 0 ]]; then
        echo "Successfully created."
    else 
        echo "Unsuccessfully created."
    fi
}

function deleteFD(){
    read -p "Write in the name: " fileOrDirName
    if [[ -z "$fileOrDirName" ]]; then
        clear
        echo "Name cannot be empty."
        return
    fi

    if [[ ! -e "$fileOrDirName" ]]; then
        clear
        echo "'$fileOrDirName' does not exist."
        return
    fi

    read -p "Are you sure you want to delete '$fileOrDirName'? [y/n] " answer
    if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        rm -rf "$fileOrDirName"
        local exit_code="$?"
        clear
        if [[ "$exit_code" == 0 ]]; then
            echo "Successfully deleted."
            return
        fi
        echo "Unsuccessfully deleted."
    else
        clear
        echo "Deletion cancelled."
    fi
}

function editF(){
    read -p "What file do you want to edit? " fileName 
    if [[ -z "$fileName" ]]; then
        clear
        echo "Name cannot be empty."
        return
    fi

    if [[ ! -f "$fileName" ]]; then
        clear
        echo "'$fileName' is not a valid file or does not exist."
        return
    fi

    read -p "Vim or nano? [v/n] " editor
    clear

    if [[ "$editor" == "v" || "$editor" == "V" ]]; then
        vim "$fileName"
    elif [[ "$editor" == "n" || "$editor" == "N" ]]; then
        nano "$fileName"
    else
        echo "Invalid editor choice."
        return
    fi

    local exit_code="$?"
    clear
    if [[ "$exit_code" == 0 ]]; then
        echo "Successfully exited editor."
    else
        echo "Unsuccessfully exited editor."
    fi
}

function DirMove(){
    if [[ "$1" == "1" ]]; then
        read -p "Type in a directory: " dirName
        if [[ -z "$dirName" ]]; then
            clear
            echo "Directory name cannot be empty."
            return
        fi
        

        if [[ ! -d "$dirName" ]]; then
            clear
            echo "'$dirName' is not a valid directory."
            return
        fi
        
        cd "$dirName"
    else 
        cd ..
    fi
    local exit_code="$?"
    clear

    if [[ "$exit_code" == 0 ]]; then
        echo "Successfully moved"
    else
        echo "Unsuccessfully moved"
    fi

    export CURRENT_DIR="$PWD"
}


[[ -z "$CURRENT_DIR" ]] && export CURRENT_DIR="$PWD"

while true; do
    echo ""
    tree "$CURRENT_DIR"

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

    case "$numPick" in
      1)
            writeFD "1"
            ;;
      2|5)
            deleteFD 
            ;;
      3)
            editF
            ;;
      4)
            writeFD "2"
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
            echo "you exited the program."
            exit
            ;;
        *)
            clear
            echo "Wrong input.."
            ;;
    esac
done