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
WHERE P.Importe > 25000;


SELECT * 
FROM Categoria
SELECT *
FROM Producto

/*
INNER JOIN 
*/

SELECT * 
FROM Categoria AS c
JOIN Producto AS p 
ON c.CategoriaId = p.Categoria

/*LEFT JOIN O LEFT OUTER JOIN

La primera tabla que en el from es la tabla izquierda 
*/

SELECT * 
FROM Categoria AS c
LEFT OUTER JOIN Producto AS p 
ON c.CategoriaId = p.Categoria

--mostrar todos las categorias que no tengan productos asignados 

SELECT c.CategoriaId , c.Nombre
FROM Categoria AS c
LEFT OUTER JOIN Producto AS p 
ON c.CategoriaId = p.Categoria
WHERE P.Categoria is null;

/*
RIGHT JOIN O RIGHT OUTER JOIN

toma todos los datos de la tabla derecha y los que coincidan 
con la tabla izquieda y los que no coinciden los ponen en null*/

SELECT *
FROM Categoria AS c
RIGHT JOIN Producto AS p 
ON c.CategoriaId = p.Categoria


--selecciona todos aquellos productos que no tienen categoria asignada

SELECT p.Nombre AS [Nombre Producto],
	   p.Precio AS [Precio]
FROM Categoria AS c
RIGHT JOIN Producto AS p 
ON c.CategoriaId = p.Categoria
WHERE P.Categoria is null;

/*
FULL JOIN

obtener los datos de la tabla Izquierda, los datos de la tabla derecha 
y todas las consulatas 
*/

SELECT * 
FROM Categoria AS c
CROSS JOIN Producto AS p 

SELECT * 
FROM Categoria AS c, Producto AS p 

SELECT *
FROM Categoria AS c,
 Producto AS p 
WHERE c.CategoriaId = p.Categoria;

/*
AGREGACION  

COUNT(*) - CUENTA LAS FILAS 
COUNT(CAMPO) - CUENTAS LAS FLIAS PERO NO LOS NULL
MIN() - OBTIENE EL VALOR MINIMO DE UN CAMPO
MAX() - OBTIENE EL VALOR MAXIMO DE UN CAMPO
AVG() - OBTIENE LA MEDIA RITMETICA O EL PROMEDIO 
SUM() - OBTIENE EL TOTAL O LA SUMATORIA
*/

USE NORTHWND;

--cuantos clientes hay

SELECT COUNT(*) AS [Numero de clientes]
FROM Customers

--cuantos ventas sean realizado
SELECT COUNT (*)
FROM Orders;

--cuanta ventas se realizaron en 1996

SELECT COUNT (*)
FROM Orders
WHERE DATEPART(YEAR, OrderDate) = 1996;

--selccionar la venta de la fecha mas antigua que se hizo

SELECT MIN(OrderDate) AS [Fecha Primera Venta]
FROM Orders;

--seleccionar el total que se ha vendido
SELECT SUM(UnitPrice * Quantity) AS [Total de ventas]
FROM [Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
WHERE DATEPART (yy, o.OrderDate) BETWEEN 1996 AND 1997
AND o.CustomerID = 'AROUT';

--seleccionar las ventas totales hecghas a cada uno de nuestro clintes 

SELECT c.CompanyName AS [Cliente], 
SUM(UnitPrice * Quantity) AS [Total de ventas]
FROM [Order Details] AS od
INNER JOIN Orders AS o
ON o.OrderID = od.OrderID
INNER JOIN Customers AS c
ON c.CustomerID = o.CustomerID
WHERE DATEPART (yy, o.OrderDate) BETWEEN 1996 AND 1997
GROUP BY c.CompanyName;