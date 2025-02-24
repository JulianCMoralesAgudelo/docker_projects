#!/bin/bash

# Nombre del contenedor de MongoDB
CONTAINER_NAME="mongo_db"

# Ruta donde se guardará el backup dentro del contenedor
BACKUP_PATH="/data/db/mongo/dump"

# Mensaje de inicio
echo "📦 Exportando bases de datos de MongoDB en el contenedor '$CONTAINER_NAME'..."

# Ejecutar el backup con mongodump
docker exec -it $CONTAINER_NAME mongodump \
  --username admin \
  --password 4Dm1nDB* \
  --authenticationDatabase admin \
  --out $BACKUP_PATH

# Copiar el backup a la máquina host
docker cp $CONTAINER_NAME:$BACKUP_PATH ./dump_mongo

echo "✅ Exportación completada. Backup disponible en './dump_mongo'"
