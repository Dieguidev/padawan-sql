-- Eliminaci�n de tablas existentes si existen
IF OBJECT_ID('dbo.fabricante', 'U') IS NOT NULL 
DROP TABLE dbo.fabricante;

IF OBJECT_ID('dbo.producto', 'U') IS NOT NULL 
DROP TABLE dbo.producto;

-- Creaci�n de la tabla fabricante
CREATE TABLE fabricante (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

-- Creaci�n de la tabla producto con la columna moneda
CREATE TABLE producto (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DECIMAL(10, 2) NOT NULL,
  id_fabricante INT NOT NULL,
  moneda VARCHAR(10) NOT NULL DEFAULT 'd�lar',
  FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

-- Inserci�n de datos en la tabla fabricante
INSERT INTO fabricante (nombre) VALUES
('Asus'),
('Lenovo'),
('Hewlett-Packard'),
('Samsung'),
('Seagate'),
('Crucial'),
('Gigabyte'),
('Huawei'),
('Xiaomi');

-- Inserci�n de datos en la tabla producto con el campo moneda
INSERT INTO producto (nombre, precio, id_fabricante, moneda) VALUES
('Disco duro SATA3 1TB', 86.99, 5, 'd�lar'),
('Memoria RAM DDR4 8GB', 120.00, 6, 'd�lar'),
('Disco SSD 1 TB', 150.99, 4, 'd�lar'),
('GeForce GTX 1050Ti', 185.00, 7, 'd�lar'),
('GeForce GTX 1080 Xtreme', 755.00, 6, 'd�lar'),
('Monitor 24 LED Full HD', 202.00, 1, 'd�lar'),
('Monitor 27 LED Full HD', 245.99, 1, 'd�lar'),
('Port�til Yoga 520', 559.00, 2, 'soles'),
('Port�til Ideapd 320', 444.00, 2, 'soles'),
('Impresora HP Deskjet 3720', 59.99, 3, 'soles'),
('Impresora HP Laserjet Pro M26nw', 180.00, 3, 'soles'),
('Impresora HP Laserjet Pro M26nw', 180.55, 3, 'Euro');




--empiezan con a e i o u
select * from producto
where nombre like '[aeiou]%'

--empiezan con disc
select * from producto
where nombre like 'disc%'

--empiezan con cuaquier letra y sigue ef
select * from producto
where nombre like '_ef%'

--empiezan con a e i o u
select * from producto
where nombre like '[aei]%'

select * from producto
where nombre like '[a-m]%'
