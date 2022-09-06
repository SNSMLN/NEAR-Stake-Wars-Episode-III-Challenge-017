
source $HOME/.bash_profile

#Replace the config.json
#From the generated config.json, there two parameters to modify:

##boot_nodes: If you had not specify the boot nodes to use during init in Step 3, the generated config.json shows an empty array, so we will need to replace it with a full one specifying the boot nodes.
##tracked_shards: In the generated config.json, this field is an empty. You will have to replace it to "tracked_shards": [0]
rm $DATA_DIR/config.json
wget -O $DATA_DIR/config.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/config.json
