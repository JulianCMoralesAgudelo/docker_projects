#!/bin/bash
docker exec -it mongodb bash

mongosh --host 192.168.1.100 --port 27017 -u admin -p 4Dm1nDB* --authenticationDatabase admin
mongosh --host 127.0.0.1 --port 27017 -u admin -p 4Dm1nDB* --authenticationDatabase admin

mongosh --port 27017 -u admin -p 4Dm1nDB* --authenticationDatabase admin

# Llave ssh
ssh-copy-id -i ~/.ssh/id_rsa.pub sysadmin@192.168.1.100

