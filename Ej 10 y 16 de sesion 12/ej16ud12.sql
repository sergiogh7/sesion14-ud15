UNLOCK TABLES;
DROP DATABASE IF EXISTS ej16ud12;
CREATE DATABASE IF NOT EXISTS ej16ud12 CHARACTER SET= utf8mb4 COLLATE= utf8mb4_unicode_ci;
USE ej16ud12;

DROP TABLE IF EXISTS tweets;
CREATE TABLE IF NOT EXISTS tweets (
	id int auto_increment,
    nombreUsuario varchar(50),
    fecha datetime,
    foto boolean,
    texto varchar(255),
    numeroRetweets int,
    numeroMeGusta int,
    PRIMARY KEY(id)
);

INSERT INTO tweets VALUES (1, 'Corretone', '2020-08-21', true, 'Happy Birthday!!!', 77, 666);

DROP TABLE IF EXISTS mensajes;
CREATE TABLE IF NOT EXISTS mensajes (
	id int auto_increment,
    hora varchar(10),
    remitente varchar(50),
    destinatario varchar(50),
    PRIMARY KEY(id)
);

INSERT INTO mensajes VALUES (1, '16:00', 'Corretone', 'Lucifer');

DROP TABLE IF EXISTS usuarios;
CREATE TABLE IF NOT EXISTS usuarios (
	id int auto_increment,
    nombreUsaurio varchar(50),
    fechaAlta date,
    fotoPerfil boolean,
    email varchar(50),
    contrasenya varchar(50),
    idMensaje int,
    PRIMARY KEY(id),
	FOREIGN KEY(idMensaje) REFERENCES mensajes(id)
);

INSERT INTO usuarios VALUES (1, 'Corretone', '2012-08-21', true, 'corretone@gmail.com', '9iKp2SzCt6', 1);

DROP TABLE IF EXISTS sigue;
CREATE TABLE IF NOT EXISTS sigue (
	id int auto_increment,
    idSeguido int,
    PRIMARY KEY(id, idSeguido),
	FOREIGN KEY(idSeguido) REFERENCES usuarios(id)
);

DROP TABLE IF EXISTS acciones;
CREATE TABLE IF NOT EXISTS acciones (
	menciona boolean,
    contesta boolean,
    retweet boolean,
    crea boolean,
    idUsuario int,
    idTweet int,
	FOREIGN KEY(idUsuario) REFERENCES usuarios(id),
    FOREIGN KEY(idTweet) REFERENCES tweets(id)
);

INSERT INTO acciones VALUES (true, true, true, true, 1, 1);

DROP TABLE IF EXISTS hashtag;
CREATE TABLE IF NOT EXISTS hashtag (
    nombre varchar(50),
    PRIMARY KEY(nombre)
);

INSERT INTO hashtag VALUES ('#HappyBdayCorretone');

DROP TABLE IF EXISTS usa;
CREATE TABLE IF NOT EXISTS usa (
	idUsuario int,
    nombreHashtag varchar(50),
    PRIMARY KEY(idUsuario, nombreHashtag),
	FOREIGN KEY(idUsuario) REFERENCES usuarios(id),
    FOREIGN KEY(nombreHashtag) REFERENCES hashtag(nombre)
);

INSERT INTO usa VALUES (1, '#HappyBdayCorretone');

DROP TABLE IF EXISTS tiene;
CREATE TABLE IF NOT EXISTS tiene (
    nombreHashtag varchar(50),
    idTweet int,
    PRIMARY KEY(nombreHashtag, idTweet),
    FOREIGN KEY(nombreHashtag) REFERENCES hashtag(nombre),
    FOREIGN KEY(idTweet) REFERENCES tweets(id)
);

INSERT INTO tiene VALUES ('#HappyBdayCorretone', 1);