#!/bin/bash                                                          
                                  
source $HOME/.bash_profile                                           
                                                                     
DIR=$HOME/logs-install
LOG=$DIR/`basename $0 .sh`.log                                                                                                            
                                  
echo `date` Start `basename $0 .sh` |tee -a $LOG;

#POOL_RESERVED_ID=snsmln-reserved.factory.shardnet.near

near generate-key $POOL_RESERVED_ID  |tee -a $LOG;

cp $HOME/.near-credentials/shardnet/$POOL_RESERVED_ID.json  $DATA_DIR/validator_key.json  |tee -a $LOG;

cat $DATA_DIR/validator_key.json |jq  |tee -a $LOG;

