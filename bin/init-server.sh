#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
apt-get update || true
apt-get install -y tmux htop zip unzip supervisor git iotop sysstat curl lsof libaio1 vim less iftop rsync build-essential whois || true
rm -rf /etc/mysql || true
unset DEBIAN_FRONTEND

mv /etc/locale.gen /etc/locale.gen.bak
cat > /etc/locale.gen << EOFres
en_US.UTF-8 UTF-8
EOFres
locale-gen

cat > /etc/timezone << EOFres
Etc/UTC
EOFres
dpkg-reconfigure -f noninteractive tzdata

mkdir -p /data/dev
cd /data/dev
git clone https://github.com/tzellman/dotfiles.git


##################################
# MONGO
##################################
MONGO_PORT="27017"
MONGO_DIR=/data/mongodb
mkdir -p $MONGO_DIR
cd $MONGO_DIR

if ! test -d mongodb-linux*
then

# Scrape the latest version
v=$(curl -s 'https://www.mongodb.com/download-center#community' | sed 's/\<div/\n\<div/g' | grep 'Current Stable Release' | cut -d '(' -f 2 | cut -d ')' -f 1)
wget http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$v.tgz
tar zxf mongo*tgz
rm -f mongo*tgz

MONGO_DIR=`cd mongodb-linux-*;pwd`

for f in mongo mongod mongodump mongoexport mongofiles mongoimport mongooplog mongoperf mongorestore mongos mongostat mongotop
do
    update-alternatives --remove-all $f
    update-alternatives --install /usr/bin/$f $f $MONGO_DIR/bin/$f 1
done

mkdir -p db

svfile=/etc/supervisor/conf.d/mongodb.conf
if [ ! -e $svfile ]; then
cat <<EOF > $svfile
[program:mongodb]
directory=/data/mongodb/
command=$MONGO_DIR/bin/mongod --port $MONGO_PORT --pidfilepath $PWD/mongo.pid --logpath $PWD/mongo.log --dbpath $PWD/db
process_name=mongod
user=root
EOF
fi
echo 0 > /proc/sys/vm/zone_reclaim_mode

supervisorctl reread
supervisorctl update

fi

##################################
# NODE
##################################
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install `nvm ls-remote | tail -n 1`
