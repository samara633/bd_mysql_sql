CREATE TABLE Estudiantes(
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    id_clase INT
    );

-- Crear tabla de Clases

CREATE TABLE Clases (
    id_clase INT PRIMARY KEY,
    nombre VARCHAR(50),
    carrito_comprascarrito_comprasprofesor VARCHAR(50)
);

-- Crear tabla de Notas

CREATE TABLE Notas (
    id_estudiante INT,
    id_clase INT,
    nota DOUBLE,
    PRIMARY KEY (id_estudiante, id_clase),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_clase) REFERENCES Clases(id_clase)
);