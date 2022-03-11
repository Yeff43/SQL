drop database if exists RECUPERACION;

create database RECUPERACION;

use RECUPERACION;

create table CLIENTE(
  id int auto_increment primary key ,
  nombre varchar(25) null,
  primer_apellido varchar(15) not null,
  ciudad varchar(30) not null,
  categoria enum('oro','plata','bronze')
);

create table COMERCIAL(
  id int auto_increment primary key,
  nombre varchar(25) not null,
  apellido1 varchar(15) not null,
  apellido2 varchar(15) not null,
  ciudad varchar(30) not null,
  comision float not null
);

create table PRODUCTO(
  referencia varchar(7) primary key,
  descripcion varchar(100) null,
  modelo varchar(10) not null,
  fabricante varchar(30) not null
);

create table VENTA(
  id int auto_increment primary key,
  idCliente int,
  idComercial int,
  idProducto varchar(7),
  unidades int not null,
  fecha DATE not null,
  foreign key (idCliente) references CLIENTE(id)
                               on delete cascade on update cascade,
  foreign key (idComercial) references COMERCIAL(id)
                               on delete restrict on update cascade,
  foreign key (idProducto) references PRODUCTO(referencia)
                               on delete restrict on update cascade
);
-- 2
ALTER TABLE CLIENTE modify nombre VARCHAR(100) not null;

-- 3
ALTER TABLE CLIENTE ADD apellido2 VARCHAR(100) NOT NULL AFTER primer_apellido;

-- 4
ALTER TABLE CLIENTE drop column categoria;

-- 5
insert into CLIENTE(nombre, primer_apellido,recuperacion.cliente.apellido2, ciudad) values ('ruben','garcia','sanchez','barcelona');

-- 6
insert into COMERCIAL(NOMBRE, APELLIDO1, APELLIDO2, CIUDAD, COMISION) values
('paco','lopez','segura','madrid','400'),
('luis','sevilla','fernandez','cadiz',200);

-- 7
insert into PRODUCTO values
('abc454','pieza pequeña','abc','luz'),
('cds345',null,'dfc','cartel');

-- 8
delete from PRODUCTO where descripcion = null;

-- 9
update COMERCIAL
    set comision = comision+100;


