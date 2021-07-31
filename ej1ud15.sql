UNLOCK TABLES;
DROP DATABASE IF EXISTS ej1ud15;
CREATE DATABASE IF NOT EXISTS ej1ud15 CHARACTER SET= utf8mb4 COLLATE= utf8mb4_unicode_ci;
USE ej1ud15;

DROP TABLE IF EXISTS despachos;
CREATE TABLE IF NOT EXISTS despachos (
	numero int,
    capacidad int,
    PRIMARY KEY(numero)
);

INSERT INTO despachos VALUES (1,25),(2,5),(3,14),(4,10),(5,40),(6,19),(7,24),(8,34),(9,7),(10,12);

DROP TABLE IF EXISTS directores;
CREATE TABLE IF NOT EXISTS directores (
	dni varchar(8),
	nomApels nvarchar(255),
    dnijefe varchar(8),
    despacho int,
    PRIMARY KEY(dni),
    FOREIGN KEY(dnijefe) REFERENCES directores(dni),
    FOREIGN KEY(despacho) REFERENCES despachos(numero)
);

INSERT INTO directores VALUES ('47917622','Pepe','47917622',2),('74613498','Aitor','47917622',8),
								('46137945','Lolo','47917622',7),('24613784','Katherine','47917622',6),
                                ('17946832','Cristian','47917622',1),('94672158','Juan','47917622',9),
                                ('94672851','Raul','47917622',3),('94312768','Daniel','47917622',5),
                                ('11794685','MAria','47917622',4),('64872159','Pedro','47917622',10);