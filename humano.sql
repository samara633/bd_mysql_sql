
CREATE TABLE humano (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    edad INT,
    sexo VARCHAR(10),
    clave VARCHAR(100) NOT NULL
);

select * from humano;
drop table humano;
