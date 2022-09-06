
##Install developer tools, Node.js, and npm
##First, we will start with installing Node.js and npm:

curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
sudo apt install -y build-essential nodejs
PATH="$PATH"

##Check Node.js and npm version:
node -v
##v18.x.x

npm -v
##8.x.x

