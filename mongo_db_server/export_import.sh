# Exportar bases de datos
docker exec -it mongo_db mongodump \
  --username admin \
  --password 4Dm1nDB* \
  --authenticationDatabase admin \
  --out /data/db/dump

# Restaurar bases de datos
docker exec -it mongo_db mongorestore \
  --username admin \
  --password 4Dm1nDB* \
  --authenticationDatabase admin \
  --drop /data/db/dump

#  Verificar que los Datos Fueron Importados Correctamente
docker exec -it mongo_db mongo -u admin -p 4Dm1nDB* --authenticationDatabase admin

# Importar un Archivo JSON a una Base de Datos en MongoDB /data/mongo/dump/empleados.json

# Copiar el Archivo al Contenedor MongoDB
docker cp /data/mongo/dump/empleados.json mongo_db:/data/db/empleados.json

# Importar los Datos en la Base de Datos curso
docker exec -it mongo_db mongoimport \
  --db curso \
  --collection empleados \
  --file /data/db/empleados.json \
  --jsonArray \
  --username admin \
  --password 4Dm1nDB* \
  --authenticationDatabase admin

# Forzar mongoimport a Aceptar Documentos Línea por Línea
docker exec -it mongo_db mongoimport \
  --db curso \
  --collection empleados \
  --file /data/db/empleados.json \
  --username admin \
  --password 4Dm1nDB* \
  --authenticationDatabase admin

# Verificar que los Datos Fueron Importados Correctamente
docker exec -it mongo_db mongo -u admin -p 4Dm1nDB* --authenticationDatabase admin

# Dentro de la consola de MongoDB, ejecuta:
use db1
show collections
db.empleados.find().pretty()

# Ejecutar la Consulta Directamente en Docker
docker exec -it mongo_db mongo curso \
  -u admin \
  -p 4Dm1nDB* \
  --authenticationDatabase admin \
  --eval 'db.empleados.findOne({ nombre: "Gregory" })'

