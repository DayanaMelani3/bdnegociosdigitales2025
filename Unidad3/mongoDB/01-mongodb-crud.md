# MongoDB crud

## crear una base de datos
 solo se crea si contiene por lo menos una coleccion 

 ` ` json
use db
 ` `

 ## crear una colección

 use bd1
db.createcollection('Empleado')

## mostrar colleciones
`show collections`

## Insercion de un documento
db.Empleado.insertOne(
    nombre: 'soyla'
    apellido:'vaca'
    edad:32
    ciudad: 'San Miguel de las piedras'
    
)
