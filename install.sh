
# set up long running sudo
echo "Sudo required for this script....enter password:"

sudo -v
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done &> /dev/null &

# Ensure XCode is installed
if xcode-select --install 2>&1 | grep installed; then
	echo "Xcode Command-line tools installed"
else
	echo "XCode command-line tools missing.....installing"
	xcode-select --install
fi

# ------------------------------
# Install Homebrew 
# ------------------------------
#  Test and install if needed
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Brew not installed....installing"
    # ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Brew Installed....updating"
    brew update
fi


# ------------------------------
# Install Pip 
# ------------------------------
#  Test and install if needed
which -s pip
if [[ $? != 0 ]] ; then
	echo "Pip not installed.....installing"
	# sudo easy_istall pip
	# sudo ARCHFLAGS=-Wno-error=unused-command-line-argument-hard-error-in-future pip install pycrypto
else
	echo "Pip already installed"
fi

# ------------------------------
# Install Ansible
# ------------------------------
#  Test if ansible is installed, and if not install it

which -s ansible
if [[ $? != 0 ]] ; then
	echo "Ansible not installed....installing"
	# brew install ansible
else
	echo "Ansible already installed"
fi

# run the main playbook
