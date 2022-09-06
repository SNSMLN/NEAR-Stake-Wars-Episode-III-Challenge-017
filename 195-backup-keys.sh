
source $HOME/.bash_profile

BACKUP_DIR=$HOME/backup-reserved

mkdir $BACKUP_DIR

cp $DATA_DIR/validator_key.json $BACKUP_DIR
cp $DATA_DIR/node_key.json $BACKUP_DIR
cp -R $HOME/.near-credentials $BACKUP_DIR
