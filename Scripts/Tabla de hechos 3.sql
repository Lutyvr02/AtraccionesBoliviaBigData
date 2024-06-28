CREATE DATABASE RecoPers;
USE RecoPers;

CREATE TABLE dim_atracciones (
  id INT PRIMARY KEY,
  nombreAtraccion VARCHAR(255),
  nombreDepartamento VARCHAR(255)
);

CREATE TABLE dim_comentarios (
	id INT PRIMARY KEY,
    texto VARCHAR(255),
    calificacion INT
);

CREATE TABLE dim_time (
	id INT PRIMARY KEY,
    timestamp VARCHAR(255)
);

CREATE TABLE dim_usuarios (
	id INT PRIMARY KEY,
    nombre VARCHAR(70),
    apellido VARCHAR(70)
);
CREATE TABLE facto3 (
  comentarios_id INT,
  usuario_id INT,
  calificacion INT,
  time_id INT,
  atraccionTuristicaId INT,

  FOREIGN KEY (comentarios_id) REFERENCES dim_comentarios(id),
  FOREIGN KEY (usuario_id) REFERENCES dim_usuarios(id),
  FOREIGN KEY (time_id) REFERENCES dim_time(id),
  FOREIGN KEY (atraccionTuristicaId) REFERENCES dim_atracciones(id)
);
select * from dim_comentarios;
select * from dim_usuarios;
select * from dim_time;
select * from dim_atracciones;
select * from facto3;