
##Validator Stats
##Now that NEAR-CLI is installed, let's test out the CLI and use the following commands to interact with the blockchain as well as to view validator stats. There are three reports used to monitor validator status:

##Environment
##The environment will need to be set each time a new shell is launched to select the correct network.

##Networks:

##GuildNet
##TestNet
##MainNet
##Shardnet (this is the network we will use for Stake Wars)
##Command:

##export NEAR_ENV=shardnet
##You can also run this command to set the Near testnet Environment persistent:

NEAR_ENV=shardnet
CHAIN_ID=shardnet
POOL_ID=snsmln.factory.shardnet.near
POOL_RESERVED_ID=snsmln-reserved.factory.shardnet.near
ACC_ID=snsmln.shardnet.near
GAS=300000000000000
NEAR_NODE=http://127.0.0.1:3030
DATA_DIR=$HOME/.near
BIN_DIR=$HOME/bin
BIN=neard
DAEMON=neard

echo 'export NEAR_ENV='$NEAR_ENV >> $HOME/.bash_profile
echo 'export CHAIN_ID='$CHAIN_ID >> $HOME/.bash_profile
echo 'export POOL_ID='$POOL_ID >> $HOME/.bash_profile
echo 'export POOL_RESERVED_ID='$POOL_RESERVED_ID >> $HOME/.bash_profile
echo 'export ACC_ID='$ACC_ID >> $HOME/.bash_profile
echo 'export GAS='$GAS >> $HOME/.bash_profile
echo 'export NEAR_NODE='$NEAR_NODE >> $HOME/.bash_profile
echo 'export DATA_DIR='$DATA_DIR >> $HOME/.bash_profile
echo 'export BIN_DIR='$BIN_DIR >> $HOME/.bash_profile
echo 'export BIN='$BIN >> $HOME/.bash_profile
echo 'export DAEMON='$DAEMON >> $HOME/.bash_profile


