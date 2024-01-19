INSERT INTO productos (id_producto, talla, precio, nombre_producto, producto_disponible, imagen, descripcion_producto,  carrito_compras_idcarrito_compras, tipo_suelas_idtipo_suela, usuarios_id_usuario, usuarios_vendedor_idvendedor, vendedores_id_vendedor, vendedores_empresa_idempresa)
VALUES 
  (1, "", 50000, "zapatilla blu", 5, "", "zapatilla", 1, 1, 1, 1, 1, 1),
  (2, "", 650000, "zapatilla red", 10, "", "zapatilla" , 1, 1, 1, 1, 1, 1),
  (3, "", 550000, "zapatilla black", 2, "", "zapatilla", 1, 1, 1, 1, 1, 1),
  (4, "", 150000, "zapatilla yellow", 1, "", "zapatilla", 1, 1, 1, 1, 1, 1),
  (5, "", 45000, "zapatilla purple", 10, "", "zapatilla", 1, 1, 1, 1, 1, 1);

        
 SELECT * FROM productos;
 
INSERT INTO empresa (id_empresa, nombre_empresa, vision, mision, telefono, nit_empresa, correo, pais, ciudad, direccion_empresa)
VALUES (1, "hat_trick", "vender zapatos nivel nacional", "vender zapatos nivel nacional", '3125141329', 1234567891, "enriquehat_trick@gmail.com", "colombia", "bogota", "cra20-42c"  );

SELECT * FROM empresa;
 
INSERT INTO vendedores (id_vendedor, nombre, apellido, empresa_idempresa)
VALUES (1, "Oscar", "Gonzales", 1),
		(2, "Enrique", "Abril", 1 ),
		(3, "Maria", "Rios", 1),
		(4, "Samara", "Aparicio", 1 ),
		(5, "Erika","Cubillos", 1);
 SELECT * FROM vendedores;
 
INSERT INTO usuarios (id_usuario, nombre, apellido, correo, telefono, direccion, fecha_nacimiento, vendedor_idvendedor)
VALUES (1, "Omar", "Gonzales", "omar12@gmail.com", '3125698467', "cra15-6", '1973-09-05', 1),
  (2, "Ernesto", "Abril", "er34@gmail.com", '3136598464', "cra05-56", '1953-02-03', 5),
  (3, "Mariano", "Rios","mariano@gmail.com", '3125695466', "cra08-63", '1975-09-05', 4),
  (4, "Sara", "Aparicio","sara567@gmail.com", '3256398468', "cra15-15", '1973-09-03', 2),
  (5, "Elena","Cubillos", "elenac12@gmail.com", '3125878466', "cra09-68", '2000-10-12', 3);

 SELECT * FROM usuarios;
 
INSERT INTO tipos_suelas(idtipo_suela, tipo_goma, tipo_colores, tipo_negra,tipo_torretin)
VALUES(1,"true","false","false","false");
SELECT * FROM tipos_suelas;
 
INSERT INTO metodos_pagos(id_metodo_pago, efectivo, pse)
VALUES (1, "true","false");
SELECT * FROM metodos_pagos;

INSERT INTO carrito_compras (idcarrito_compras, total_pagar, cantidad, metodos_pagos_id_metodo_pago)
VALUES (1, 425.000,5, 1),
		(2,  90.000,2 ,1),
		(3,  125.000,1, 1),
		(4,  225.000,3 , 1),
		(5, 45.000,1 ,1);
 SELECT * FROM carrito_compras;


INSERT INTO facturas(id_factura, empresa_idempresa, carrito_compras_idcarrito_compras,carrito_compras_metodos_pagos_id_metodo_pago)
VALUES (1, 1, 1, 1);
SELECT * FROM facturas;