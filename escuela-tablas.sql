INSERT INTO estudiantes (id_estudiante, nombre, apellido, edad, id_clase)
VALUES (1, "Rosa", "Abril", 12, 1),
(2, "Rosmira", "rios", 32, 3),
(3, "mario", "melendez", 22, 4),
(4, "Rosario", "suarez", 22, 2);

 SELECT * FROM clases;
 
INSERT INTO clases (id_clase, nombre, profesor)
VALUES (4, "matematica", "Omar"),
(5, "ingles", "mauricio"),
(6, "programacion", "alex"),
(7, "emprendimiento", "maria");


INSERT INTO notas (id_estudiante, id_clase, nota)
VALUES (1,1, 25),
(2,1,45),
(3,3,30),
(4,4,15);

ALTER TABLE clases ADD profesor VARCHAR(50) AFTER nombre;
DROP TABLE clases;

UPDATE clases SET profesor = "fernando" WHERE id_clase = 1;

SELECT estudiantes.nombre, clases.nombre, notas.nota FROM estudiantes
JOIN clases ON estudiantes.id_clase = clases.id_clase
JOIN notas ON estudiantes.id_estudiante = notas.id_estudiante AND clases.id_clase = notas.id_clase;
