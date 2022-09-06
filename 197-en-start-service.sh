
source $HOME/.bash_profile

#DAEMON=palomad
## запускаем ноду
sudo cp $DAEMON.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable $DAEMON
sudo systemctl restart $DAEMON

journalctl -f -o cat -u $DAEMON  | ccze -A