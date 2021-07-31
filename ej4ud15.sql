UNLOCK TABLES;
DROP DATABASE IF EXISTS ej4ud15;
CREATE DATABASE IF NOT EXISTS ej4ud15 CHARACTER SET= utf8mb4 COLLATE= utf8mb4_unicode_ci;
USE ej4ud15;

DROP TABLE IF EXISTS cajeros;
CREATE TABLE IF NOT EXISTS cajeros (
	codigo int auto_increment,
    nomApels nvarchar(255),
    PRIMARY KEY(codigo)
);

INSERT INTO cajeros VALUES (1,'Ruben'),(2,'Raul'),(3,'Daniel'),(4,'Pepe'),(5,'Javi'),
							(6,'Veronica'),(7,'Elena'),(8,'Cristina'),(9,'Carmen'),(10,'Thais');


DROP TABLE IF EXISTS productos;
CREATE TABLE IF NOT EXISTS productos (
	codigo int auto_increment,
    nombre nvarchar(100),
    precio int,
    PRIMARY KEY(codigo)
);

INSERT INTO productos VALUES (1, 'Latas Cocacola x 6', 3),(2, 'Atun 500g', 4),(3, 'Patatas 3kg', 2),(4, 'Cerveza San Miguel x 6', 4),(5, 'Palomitas x 4', 2),
							(6, 'Ruffles 700g', 2),(7, 'Cafe 500g x 2', 6),(8, 'Bizcocho 400g', 3),(9, 'Pan x 2 barras', 1),(10, 'Monster 500ml x 4', 5);

DROP TABLE IF EXISTS maquinas_registradoras;
CREATE TABLE IF NOT EXISTS maquinas_registradoras (
	codigo int auto_increment,
    piso int,
    PRIMARY KEY(codigo)
);

INSERT INTO maquinas_registradoras VALUES (1, 1),(2, 3),(3, 2),(4, 1),(5, 0),
							(6, 0),(7, 2),(8, 3),(9, 1),(10, 2);
                            
DROP TABLE IF EXISTS venta;
CREATE TABLE IF NOT EXISTS venta (
	cajero int,
    maquina int,
    producto int,
    PRIMARY KEY(cajero, maquina, producto),
    FOREIGN KEY(cajero) REFERENCES cajeros(codigo),
    FOREIGN KEY(maquina) REFERENCES maquinas_registradoras(codigo),
    FOREIGN KEY(producto) REFERENCES productos(codigo)
);

INSERT INTO venta VALUES (1, 10, 4),(2, 4, 6),(3, 7, 2),(4, 9, 8),(5, 1, 5),
							(6, 3, 7),(7, 6, 3),(8, 5, 9),(9, 8, 1),(10, 2, 10);
