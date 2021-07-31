UNLOCK TABLES;
DROP DATABASE IF EXISTS ej3ud15;
CREATE DATABASE IF NOT EXISTS ej3ud15 CHARACTER SET= utf8mb4 COLLATE= utf8mb4_unicode_ci;
USE ej3ud15;

DROP TABLE IF EXISTS cientificos;
CREATE TABLE IF NOT EXISTS cientificos (
	dni varchar(8),
    nomApels nvarchar(255),
    PRIMARY KEY(dni)
);

INSERT INTO cientificos VALUES ('71496825','Ruben'),('71459738','Raul'),('91487652','Daniel'),('87416435','Pepe'),('84751487','Javi'),
							('91468759','Veronica'),('64187546','Elena'),('91754867','Cristina'),('91457864','Carmen'),('91478547','Thais');


DROP TABLE IF EXISTS proyecto;
CREATE TABLE IF NOT EXISTS proyecto (
	id char(4),
    nombre nvarchar(255),
    horas int,
    PRIMARY KEY(id)
);

INSERT INTO proyecto VALUES (1, 'KB759', 120),(2, 'KB760', 70),(3, 'KB761', 250),(4, 'KB762', 200),(5, 'KB763', 120),
							(6, 'K55P1', 35),(7, 'K55P2', 80),(8, 'K55P3', 99),(9, 'K55P4', 66),(10, 'K55P15', 74);


DROP TABLE IF EXISTS asignado_a;
CREATE TABLE IF NOT EXISTS asignado_a (
	cientifico varchar(8),
    proyecto char(4),
    PRIMARY KEY(cientifico, proyecto),
    FOREIGN KEY(cientifico) REFERENCES cientificos(dni),
    FOREIGN KEY(proyecto) REFERENCES proyecto(id)
);

INSERT INTO asignado_a VALUES ('71496825','1'),('71459738','2'),('91487652','3'),('87416435','7'),('84751487','10'),
							('91468759','5'),('64187546','4'),('91754867','8'),('91457864','6'),('91478547','9');
