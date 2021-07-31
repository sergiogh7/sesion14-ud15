UNLOCK TABLES;
DROP DATABASE IF EXISTS ej5ud15;
CREATE DATABASE IF NOT EXISTS ej5ud15 CHARACTER SET= utf8mb4 COLLATE= utf8mb4_unicode_ci;
USE ej5ud15;

DROP TABLE IF EXISTS facultad;
CREATE TABLE IF NOT EXISTS facultad (
	codigo int,
    nombre nvarchar(100),
    PRIMARY KEY(codigo)
);

INSERT INTO facultad VALUES (1,'Artes y humanidades'),(2,'Ciencias'),(3,'Ciencias de la salud'),
							(4,'Ciencias sociales y jurídicas'),(5,'Ingeniería y arquitectura');

DROP TABLE IF EXISTS investigadores;
CREATE TABLE IF NOT EXISTS investigadores (
	dni varchar(8),
    nomApels nvarchar(255),
    facultad int,
    PRIMARY KEY(dni),
    FOREIGN KEY(facultad) REFERENCES facultad(codigo)
);

INSERT INTO investigadores VALUES ('78145469','Ruben', 1),('71468294','Veronica', 2),
								('91648573','Daniel', 3),('71468531','Elena', 4),
                                ('91478465','Javi', 5);

DROP TABLE IF EXISTS equipos;
CREATE TABLE IF NOT EXISTS equipos (
	numSerie char(4),
    nombre nvarchar(100),
    facultad int,
    PRIMARY KEY(numSerie),
    FOREIGN KEY(facultad) REFERENCES facultad(codigo)
);

INSERT INTO equipos VALUES ('741','Arte', 1),('314','Ciencia_1', 2),
								('649','Ciencia_2', 3),('227','Ciencia_3', 4),
                                ('415','Ingenieria', 5);

DROP TABLE IF EXISTS reserva;
CREATE TABLE IF NOT EXISTS reserva (
	dni varchar(8),
	numSerie char(4),
    comienzo datetime,
    fin datetime,
    PRIMARY KEY(dni, numSerie),
    FOREIGN KEY(dni) REFERENCES investigadores(dni),
    FOREIGN KEY(numSerie) REFERENCES equipos(numSerie)
);

INSERT INTO reserva VALUES ('78145469','741', '2020-06-01', '2020-06-22'),('71468294','314', '2021-01-05', '2021-02-01'),
							('91648573','649', '2020-02-07', '2020-03-18'),('71468531','227', '2020-08-21', '2020-10-25'),
							('91478465','415', '2021-03-15', '2021-06-10');