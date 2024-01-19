
INSERT INTO usuarios (idUsuarios, nombre, apellido, numero_telefono_new, direccion)
VALUES(2, "Sonia", "Prada",'3212333291',"cra4#127"),
		(3, "Maura", "Ortiz",'3212333291',"cra23#122"),
		(4, "Dario", "Goyeneche",'3212333291',"cra07#15"),
		(1, "Mauro", "Peralta",'3212333291',"cra09#12");
        
        
SELECT * FROM usuarios;
/*Cambiar una tabla, hice el cambio de numero_telefono INt por numero_telefono_new VARCHAR(20)*/

ALTER TABLE usuarios ADD COLUMN numero_telefono_new VARCHAR(20);
/*visualizar que tipo de dato es una columna de una tabla*/

SHOW COLUMNS FROM usuarios WHERE Field = 'numero_telefono_new';
/*agrego valor a un campo que tenia vacio en la tabla*/

UPDATE usuarios
SET numero_telefono_new = '3212333291'
WHERE idUsuarios = 5;

UPDATE usuarios
SET numero_telefono_new = '9876543210'
WHERE nombre IN ('Maura', 'Dario')
LIMIT 2;
