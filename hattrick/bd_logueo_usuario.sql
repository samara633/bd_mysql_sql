CREATE DATABASE logueo_usuarios_hat_trick;
USE logueo_usuarios_hat_trick;
CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(100) NOT NULL,
  contrasena VARCHAR(255) NOT NULL
);

INSERT INTO usuarios (nombre, correo, contrasena)
VALUES ('María', 'maria@example.com', 'pass123');
SELECT * FROM usuarios;