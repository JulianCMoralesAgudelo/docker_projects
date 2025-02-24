#!/bin/bash

# Nombre del contenedor de MongoDB
CONTAINER_NAME="mongo_db"

# Ruta del backup dentro del contenedor
BACKUP_PATH="/data/db/dump"

# Mensaje de inicio
echo "♻️ Restaurando bases de datos en el contenedor '$CONTAINER_NAME'..."

# Copiar el backup al contenedor desde la máquina host
docker cp ./dump_mongo $CONTAINER_NAME:$BACKUP_PATH

# Ejecutar la restauración con mongorestore
docker exec -it $CONTAINER_NAME mongorestore \
  --username admin \
  --password 4Dm1nDB* \
  --authenticationDatabase admin \
  --drop $BACKUP_PATH

echo "✅ Restauración completada."
