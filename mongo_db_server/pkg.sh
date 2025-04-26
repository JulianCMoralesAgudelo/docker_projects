#!/bin/bash
rm /etc/apt/sources.list.d/mongodb-org.list
apt-get update
apt-get install -y gnupg wget lsb-release vim curl
apt-key del 656408E390CFB1F5
curl -fsSL https://pgp.mongodb.com/server-4.4.asc | tee /etc/apt/trusted.gpg.d/mongodb-server-4.4.asc > /dev/null
apt-get update
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
echo "deb [ arch=$(dpkg --print-architecture) ] https://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
apt-get update
apt-get install -y mongodb-mongosh