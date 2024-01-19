-- Crear la tabla "socios"
CREATE TABLE socios (
  documento CHAR(8) NOT NULL,
  nombre VARCHAR(30),
  domicilio VARCHAR(30),
  PRIMARY KEY (documento)
);

-- Crear la tabla "inscriptos"
CREATE TABLE inscriptos (
  documento CHAR(8) NOT NULL,
  deporte VARCHAR(15) NOT NULL,
  año YEAR,
  matricula CHAR(1),
  PRIMARY KEY (documento, deporte, año),
  FOREIGN KEY (documento) REFERENCES socios(documento)
);
