
update alumnos set edad = 22;
#todos ls registros pasan a atener el valor de 22 en el campo de edad
 update alumnos set edad = 15 where nombre = 'juan';
 update alumnos set direccion ='usme', telefono= '2155453566' where nombre = 'luna';
 
 
 INSERT INTO alumnos VALUES (' ELUCID','VASQUEZ GARCIA','10000046235','Natural','48'),
 (' FELIPE SEGUNDO','SALAZAR RODAS','rincon','10000122489','25'),
  (' FELIPE','vasquez rodriguez','bilbao','10000122489','18'),
   (' maraia','perez mejia','usme','10000122489','18'),
    (' Fernanada','soto vargas','San Victorino','10000122489','28'),
     (' luna','oicata perez','gloria lara','10000122489','20'),
      (' FELIPE SEGUNDO','navarro gonzalez','manizales','10000122489','22'),
       (' diana','rodriguez casallas','aures','10000122489','19'),
        (' Pricila','ruiz mejia','costa azul','10000122489','15'),
         (' Zoraya','dinorales soto','trinitaria','10000122489','11'),
          (' Jimena','pelaes valbuena','lagos','10000122489','28')
;
select * from alumnos;

use practica1;

create table if not exists usuarios(
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
primary key(nombre)
);

#delete from usuario;

#drop table producto;
describe usuarios;

insert into usuarios values('Juan','Perez','juan@juan.com');
insert into usuarios values('Juana','Lopez','juan@Lopez.com');
describe usuarios;
select * from usuarios;

#drop table if exists producto;


create table if not exists producto(
id int(11) not null auto_increment,
producto varchar(50) not null,
descripcion text null,
precio float(11,2) not null,
primary key(id)
);

describe producto;
insert into producto values(null,'Laptop','La mejor laptop del mercado.',128.6);
insert into producto(id, producto, descripcion, precio) values(null,'','Mejor producto.',78.5);
insert into producto values(null,'Mouse','Prende luz.',5.8);
insert into producto(id, producto, descripcion, precio) values(null,'Laptop','La mejor laptop del mercado.',128.6);
select * from producto;

#delete from producto;
#truncate table producto;

create table persona(
id integer unsigned not null,
nombre varchar(50),
edad integer unsigned,
primary key(id)
);
describe persona;
select * from perona;



create table libros(
  id int(6) zerofill auto_increment,
  titulo varchar(50)not null,
  editorial varchar(30),
  autor varchar(50)default 'Desconocido',
  precio decimal(5,2) unsigned default 5.25, 
cantidad mediumint zerofill not null,
  primary key (id)
 );
 drop table libros;
insert into libros(titulo, editorial, autor, precio, cantidad) values ('c# en una hora','SQL','Miguel', 15.2, 50);
insert  into libros(titulo,editorial, autor, cantidad)values('JAVA','KDK','Juan',30);
insert into libros(titulo, cantidad)values('MYSQL',200);
select * from libros;

drop table producto;

create table if not exists productos(
id integer unsigned not null auto_increment,
nombre varchar(50),
proveedor varchar(50),
descripcion text,
precio decimal(5,2) unsigned,
cantidad smallint unsigned,
primary key(id)
);


insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Laptop HP','HP','Las mejores laptop',155.69,50);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Mouse','Logitech','Las mejores mouse',20.86,30);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Teclado','Logitech','Las mejores teclados',80.12,100);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Laptop DELL','Dell','Las mejores laptop',200.8,15);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Pantalla','HP','Las mejores Pantallas',155.69,50);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Impresora','HP','Las mejores Impresoras',155,70);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Camaras','logitech','Las mejores Camaras',500,20);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Xbox 360','Xbox Microsoft','Las mejores Consolas',103,10);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('PlayStation 4','Sony','Las mejores play',15.69,50);
insert into productos(nombre, proveedor, descripcion, precio, cantidad) values('Lenovo 310','Lenovo','Las mejores laptop',155.69,50);


select nombre, precio, cantidad from productos;
select nombre, precio, cantidad, precio*cantidad from productos;
select nombre, precio,precio*0.1,precio-(precio*0.1) from productos;


select concat('Hola,',' ','como estas?');

select concat_ws('/','Miguel','Lopez','Martinez'); #separar las palabras por el simbolo /
select length('Samara Aparicio Vergara'); #cuenta cantidad de espacios 
select left('Buenas Noches',8); #Muestra las letras segun los espacios resaltados de izquierda a derecha
select right('Buenas Tardes',10);#muestra las letras segun los espacios resaltados d derecha a izquierda
select ltrim('        Udemy     ');
select rtrim('      Udemy    ');
select trim('    Udemy    ');
select replace('xxx.udemy.com','x','w');
select repeat('SQL', 5);
select reverse('Hola');
select lower('Hola, CoMO EsTaN?'); #cambian la letra a minuscula
select lcase('Hola, CoMO EsTaN?');
select upper('Hola, CoMO EsTaN?');#cambian la letra a mayuscula
select ucase('hola amigos');


select concat_ws('/', nombre, precio) from productos;
select left(nombre, 5) from productos;
select lower(nombre), upper(descripcion) from productos;

#Funciones Matematicas
select nombre, precio from productos;
select ceiling(precio) from productos;
select floor(precio) from productos;
select mod(10, 3);
select mod(10, 2);
select power(2,3);
select round(20.60);
select round(20.12);

#Order By
select nombre, descripcion, precio, cantidad from productos order by nombre;
select nombre, precio, cantidad from productos order by nombre desc;
select nombre, precio, descripcion, cantidad from productos order by nombre desc, precio asc;



