
source $HOME/.bash_profile

## запускаем ноду
chmod +x $DAEMON
sudo cp $DAEMON /etc/init.d
sudo service $DAEMON start
