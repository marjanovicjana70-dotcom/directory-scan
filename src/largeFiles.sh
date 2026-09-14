#!/bash/bin

function change_size(){
echo ""
read -p "Do you want to change X or Y ? [x/y] " answer

if [[ "$answer" == "x" || "$answer" == "X" ]]; then

read -p "Input the size you want (it's in Kb) " size
LARGER_THAN="$size"
MESSAGE_DISPLAY="Changed the size.."

elif [[ "$answer" == "y" || "$answer" == "Y" ]]; then

read -p "Input the number of files you want to be shown " size
TOP_LARGEST_F="$size"
MESSAGE_DISPLAY="Changed the number.."

else 
MESSAGE_DISPLAY="echo Wrong input.."

fi

TREE_CALL="tree -h"
}



LARGER_THAN="1"
TOP_LARGEST_F="3"
TREE_CALL="tree "$CURRENT_DIR" -h" 


while true;
do

clear 

eval "$MESSAGE_DISPLAY"

echo "Currently inside "$CURRENT_DIR" "

eval "$TREE_CALL"

#izbegavati eval

echo "" 

printf " 
FIND FILES LARGER THAN > X (DEFAULT IS "$LARGER_THAN"k) ----- (1)
-
FIND TOP Y LARGEST FILES (DEFAULT IS "$TOP_LARGEST_F") -------- (2)
-
CHANGE SETTINGS OF X/Y --------------------------- (3)
-
SHOW ALL FILES --------------------------------- (4)
-
GO BACK ------- (5)
-
-
-
-
EXIT ---- (0)

"
read -p "What do you want to do ((0) is to quit) " comment

case "$comment" in

    0)
    clear
    echo "you exited the program"
    exit
    ;;

    1)
    TREE_CALL="find "$CURRENT_DIR" -not -path '*/.*' -size +"$LARGER_THAN"k | tree --fromfile"
    MESSAGE_DISPLAY="echo Files larger than: "$LARGER_THAN" "
    ;;

    2)
    TREE_CALL="find "$CURRENT_DIR" -type f -not -path '*/.*' -exec du -h {} + | sort -hr | head -n $TOP_LARGEST_F"
    MESSAGE_DISPLAY="echo Top "$TOP_LARGEST_F" largest"
    ;;

    3)
    change_size
    ;;
    4)

    TREE_CALL="tree -h"
    MESSAGE_DISPLAY=""
    ;;
    5)
    MESSAGE_DISPLAY=""
    return
    ;;

    *)
    MESSAGE_DISPLAY="echo Wrong input.."
esac


done