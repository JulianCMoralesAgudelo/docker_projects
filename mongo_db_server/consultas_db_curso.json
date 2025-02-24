# Buscar todas los empleados que trabajen en Google 
db.empleados.find({empresa: "Google"}).pretty()

# Empleados que vivan en Peru 
db.empleados.find({pais: "Peru"}).pretty()

# Empleados que ganen más de 8.000 dolares
db.empleados.find({salario: {$gt: 8000}}).pretty()

# Empleados con ventas inferiores a 10000
db.empleados.find({ventas: {$lt: 10000}}).pretty()

# Empleados con ventas inferiores a 10000 devolviendo una sola fila
db.empleados.findOne({ventas: {$lt: 10000}}).pretty() 

# Empleados que trabajen en Google o en Yahoo con el operador $or
db.empleados.find({ $or: [{empresa: "Yahoo"},{empresa: "Google"}]}).pretty()

# Empleados que trabajen en Google o en Yahoo con el operador $in
db.empleados.find({ empresa: {$in:[ "Yahoo", "Google"]}}).pretty()

# Empleados de Amazon que ganen mas de 9000 dolares
db.empleados.find({ $and: [{empresa: "Amazon"},{salario:{$gt: 6000}}]}).pretty()

# Empleados que trabajen en Yahoo que ganen mas de 6000 o empleados que trabajen en Google que tangan ventas inferiores a 20000
db.empleados.find( 
  { 
    $or: [ 
           {$and: [{empresa: "Google"},{salario: {$gt: 6000}}]}, 
           {$and: [{empresa: "Yahoo"},{ventas: {$lt: 2000}}]}, 
         ] 
  } 
).pretty()

# Visualizar el nombre, apellidos y el país de cada empleado 
db.empleados.find({},{_id: 0, nombre: 1, apellidos: 1, pais:1 }).pretty()
