DROP DATABASE IF EXISTS Musica;
CREATE DATABASE Musica;
USE Musica;
CREATE TABLE CDs (
  Autor VARCHAR(255) NOT NULL,
  Disco VARCHAR(255) NOT NULL,
  Pais VARCHAR(255) NOT NULL,
  Precio FLOAT NOT NULL
);

INSERT INTO CDs(Autor,Disco,Pais,Precio) VALUES('Linkin Park','Meteora', 'USA' ,3.95);
INSERT INTO CDs(Autor,Disco,Pais,Precio) VALUES('The Prodigy','Invaders must die', 'USA' ,2.95);
INSERT INTO CDs(Autor,Disco,Pais,Precio) VALUES('Evanescense','Fallen', 'USA' ,1.95);
INSERT INTO CDs(Autor,Disco,Pais,Precio) VALUES('Red Hot Chili Peppers','Californication', 'USA' ,6.95);
INSERT INTO CDs(Autor,Disco,Pais,Precio) VALUES('U2','Vertigo', 'Irlanda' ,5.95);
INSERT INTO CDs(Autor,Disco,Pais,Precio) VALUES('Daft Punk','Alive 2007', 'Francia' ,4.95);
INSERT INTO CDs(Autor,Disco,Pais,Precio) VALUES('Rise Against','The Sufferer & the Witness', 'USA' ,6.95);

CREATE TABLE Compra (
  id INTEGER NOT NULL AUTO_INCREMENT,
  Disco VARCHAR(255) NOT NULL,
  Precio FLOAT NOT NULL,
  PrecioT FLOAT NOT NULL,
  Cantidad INTEGER NOT NULL,
  Primary Key (id)
);