UNLOCK TABLES;
DROP DATABASE IF EXISTS ej2ud15;
CREATE DATABASE IF NOT EXISTS ej2ud15 CHARACTER SET= utf8mb4 COLLATE= utf8mb4_unicode_ci;
USE ej2ud15;

DROP TABLE IF EXISTS piezas;
CREATE TABLE IF NOT EXISTS piezas (
	codigo int auto_increment,
    nombre nvarchar(100),
    PRIMARY KEY(codigo)
);

INSERT INTO piezas VALUES (1,'tubo de escape'),(2,'asiento de cuero'),(3,'alfombrilla'),(4,'bola remolque'),(5,'bola palanca de cambio'),
							(6,'cojin decoracion'),(7,'colgante retrovisor'),(8,'tinta lunas traseras'),(9,'pegatinas NOS'),(10,'embellecedor cambio marchas');

DROP TABLE IF EXISTS proveedores;
CREATE TABLE IF NOT EXISTS proveedores (
	id char(4),
    nombre nvarchar(100),
    PRIMARY KEY(id)
);

INSERT INTO proveedores VALUES ('ST','Seat'),('DC','DecoCar');

DROP TABLE IF EXISTS suministra;
CREATE TABLE IF NOT EXISTS suministra (
	codigoPieza int,
	idProveedor char(4),
    precio int,
    PRIMARY KEY(codigoPieza, idProveedor),
    FOREIGN KEY(codigoPieza) REFERENCES piezas(codigo),
    FOREIGN KEY(idProveedor) REFERENCES proveedores(id)
);

INSERT INTO suministra VALUES (1, 'ST', '155'),(2, 'ST', '300'),
								(3, 'ST', '20'),(4, 'ST', '33'),
                                (5, 'ST', '28'),(6, 'DC', '12'),
                                (7, 'DC', '4'),(8, 'DC', '132'),
                                (9, 'DC', '6'),(10, 'DC', '35');