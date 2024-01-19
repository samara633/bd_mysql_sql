CREATE TABLE medicamentos (
  codigo INT UNSIGNED AUTO_INCREMENT,
  nombre VARCHAR(20),
  laboratorio VARCHAR(20),
  precio DECIMAL(5,2) UNSIGNED,
  cantidad INT UNSIGNED,
  PRIMARY KEY (codigo)
);

DESCRIBE medicamentos;
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Sertal', 'Roche', 5.2, 100);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Buscapina', 'Roche', 4.10, 200);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Amoxidal 500', 'Bayer', 15.60, 100);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Paracetamol 500', 'Bago', 1.90, 200);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Bayaspirina', 'Bayer', 2.10, 150);
INSERT INTO medicamentos (nombre, laboratorio, precio, cantidad)
VALUES ('Amoxidal jarabe', 'Bayer', 5.10, 250);

select * from medicamentos;

SELECT nombre, precio
FROM medicamentos
WHERE precio BETWEEN 5 AND 15;

SELECT *
FROM medicamentos
WHERE laboratorio IN ('Bayer', 'Bago');

DELETE FROM medicamentos
WHERE cantidad BETWEEN 100 AND 200;

