-- ASB Desafío 3
-- Daniel Enrique Flores Lino - FL220294

CREATE DATABASE clinica;
USE clinica;

-- 1. Modelo de base de datos

CREATE TABLE mascotas (
  id int PRIMARY KEY AUTO_INCREMENT,
  especie varchar(20) NOT NULL,
  raza varchar(20) NOT NULL,
  sexo varchar(2) NOT NULL,
  edad tinyint NOT NULL,
  estado_salud varchar(10) NOT NULL,
  estado_adopcion varchar(20) NOT NULL
);

CREATE TABLE adoptantes (
  dui char(10),
  nombre varchar(40) NOT NULL,
  fecha_nacimiento date NOT NULL,
  telefono char(9) NOT NULL,
  email varchar(40),
  direccion varchar(200) NOT NULL
);

CREATE TABLE empleados (
  carnet char(8),
  nombre varchar(40) NOT NULL,
  fecha_nacimiento date NOT NULL,
  telefono char(9) NOT NULL,
  email varchar(40) NOT NULL,
  direccion varchar(200) NOT NULL,
  fecha_union date NOT NULL
);

CREATE TABLE adopciones (
  id_mascota int,
  dui_adoptante char(10),
  carnet_empleado char(8),
  fecha date NOT NULL,
  CONSTRAINT pk_adopcion PRIMARY KEY (id_mascota, dui_adoptante),
  CONSTRAINT fk_mascota_adopcion FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_adoptante FOREIGN KEY (dui_adoptante) REFERENCES adoptantes(dui) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_empleado FOREIGN KEY (carnet_empleado) REFERENCES empleados(carnet) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE controles_postadopcion (
  id int PRIMARY KEY AUTO_INCREMENT,
  id_mascota int,
  tipo_control varchar(20),
  carnet_empleado char(8),
  fecha date,
  CONSTRAINT fk_mascota_control FOREIGN KEY (id_mascota) REFERENCES mascotas(id) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_empleado FOREIGN KEY (carnet_empleado) REFERENCES empleados(carnet) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 2. Carga de datos

INSERT INTO mascotas(especie, raza, sexo, edad, estado_salud, estado_adopcion) VALUES
('Perro', 'Golden retriever', 'm', 3, 'Sano', 'No adoptada'),
('Gato', 'Bengala', 'm', 1, 'Sano', 'Adoptada'),
('Conejo', 'Belier', 'm', 5, 'Sano', 'Adoptada'),
('Perro', 'Rottweiler', 'f', 2, 'Sano', 'No adoptada'),
('Gato', 'Bengala', 'f', 2, 'Sano', 'No adoptada'),
('Perro', 'Pastor alemán', 'f', 5, 'Sano', 'Adoptada'),
('Gato', 'Siamés', 'm', 1, 'Sano', 'No adoptada'),
('Gato', 'Siamés', 'f', 2, 'Sano', 'Adoptada'),
('Perro', 'Golden retriever', 'f', 3, 'Enfermo', 'No adoptada'),
('Gato', 'Ragdoll', 'm', 1, 'Sano', 'No adoptada'),
('Perro', 'Husky siberiano', 'f', 2, 'Sano', 'No adoptada'),
('Conejo', 'Holland Lop', 'f', 5, 'Sano', 'No adoptada'),
('Gato', 'Común europeo', 'm', 2, 'Enfermo', 'Adoptada'),
('Gato', 'Maine coon', 'm', 3, 'Sano', 'Adoptada'),
('Perro', 'Bulldog francés', 'm', 3, 'Sano', 'Adoptada'),
('Conejo', 'Angora', 'm', 5, 'Sano', 'Adoptada'),
('Conejo', 'Netherland dwarf', 'm', 2, 'Sano', 'Adoptada'),
('Gato', 'Ragdoll', 'm', 4, 'Sano', 'Adoptada'),
('Perro', 'Chihuahua', 'f', 2, 'Sano', 'Adoptada'),
('Perro', 'Husky siberiano', 'f', 2, 'Sano', 'No adoptada');

INSERT INTO adoptantes VALUES
('56085842-2', 'María Gloria Ortiz Pla', '1967-07-23', '2110-8891', null, '38 Av Sur No 412, San Salvador'),
('41345981-1', 'Oriol Iker Pozo Sánchez', '2004-12-15', '7478-1821', 'oriol.pozo77@gmail.com', 'Bo El Calvario Av Los Cañales No 1-20 Juayúa, Sonsonate'),
('37934127-1', 'Ingrid Saraí de la Cruz Alcaraz', '1973-06-05', '7482-0676', 'ingrid.delacruz39@yahoo.com', 'Bo Nuevo 4 Cl Pte Y 3 Av Sur, Jocoro, Morazán'),
('34582255-1', 'Alejandro Manuel Heredia del Valle', '1976-07-06', '7325-1812', 'alejo.heredia49@outlook.com', 'Bo El Centro Fte Pqe José María Peña, El Sauce, la Unión'),
('77461228-0', 'Eric Marco Chico Moyano', '1968-05-06', '2537-5321', null, 'Colonia Las Victorias I Cl El Mirador No 107 San Martín, San Martín, San Salvador'),
('47889608-3', 'Alicia Martina Romera Parrilla', '2000-11-04', '2548-6258', 'alicia.romera74@outlook.com', '38 Av Sur No 413, San Salvador'),
('38151061-2', 'Olga María Martos Puerta', '1974-06-13', '2764-0740', null, '31 Av Nte Ctgo A Administraciones De Renta, Cuscatlán, Cojutepeque'),
('66425432-0', 'Francisco Manuel Valero Toledo', '1982-09-25', '2010-1772', 'francisco.valero96@yahoo.com', 'Jard De La Libertad Cl Chiltiupán No 11 Sta Tecla, La Libertad'),
('12278583-2', 'Jan Constantin Labrador Segarra', '1999-10-20', '7604-9503', 'jan.labrador08@gmail.com', 'Col Campestre Av Juan Ramón Molina No 19-B, San Salvador'),
('68466497-2', 'Elizabeth Delfina Corral Vaquero', '1984-06-23', '7912-8367', 'eli.corral53@gmail.com', 'Resid Bosques De La Paz 20 Cl Ote No 79 Ilopango, Soyapango, San Salvador');

INSERT INTO empleados VALUES
('LH254800', 'Jorge Nestor Llorens Hicham', '1966-05-26', '7607-9957', 'jorge.llorens43@gmail.com', 'Bo Concepción Av 28 De Octubre No 8 Nejapa, San Salvador', '2025-03-30'),
('RR229998', 'Dennis Ripoll', '1971-08-30', '2479-6555', 'dennis.ripoll52@gmail.com', 'Resid Los Elíseos No 15-A, San Salvador', '2022-05-15'),
('IR207577', 'María Dolores Iglesias Ruano', '2000-09-03', '7334-8073', 'dolores.iglesias77@gmail.com', 'Bo San Juan 6 Cl Ote Cl A La Estación Fte A Rastro, Cojutepeque', '2020-06-19'),
('QL233686', 'Juan Enrique Quintana Lago', '1996-02-23', '2824-2696', 'juan.quintana74@yahoo.com', 'Bo El Calvario Av Los Cañales No 1-18 Juayúa, Sonsonate', '2023-06-12'),
('SM211281', 'Julia Virtudes Sainz Monzón', '1974-07-13', '2115-5777', 'julia.sainz99@outlook.com', 'Col Magaña 14 Av Nte No 1379, San Salvador', '2021-02-24');

INSERT INTO adopciones VALUES
(6, '41345981-1', 'LH254800', '2020-07-15'),
(17, '37934127-1', 'IR207577', '2021-04-17'),
(8, '56085842-2', 'RR229998', '2021-06-19'),
(18, '66425432-0', 'QL233686', '2021-10-20'),
(2, '38151061-2', 'SM211281', '2022-05-09'),
(3, '12278583-2', 'QL233686', '2022-05-23'),
(16, '68466497-2', 'RR229998', '2023-08-05'),
(14, '77461228-0', 'QL233686', '2024-07-25'),
(13, '47889608-3', 'SM211281', '2024-09-17'),
(19, '34582255-1', 'LH254800', '2024-10-30'),
(15, '56085842-2', 'IR207577', '2025-04-30');

INSERT INTO controles_postadopcion(id_mascota, tipo_control, carnet_empleado, fecha) VALUES
(6, 'Desparasitante', 'LH254800', '2021-02-06'),
(6, 'Vacunación', 'RR229998', '2021-06-19'),
(17, 'Vacunación', 'IR207577', '2021-10-05'),
(8, 'Desparasitante', 'QL233686', '2021-11-18'),
(6, 'Desparasitante', 'SM211281', '2021-11-21'),
(17, 'Desparasitante', 'LH254800', '2022-01-12'),
(8, 'Vacunación', 'RR229998', '2022-03-26'),
(6, 'Vacunación', 'IR207577', '2022-05-12'),
(17, 'Vacunación', 'QL233686', '2022-07-05'),
(2, 'Desparasitante', 'SM211281', '2022-08-28'),
(8, 'Desparasitante', 'LH254800', '2022-09-30'),
(3, 'Vacunación', 'RR229998', '2022-10-01'),
(6, 'Desparasitante', 'IR207577', '2022-11-15'),
(17, 'Desparasitante', 'QL233686', '2023-01-20'),
(2, 'Vacunación', 'SM211281', '2023-02-14'),
(8, 'Vacunación', 'LH254800', '2023-03-03'),
(3, 'Desparasitante', 'RR229998', '2023-04-27'),
(6, 'Vacunación', 'IR207577', '2023-05-09'),
(17, 'Vacunación', 'QL233686', '2023-07-13'),
(2, 'Desparasitante', 'SM211281', '2023-10-02'),
(16, 'Vacunación', 'LH254800', '2023-11-08'),
(8, 'Desparasitante', 'RR229998', '2023-12-16'),
(3, 'Vacunación', 'IR207577', '2024-01-29'),
(17, 'Desparasitante', 'QL233686', '2024-02-04'),
(2, 'Vacunación', 'SM211281', '2024-04-07'),
(16, 'Desparasitante', 'LH254800', '2024-05-17'),
(8, 'Vacunación', 'RR229998', '2024-06-12'),
(3, 'Desparasitante', 'IR207577', '2024-07-11'),
(17, 'Vacunación', 'QL233686', '2024-08-01'),
(14, 'Vacunación', 'SM211281', '2024-09-30'),
(2, 'Desparasitante', 'LH254800', '2024-10-06'),
(16, 'Vacunación', 'RR229998', '2024-11-25'),
(8, 'Desparasitante', 'IR207577', '2024-12-10'),
(19, 'Desparasitante', 'QL233686', '2025-01-31'),
(3, 'Vacunación', 'SM211281', '2025-02-22'),
(17, 'Desparasitante', 'LH254800', '2025-03-24'),
(14, 'Desparasitante', 'RR229998', '2025-04-23'),
(2, 'Vacunación', 'IR207577', '2025-05-04');

-- 3. Consultas

-- a. Listar mascotas disponibles filtradas por especie, edad o estado de salud
SELECT * FROM mascotas
WHERE estado_adopcion = 'No adoptada' AND especie = 'Perro';
SELECT * FROM mascotas
WHERE estado_adopcion = 'No adoptada' AND edad <= 3;
SELECT * FROM mascotas
WHERE estado_adopcion = 'No adoptada' AND estado_salud = 'Enfermo';

-- b. Mostrar historial de adopciones por adoptante
SELECT *  FROM adopciones
WHERE dui_adoptante = '56085842-2';

-- c. Consultar seguimientos post-adopción realizados por empleado o por mascota
SELECT * FROM controles_postadopcion
WHERE carnet_empleado = 'LH254800';
SELECT * FROM controles_postadopcion
WHERE id_mascota = 6;

-- 4. Vista que muestra todas las adopciones realizadas

CREATE OR REPLACE VIEW vista_adopciones AS
SELECT a.id_mascota, m.especie, m.raza, m.sexo, m.edad, m.estado_salud, a.dui_adoptante, p.nombre AS nombre_adoptante, a.carnet_empleado, a.fecha AS fecha_adopcion
FROM adopciones a
INNER JOIN adoptantes p ON a.dui_adoptante = p.dui
INNER JOIN mascotas m ON a.id_mascota = m.id;

SELECT * FROM vista_adopciones;

-- 5. Procedimiento almacenado que registra una nueva adopción

DELIMITER $$

CREATE PROCEDURE ingresar_adopcion (
  IN p_id_mascota int,
  IN p_dui_adoptante char(10),
  IN p_carnet_empleado char(8),
  IN p_fecha date
)
BEGIN
  INSERT INTO adopciones VALUES (p_id_mascota, p_dui_adoptante, p_carnet_empleado, p_fecha);
  UPDATE mascotas
  SET estado_adopcion = 'Adoptada'
  WHERE id = p_id_mascota;
END $$

DELIMITER ;

CALL ingresar_adopcion (12, '41345981-1', 'QL233686', '2025-05-25');