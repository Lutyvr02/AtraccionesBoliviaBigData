CREATE DATABASE PredicPicos;

USE PredicPicos;

CREATE TABLE dim_departamentos (
	id INT PRIMARY KEY,
    nombre VARCHAR(50),
    CreatedAt VARCHAR(50),
    UpdatedAt VARCHAR(50)
);

CREATE TABLE dim_clima_2023 (
	id INT PRIMARY KEY,
    idDepartamento INT,
    mes INT,
    temperatura DOUBLE,
	FOREIGN KEY (idDepartamento) REFERENCES dim_departamentos(id)
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

CREATE TABLE dim_time_fact2 (
	id INT PRIMARY KEY,
    trimestre INT,
    anio INT
);

CREATE TABLE facto2 (
  idTime INT,
  idAtraccion INT,
  IdDepartamento INT,
  TotalPersonas INT,

  FOREIGN KEY (idTime) REFERENCES dim_time_fact2(id),
  FOREIGN KEY (idAtraccion) REFERENCES dim_atracciones(id),
  FOREIGN KEY (IdDepartamento) REFERENCES dim_departamentos(id)
);
select * from dim_departamentos;
select * from dim_clima_2023;
select * from dim_atracciones;
select * from dim_time_fact2;
select * from facto2;