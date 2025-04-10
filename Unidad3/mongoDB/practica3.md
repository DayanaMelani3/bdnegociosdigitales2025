use curso


db.empleados.updateOne(
  { "nombre": "Imogene", "apellidos": "Nolan" },
  { $set: { "salario": 8000 } }
)


db.empleados.updateMany(
  { "pais": "Belgium" },
  { $set: { "pais": "Bélgica" } }
)


db.empleados.replaceOne(
  { "nombre": "Omar", "apellidos": "Gentry" },
  {
    "nombre": "Omar",
    "apellidos": "Gentry",
    "correo": "sin correo",
    "direccion": "Sin calle",
    "region": "Sin region",
    "pais": "Sin pais",
    "empresa": "Sin empresa",
    "ventas": 0,
    "salario": 0,
    "departamentos": "Este empleado ha sido anulado"
  }
)


db.empleados.find({ "nombre": "Omar", "apellidos": "Gentry" })


db.empleados.deleteMany({ "salario": { "$gt": 8500 } })


db.empleados.find({ "apellidos": { "$regex": "^R", "$options": "i" } })


db.empleados.find({ "region": { "$regex": "v", "$options": "i" } })


db.empleados.find({}, { "apellidos": 1, "_id": 0 }).sort({ "apellidos": 1 })


db.empleados.countDocuments({ "empresa": "Google" })


db.empleados.drop()
db.dropDatabase()
