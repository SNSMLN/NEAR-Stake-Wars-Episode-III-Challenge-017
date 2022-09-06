
source $HOME/.bash_profile

#BIN=neard
#BIN_DIR=$HOME/bin

mkdir $BIN_DIR
cp $HOME/nearcore/target/release/$BIN $BIN_DIR

echo "export PATH=$PATH:$BIN_DIR" >> $HOME/.bash_profile
