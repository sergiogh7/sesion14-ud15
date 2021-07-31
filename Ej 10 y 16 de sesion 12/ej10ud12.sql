UNLOCK TABLES;
DROP DATABASE IF EXISTS ej10ud12;
CREATE DATABASE IF NOT EXISTS ej10ud12 CHARACTER SET= utf8mb4 COLLATE= utf8mb4_unicode_ci;
USE ej10ud12;

DROP TABLE IF EXISTS temporadas;
CREATE TABLE IF NOT EXISTS temporadas (
	anyo int,
    fechaInicio datetime,
    fechaFin datetime,
    maximoGoleador varchar(50),
    maximoAsistente varchar(50),
    numeroJornadas int,
    PRIMARY KEY(anyo)
);

INSERT INTO temporadas VALUES (2021, '2020-09-12', '2021-05-23', 'Lionel Messi', 'Iago Aspas', 38);

DROP TABLE IF EXISTS equipos;
CREATE TABLE IF NOT EXISTS equipos (
	idEquipo int auto_increment,
	nombre varchar(50),
    añoFundacion int,
    sede varchar(25),
    anyoTemporada int,
    PRIMARY KEY(idEquipo),
    FOREIGN KEY(anyoTemporada) REFERENCES temporadas(anyo)
);

INSERT INTO equipos VALUES (1, 'Real Marid', 1902, 'Madrid', 2021),
							(2, 'FC Barcelona', 1899, 'Barcelona', 2021),
							(3, 'Atlético de Madrid', 1903, 'Madrid', 2021);

-- La foreign key referencia a equipos, el nombre del club por ser 1-N
DROP TABLE IF EXISTS jugadores;
CREATE TABLE IF NOT EXISTS jugadores (
	id int auto_increment,
    dorsal int,
    nombre varchar(50),
    apellidos varchar(100),
    anyoNacimiento int,
    peso int,
    altura int,
    idEquipo int,
    PRIMARY KEY(id),
    FOREIGN KEY(idEquipo) REFERENCES equipos(idEquipo)
);

INSERT INTO jugadores VALUES (1, 10, 'Luka', 'Modric', 1985, 66, 172, 1),
							(2, 10, 'Lionel', 'Messi', 1987, 72, 170, 2),
							(3, 6, 'Koke', 'Resurrección', 1992, 73, 178, 3);

-- Esta tabla se relaciona con equipos ya que un estadio pertenece a un club.
DROP TABLE IF EXISTS estadios;
CREATE TABLE IF NOT EXISTS estadios (
	nombre varchar(50),
    añoConstruccion int,
    direccion varchar(255),
    idEquipo int,
    PRIMARY KEY(nombre),
	FOREIGN KEY(idEquipo) REFERENCES equipos(idEquipo)
);

INSERT INTO estadios VALUES ('Santiago Bernabeu', 1947, 'Av. de Concha Espina, 1, 28036 Madrid', 1),
							('Camp Nou', '1957', 'C. dArístides Maillol, 12, 08028 Barcelona', 2),
							('Wanda Metropolitano', '2017', 'Av. de Luis Aragonés, 4, 28022 Madrid', 3);

-- Esta tabla se relaciona con equipos ya que un equipo tiene un entrenador.
DROP TABLE IF EXISTS entrenadores;
CREATE TABLE IF NOT EXISTS entrenadores (
	id int auto_increment,
	nombre varchar(50),
    apellidos varchar(100),
	idEquipo int,
    PRIMARY KEY(id),
    FOREIGN KEY(idEquipo) REFERENCES equipos(idEquipo)
);

INSERT INTO entrenadores VALUES (1, 'Carlo', 'Ancelotti', 1),
							(2, 'Ronald', 'Koeman', 2),
							(3, 'Diego Pablo', 'Simeone', 3);
                            
DROP TABLE IF EXISTS partidos;
CREATE TABLE IF NOT EXISTS partidos (
	id int auto_increment,
	fecha datetime,
    jornada int,
    nombreEquipoLocal varchar(50),
    nombreEquipoVisitante varchar(50),
    resultado char(3),
    idEquipo int,
    PRIMARY KEY(id),
    FOREIGN KEY(idEquipo) REFERENCES equipos(idEquipo)
);

INSERT INTO partidos VALUES (1, '2021-04-10', 30, 'Real Madrid', 'FC Barcelona', '2-1', 1),
							(2, '2021-02-07', 22, 'Betis', 'FC Barcelona', '0-3', 2),
							(3, '2021-02-28', 25, 'Villarreal', 'Atlético de Madrid', '0-2', 3);
                            
-- Esta tabla conecta entre estadios y partidos al ser N-N
DROP TABLE IF EXISTS juega;
CREATE TABLE IF NOT EXISTS juega (
	idEquipo int auto_increment,
	id int,
    PRIMARY KEY(idEquipo, id),
    FOREIGN KEY(idEquipo) REFERENCES equipos(idEquipo),
    FOREIGN KEY(id) REFERENCES partidos(id)
);

INSERT INTO juega VALUES (1, 1), (2, 2), (3, 3);