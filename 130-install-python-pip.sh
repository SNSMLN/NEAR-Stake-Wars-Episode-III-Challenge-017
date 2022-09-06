
##nstall Python pip:
sudo apt install -y python3-pip

#Set the configuration:
USER_BASE_BIN=$(python3 -m site --user-base)/bin
echo export PATH="$USER_BASE_BIN:$PATH" >>$HOME/.bash_profile