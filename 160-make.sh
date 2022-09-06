
source $HOME/.cargo/env

cd $HOME/nearcore
git fetch

COMMIT=`curl https://raw.githubusercontent.com/near/stakewars-iii/main/commit.md`
git checkout $COMMIT 

cargo build -p neard --release --features shardnet
