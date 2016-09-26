source ~/.bashrc

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash

###-tns-completion-start-###
if [ -f /Users/paul/.tnsrc ]; then 
    source /Users/paul/.tnsrc 
fi
###-tns-completion-end-###
