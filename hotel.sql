CREATE TABLE Habitaciones (
    id_habitacion INT PRIMARY KEY,
    numero INT UNIQUE,
    capacidad INT,
    precio_noche DECIMAL(10, 2),
    FOREIGN KEY (id_producto) REFERENCES Productos(id_producto)
);
CREATE TABLE Huéspedes (
    id_huesped INT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100),
    telefono VARCHAR(20)
);
CREATE TABLE Reservas (
    id_reserva INT PRIMARY KEY,
    fecha_inicio DATE,
    fecha_fin DATE,
    id_habitacion INT,
    id_huesped INT,
    FOREIGN KEY (id_habitacion) REFERENCES Habitaciones(id_habitacion),
    FOREIGN KEY (id_huesped) REFERENCES Huéspedes(id_huesped)
);
CREATE TABLE Productos (
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion VARCHAR(100),
    precio DECIMAL(10, 2)
);

