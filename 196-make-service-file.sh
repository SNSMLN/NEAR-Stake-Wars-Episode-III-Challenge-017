
source $HOME/.bash_profile

DESCRIPTION="Near node"

# create service
tee $DAEMON.service > /dev/null <<EOF
[Unit]
Description=$DESCRIPTION
After=network.target
[Service]
Type=simple
User=$USER
WorkingDirectory=$DATA_DIR
ExecStart=$(which $BIN) run
Restart=always
RestartSec=30
KillSignal=SIGINT
TimeoutStopSec=45
KillMode=mixed
LimitNOFILE=16000
[Install]
WantedBy=multi-user.target
EOF

