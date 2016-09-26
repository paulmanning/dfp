#!/bin/sh 
export PATH=$PATH:/usr/local/bin

# abort if we're already inside a TMUX session
[ "$TMUX" == "" ] || exit 0 

#tmux has-session -t main || tmux new-session -s main -d
HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=8
BACKTITLE="Startup Mode"
TITLE="Select an Option"
MENU="Choose one of the following options:"
TIMEOUT=5 #seconds
OPTIONS=(1 "Default Session with TMUX"
         2 "New Session with TMUX"
         3 "Shell only no TMUX"
		 4 "TMUXinator Dev session"
		 $(tmux list-sessions -F "#S TMUX-Session-#S"))
		 

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
				--timeout $TIMEOUT \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)
RETURN_VALUE=$?
clear
case $RETURN_VALUE in
	0)
        #ok 
		case $CHOICE in 

	        1) 
		    	tmux new-session -A -s main
	  	        break;;
	        2)
		        read -p "Enter new session name: " SESSION_NAME
	    	    tmux new-session -s "$SESSION_NAME"
    		    break;;
	        3) 
	    	    echo "Starting ZSH..."
				zsh --login
    		    break;;
			4)
				tmuxinator dev
				break;;
	        *)
	    	    echo "Attaching to existing session..."	
    		    tmux attach-session -t $CHOICE
	    	    break;;
        esac
        break;;
	255) #cancel
		echo "Aborting...."
		zsh --login
		break;;
esac


# startup a "default" session if none currently exists
#tmux has-session -t _default || tmux new-session -s _default -d

# present menu for user to choose which workspace to open
#PS3="Please choose your session: "
#options=($(tmux list-sessions -F "#S") "NEW SESSION" "ZSH")
#echo "Available sessions"
#echo "------------------"
#echo " "
#select opt in "${options[@]}"
#do

# case $opt in
#        "NEW SESSION")
#            read -p "Enter new session name: " SESSION_NAME
#            tmux new -s "$SESSION_NAME"
#            break
#            ;;
#        "ZSH")
#            zsh --login
#            break;;
#        *) 
#            tmux attach-session -t $opt 
#            break;; 

#    esac
#done
