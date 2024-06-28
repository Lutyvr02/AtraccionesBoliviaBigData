CREATE DATABASE afluenciaPersonas;

USE afluenciaPersonas;

CREATE TABLE dim_transporte (
  id INT PRIMARY KEY,
  nombre VARCHAR(30)
);

CREATE TABLE dim_dias_festivos (
  id_diafestivo INT PRIMARY KEY,
  nombre VARCHAR(100),
  fecha VARCHAR(50)
);

CREATE TABLE dim_eventos (
  id INT PRIMARY KEY,
  name VARCHAR(255),
  fecha DATE,
  descripcion VARCHAR(255),
  activo BOOLEAN,
  diaFestivoID INT,
  FOREIGN KEY (diaFestivoID) REFERENCES dim_dias_festivos(id_diafestivo)
);

CREATE TABLE dim_departamentos (
	id INT PRIMARY KEY,
    nombre VARCHAR(50),
    CreatedAt VARCHAR(50),
    UpdatedAt VARCHAR(50)
);


CREATE TABLE dim_atracciones ( 
  id INT PRIMARY KEY,
  Nombre VARCHAR(255),
  Ubicacion VARCHAR(255),
  Descripcion VARCHAR(250),
  HorarioAbre VARCHAR(50),
  HorarioCierre VARCHAR(50),
  IdDepartamento INT,
  CreatedAt VARCHAR(50),
  UpdatedAt VARCHAR(50),
  FOREIGN KEY (IdDepartamento) REFERENCES dim_departamentos(id)
);

CREATE TABLE dim_promocion (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  descuento INT
);

CREATE TABLE dim_time (
  id INT PRIMARY KEY,
  date VARCHAR(50),
  dia_semana VARCHAR(50),
  semana INT,
  mes INT,
  trimestre INT,
  anio INT
);

CREATE TABLE facto1 (
  idTransporte INT,
  idAtraccion INT,
  idPromocion INT,
  idEventos INT,
  idTime INT,
  TotalPersonas INT,
  
  FOREIGN KEY (idTransporte) REFERENCES dim_transporte(id),
  FOREIGN KEY (idAtraccion) REFERENCES dim_atracciones(id),
  FOREIGN KEY (idPromocion) REFERENCES dim_promocion(id),
  FOREIGN KEY (idEventos) REFERENCES dim_eventos(id),
  FOREIGN KEY (idTime) REFERENCES dim_time(id)

);
select * from dim_atracciones;
select * from dim_time;
select * from dim_departamentos;
select * from dim_dias_festivos;
select * from dim_eventos;
select * from dim_promocion;
select * from dim_transporte;
select * from facto1;