-- CREANDO LA BASE DE DATOS
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'BD_COMERCIAL')
BEGIN
    DROP DATABASE BD_COMERCIAL;
END
GO
 
 CREATE DATABASE BD_COMERCIAL
 GO
--ACTIVANDO LA BASE DE DATOS
USE BD_COMERCIAL
GO
 
--CREANDO LAS TABLAS
CREATE TABLE PRODUCTO
(NUM_PRO  CHAR(7) PRIMARY KEY,
 DES_PRO  VARCHAR(70) NOT NULL,
 PUNI_PRO  MONEY NOT NULL
)
GO
 
CREATE TABLE CLIENTE
(NUM_CLI  INT PRIMARY KEY,
 NOM_CLI  VARCHAR(80) NOT NULL,
 DIR_CLI  VARCHAR(60) NOT NULL
)
GO

 
CREATE TABLE PEDIDO
(NUM_PED CHAR(8) PRIMARY KEY,
 FEC_PED DATE NOT NULL,
 NUM_CLI INT NOT NULL,
 FOREIGN KEY (NUM_CLI)  REFERENCES CLIENTE
)
GO
 
CREATE TABLE PED_PRO
(NUM_PED  CHAR(8) NOT NULL,
 NUM_PRO  CHAR(7) NOT NULL,
 CANT_PED INT NOT NULL,
 TOT_PED  MONEY NOT NULL,
 PRIMARY KEY  (NUM_PED,NUM_PRO),
 FOREIGN KEY  (NUM_PED) REFERENCES PEDIDO,
 FOREIGN KEY  (NUM_PRO) REFERENCES PRODUCTO
)
GO



CREATE TABLE PED_PRO2
(
    ID INT IDENTITY(1,1) PRIMARY KEY,
    NUM_PED CHAR(8) NOT NULL,
    NUM_PRO CHAR(7) NOT NULL,
    CANT_PED INT NOT NULL,
    TOT_PED MONEY NOT NULL,
    FOREIGN KEY (NUM_PED) REFERENCES PEDIDO(NUM_PED),
    FOREIGN KEY (NUM_PRO) REFERENCES PRODUCTO(NUM_PRO)
);
GO

select * from [base pedidos]


 insert into CLIENTE
 select distinct num_cli, nom_cli, dir_cli from [base pedidos]
 select * from cliente

 insert into PRODUCTO
 select distinct num_pro, des_pro, puni_pro from [base pedidos]
 select * from producto

 insert into PEDIDO
 select  NUM_PED, FEC_PED, NUM_CLI from [base pedidos]
 select * from pedido

 insert into PED_PRO
 select NUM_PED, NUM_PRO, CANT_PED, TOT_PED  from [base pedidos]
 select * from PED_PRO

 INSERT INTO CLIENTE (num_cli, nom_cli, dir_cli) VALUES
('6', 'Dieguidev' , 'el agucho'),
('7', 'Venegin' , 'magdalena')

 INSERT INTO producto (num_pro, des_pro, puni_pro) VALUES
('6', 'Chop de cebada' , '39'),
('7', 'Chop fuerte' , '50')

 INSERT INTO pedido (NUM_PED, fec_ped, NUM_CLI) VALUES
('PED006', '2024-08-01' , '6'),
('PED007', '2024-08-01' , '7')

 INSERT INTO PED_PRO (NUM_PED, NUM_PRO, CANT_PED, TOT_PED) VALUES
('PED006', '6' , 6, 300.00),
('PED007', '7' , 7, 400.00)

update producto set PUNI_PRO = 100 where  DES_PRO like '%laptop%'

update producto set PUNI_PRO = PUNI_PRO * 1.1 where  DES_PRO like '%laptop%'
 select * from producto
