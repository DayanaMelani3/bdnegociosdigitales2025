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

1. Mostrar todods los documentos donde el precio sea mayor a 25

db.libros.find
{{

}}

5. mostrar todos los documentos que no cuesten 20 o 25
do.libros.find{
{
 pre
}
}
### Operadores logicos
[operadores logicos](https://www.mongodb.com/docs/manual/reference/operator/query-logical/)

### operaador AND

Dos posible opciones

## Operador or ($)
-Mostrar todos aquellos libros que cuesten mas de 25 o cuya cantidad sea inferior a 15
```json
--rutas relativas 
![Operadores de comparacion](../img/operadores-Relacionales.png)

1. Mostrar todos los documentos, donde el precio sea mayor a 25 
json
db.Libros.find({precio:{$gt:25}})

2. Mostrar los documentos donde el precio sea 25 
json
db.Libros.find({precio:{$eq:25}})

3. Mostrar los documentos cuya cantidad sea menor a 5 
json
db.Libros.find({cantidad:{$lt:5}})


4. Mostrar los documentos que pertenecen a la editorial  biblio o planeta

json
db.Libros.find({editorial:{$in:['planeta',"Biblio"]}})


5. Mostrar todos los documentos de libros que causen 20 a 25 
json
db.Libros.find(
{
    precio:{
        $in:[20,25]
        }
        }
        )

6. Recuperar todos los documentos que no cuesten 20 0 25 

json
db.Libros.find(
{
    precio:{
        $nin:[20,25]
        }
        }
        )


## Instruccion findOne 

7. Recuperar solo una fila (Devuelve el primer elemento que cumpla la condicion)

json
db.libros.findOne(
{
    precio:{
        $in:[20,25]
        }
        }
        )


## Operadores Logicos 

[Operadores Logicos](https://www.mongodb.com/docs/manual/reference/operator/query-logical/)

## Operador and 

--Dos posibles opciones 

1. La simple, mediante condiciones separadas por comas 
-db.libros.find({condicion1, condicion2}) ->Con esto asume que es and 
1. usando el operador $and 
{ $and: [ { <expression1> }, { <expression2> } , ... , { <expressionN> } ] }
- db.libros.find({$and:[{condicion1}, {condicion2}]})


1. Mostrar todos aquellos libros que cuesten mas de 25 y cuya cantidad sea inferior a 15 

db.libros.find(
    {
        precio:{$gt:25},
        cantidad:{$lt:15}
    }
)


db.Libros.find(
    {
        $and:[
            {precio:{$gt:25}},
            {cantidad:{$lt:15}}
        ]
    }
)


### Operador or ($or)
-Mostrar todos aquellos libros que cuesten mas de 25 o cuya cantidad se ainferior a 15 

json
db.libros.find(
{
    $or:[
        {
            precio:{$gt:25}

        },
        {
            cantidad:{$lt:15}
        }

    ]
    }
        )
    
    ### Ejemplo con AND Y OR combinados 

    -mostrar los libros de la editorial Biblio con  precio mayor a  40 o libros de la editorial
    --plantea con precio mayor a 30

    db.libros.find{
     }

     $and;[
        { $or: [ {editorial:'Biblio'}, {precio:{$gt:30}}]},
        { $or: [ {editorial:$eq': Planeta'}, {precio:{$gt:20}}]}

            ]
        {

     }

     ### proyección (ver ciertas columnas)

     **sintaxis**

     db.collection.find(filtro, columnas)

     1. Seleccionar todos los libros, solo mostrandoel titulo
     db.libros.find({}, {titulo :1} )