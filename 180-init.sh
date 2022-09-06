
source $HOME/.bash_profile

#Initialize working directory
#In order to work properly, the NEAR node requires a working directory and a couple of configuration files. Generate the initial required working directory by running:

$BIN --home $DATA_DIR init --chain-id $CHAIN_ID --download-genesis
