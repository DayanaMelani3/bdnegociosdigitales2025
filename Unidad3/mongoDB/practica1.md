// Inserción de documentos en la colección 'cursos'
db.cursos.insertMany([
  {
    _id: 1,
    nombre: "Curso1",
    aula: "aula1",
    profesores: [101, 102]
  },
  {
    _id: 2,
    nombre: "Curso2",
    aula: "aula2",
    profesores: [101, 103]
  },
  {
    _id: 3,
    nombre: "Curso3",
    aula: "aula3",
    profesores: [102, 101] // Eliminado el duplicado de 101
  }
]);


use curso

show dbs


db.createCollection('facturas')

show collections


db.facturas.insertMany([
  { Cod_Factura: 10, Cliente: "Frutas Ramirez", Total: 223 },
  { Cod_Factura: 20, Cliente: "Ferreteria Juan", Total: 140 }
]);


db.productos.insertOne({
  Cod_producto: 1,
  Nombre: "Tornillo x 1\"",
  Precio: 2
});

db.productos.insertOne({
  Cod_producto: 2,
  Nombre: "Martillo",
  Precio: 20,
  Unidades: 50,
  Fabricantes: ["fab1", "fab2", "fab3", "fab4"]
});


db.facturas.drop();


db.fabricantes.insertOne({
  _id: 1,
  Nombre: "fab1",
  Localidad: {
    ciudad: "Buenos Aires",
    pais: "Argentina",
    Calle: "Calle pez 27",
    cod_postal: 2900
  }
});


db.productos.insertMany([
  {
    Cod_producto: 3,
    Nombre: "Alicates",
    Precio: 10,
    Unidades: 25,
    Fabricantes: ["fab1", "fab2", "fab5"]
  },
  {
    Cod_producto: 4,
    Nombre: "Arandela",
    Precio: 1,
    Unidades: 500,
    Fabricantes: ["fab2", "fab3", "fab4"]
  }
]);

db.getCollectionNames().forEach(function(c) {
  print(`\n📁 Colección: ${c}`);
  db.getCollection(c).find().pretty();
});
