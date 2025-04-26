use db1
# Actualizar un libro
db.libros.updateOne(
  { titulo: 'JSON para todos' },  // Filtro: busca el documento con este título
  { $set: { titulo: 'Bash para todos' } }  // Actualiza el título
)

# Verificar que la Actualización Funcionó
db.libros.find({ titulo: 'Bash para todos' }).pretty()

# Buscar Documentos que Contengan la Frase "para todos" en MongoDB
db.libros.find({ titulo: { $regex: "para todos", $options: "i" } }).pretty()

# Buscar Documentos Donde el Título Contenga "para" O "todos"
db.libros.find({ titulo: { $regex: "para|todos", $options: "i" } }).pretty()

# Obtener Todos los Títulos con
db.libros.find({}, { titulo: 1, _id: 0 }).pretty()

# Obtener Todos los Títulos en un Array
db.libros.find({}, { titulo: 1, _id: 0 }).map(doc => doc.titulo)

# Actualizar muchos libros
db.libros.updateMany(
  { precio: {$gt: 10}},    // Filtro: busca el precio con ese valor
  { $set: { precio: 150 }}  // Actualiza el precio
)

# Buscar cambios realizados
db.libros.find({precio: 150})