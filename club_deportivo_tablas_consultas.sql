-- Insertar registros en la tabla "socios"
INSERT INTO socios VALUES ('22333444', 'Juan Perez', 'Colon 234');
INSERT INTO socios VALUES ('23333444', 'Maria Lopez', 'Sarmiento 465');
INSERT INTO socios VALUES ('24333444', 'Antonio Juarez', 'Caseros 980');
INSERT INTO socios VALUES ('25333444', 'Marcelo Pereyra', 'Sucre 349');

-- Insertar registros en la tabla "inscriptos"
INSERT INTO inscriptos VALUES ('22333444', 'natacion', '2015', 's');
INSERT INTO inscriptos VALUES ('22333444', 'natacion', '2016', 'n');
INSERT INTO inscriptos VALUES ('23333444', 'natacion', '2015', 's');
INSERT INTO inscriptos VALUES ('23333444', 'tenis', '2016', 's');
INSERT INTO inscriptos VALUES ('23333444', 'natacion', '2016', 's');
INSERT INTO inscriptos VALUES ('24333444', 'tenis', '2016', 'n');
INSERT INTO inscriptos VALUES ('24333444', 'basquet', '2016', 'n');

select * from socios;

SELECT s.*, i.deporte, i.año, i.matricula
FROM socios s
LEFT JOIN inscriptos i ON s.documento = i.documento;

SELECT s.*, i.deporte, i.año, i.matricula
FROM socios s
RIGHT JOIN inscriptos i ON s.documento = i.documento;

-- Insertar el registro en la tabla "socios" con el nuevo documento
INSERT INTO socios VALUES ('27333444', 'Samara Aparicio', 'bogota-suba');
select * from socios;

-- Insertar la inscripción en la tabla "inscriptos" para el nuevo documento
INSERT INTO inscriptos VALUES ('27333444', 'basquet', '2016', 's');
select * from inscriptos;

SELECT s.*, i.deporte, i.año, i.matricula
FROM socios s
RIGHT JOIN inscriptos i ON s.documento = i.documento;
