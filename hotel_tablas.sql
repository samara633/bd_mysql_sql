INSERT INTO Habitaciones (id_habitacion, numero, capacidad, precio_noche, id_producto)
VALUES (1, 101, 2, 150.00,1),
       (2, 102, 4, 200.00,2),
       (3, 201, 3, 180.00,3),
       (4, 202, 2, 160.00,4);
       
INSERT INTO Huéspedes (id_huesped, nombre, direccion, telefono)
VALUES (1, "Marcos", "cra15-65", "315698426"),
       (2, "veronica", "cra15-65", "315698426" ),
       (3, "lucia", "cra15-65", "315698426"),
       (4, "mariano", "cra15-65", "315698426" );
       
INSERT INTO productos (id_producto, nombre, descripcion, precio)
VALUES (1, "manzana", "gaseosa", 2500.00),
       (2, "uva", "gaseosa", 2500.00 ),
       (3,"pepsi", "gaseosa", 2500.00),
       (4,"pola-cola", "gaseosa", 2500.00 );
       
INSERT INTO reservas (id_reserva, fecha_inicio, fecha_fin, id_habitacion, id_huesped)
VALUES (1, '2020-03-12','2020-03-12',1,1),
       (2,'2020-03-12','2020-03-12',1,1 ),
       (3,'2020-03-12','2020-03-12',1,1),
       (4,'2020-03-12','2020-03-12',1,1 );
       
SELECT * FROM reservas;
ALTER TABLE Habitaciones ADD id_producto INT AFTER precio_noche;
DROP TABLE Habitaciones;

SELECT habitaciones.precio_noche,reservas.fecha_inicio, reservas.fecha_fin
FROM reservas
JOIN habitaciones ON habitaciones.id_habitacion = reservas.id_habitacion 
JOIN Huéspedes ON reservas.id_huesped = Huéspedes.id_huesped;



SELECT habitaciones.precio_noche, productos.nombre
FROM habitaciones
JOIN productos ON habitaciones.id_producto = productos.id_producto;


SELECT columnas
FROM tabla1
RIGHT JOIN tabla2 ON tabla1.columna = tabla2.columna;
SELECT columnas
FROM tabla1
LEFT JOIN tabla2 ON tabla1.columna = tabla2.columna;
SELECT columnas
FROM tabla1
INNER JOIN tabla2 ON tabla1.columna = tabla2.columna;