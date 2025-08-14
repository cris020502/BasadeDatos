-- CONSULTAS AVANZADAS
-- HALLAR TODOS LOS REPRESENTANTES QUE O BIEN:
-- a) TRABAJAN EN DAIMIEL, NAVARRA O CASTELLÓN; o bien: 22,11,12
-- b) NO TIENEN JEFE Y ESTAN CONTRATADOS DESDE JUNIO DE 1988; O
-- c) SUPERAN SU CUOTA PERO TIENEN VENTAS DE 600,000 O MENOS

USE BDEJEMPLO2

SELECT r.Num_Empl as [Numero Empleado],
       r.Nombre as [Nombre Empleado],
       r.Fecha_Contrato as [Fecha de Contrato],
       r.Cuota as [Cuota de ventas],
       r.Ventas as [Ventas totales],
       o.Ciudad as [Ciudad de la Oficina],
       r.Jefe AS [NUmero de Jefe]
FROM Representantes as r
INNER JOIN Oficinas as o
ON o.Oficina = r.Oficina_Rep
WHERE (o.Ciudad IN ('Daimiel', 'Navarra', 'Castellón')) OR
      (Jefe IS NULL AND Fecha_Contrato >= '1988-06-01') OR
      (r.Ventas > Cuota AND r.Ventas <= 600000);

-- LISTAR TODOS LOS PEDIDOS MOSTRANDO EL NUMERO DE PEDIDO, SU IMPORTE, EL NOMBRE, LIMITE DE CREDIO DEL CLIENTE

SELECT p.Num_Pedido as [NUMERO DE PEDIDO],
       p.Importe as [IMPORTE DEL PEDIDO],
       c.Empresa as [NOMBRE DEL PEDIDO],
       c.Limite_Credito as [LIMITE DE CREDITO DEL CLIENTE]
FROM Pedidos as p
INNER JOIN Clientes as c
ON c.Num_Cli = p.Cliente



-- Listar las oficinas con un objetivo superior a 600000
-- mostrando el nombre de la ciudad, nombre representante y su puesto

SELECT O.Ciudad AS [Oficina],
       R.Nombre AS [Representante],
       R.Puesto AS [Puesto],
       O.Objetivo AS [Objetivo]
FROM Oficinas AS O
INNER JOIN Representantes AS R
ON o.Jef = R.Num_Empl
WHERE O.Objetivo > 600000;

-- Listar todos los pedidos, mostrando el numero de pedido, el importe, el nombre, limite de credito del cliente

SELECT P.Num_Pedido AS [Numero Pedido],
       P.Importe AS [Importe],
       C.Empresa AS [Cliente],
       C.Limite_Credito AS [Limite de Credito]
FROM Pedidos AS P
INNER JOIN Clientes AS C
ON P.Cliente = C.Num_Cli


SELECT *
FROM Pedidos AS P
INNER JOIN Clientes AS C
ON P.Cliente = C.Num_Cli

-- Listar cada representqantew mostrando su nombre, la ciudad y la region en la que trabaja

SELECT R.Nombre AS [Nombre Representante],
       O.Ciudad AS [Ciudad],
       O.Region AS [Region]
FROM Oficinas AS O
INNER JOIN Representantes AS R
ON O.Oficina = R.Oficina_Rep


-- Listar las Oficinas (Ciudad), nombres y puestos de sus jefes
SELECT O.Ciudad AS [Ciudad],
       R.Nombre AS [Nombre],
       R.Puesto AS [Puesto Jefe]
FROM Oficinas AS O
INNER JOIN Representantes AS R
ON O.Jef = R.Num_Empl

-- Listar todoss los pedidos, mostrando el numero de pedido, el importe y la cantidad de cada producto

SELECT Pe.Num_Pedido AS [Numero Pedido],
       Pe.Importe AS [Importe],
       Pr.Descripcion AS [Descripcion],
       Pr.Stock AS [Cantidad]
FROM Productos AS Pr
INNER JOIN Pedidos AS Pe
ON (Pr.Id_fab = Pe.Fab) AND (Pr.Id_producto = Pe.Producto)


-- Listar los nombres de los empleado y los nombres de sus jefes

SELECT Empleado.Nombre AS [Nombre Empleado],
       Jefe.Nombre AS [Nombre Jefe]
FROM Representantes AS Empleado
INNER JOIN Representantes AS Jefe
ON Jefe.Num_Empl = Empleado.Jefe


select *
from Representantes


-- Listar los pedidos con un importe superior a 25,000
-- NUmero del pedido, Importe, el nombre del representante que tomo nota del pedido y el nombre del cliente

SELECT P.Num_Pedido AS [Numero Pedido],
       P.Importe AS [Importe],
       R.Nombre AS [Nombre Representante],
       C.Empresa AS [Cliente]
FROM Representantes AS R
INNER JOIN Pedidos AS P
ON R.Num_Empl = P.Rep
INNER JOIN Clientes AS C
ON P.Cliente = C.Num_Cli
WHERE P.Importe > 25000

-- Listar los pedidos superiores a 25,000 mostrando el numero de pedido, nombre del cliente, nombre del representante asignado del cliente y el importe

SELECT P.Num_Pedido AS [Numero Pedido],
       C.Empresa AS [Cliente],
       R.Nombre AS [Nombre Representante],
       P.Importe AS [Importe]
FROM Clientes AS C
INNER JOIN Pedidos AS P
ON C.Num_Cli = P.Cliente
INNER JOIN Representantes AS R
ON C.Rep_Cli = R.Num_Empl
WHERE P.Importe > 25000