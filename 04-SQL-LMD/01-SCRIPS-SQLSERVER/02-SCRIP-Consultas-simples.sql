use BDEJEMPLO2;

--seleccionar cuantos puestos diferentes tiene los representantes

select DISTINCT Puesto 
from Representantes;

--cUANTOS PUESTOS DIFERENTES TIENEN LOS REPRESENTANTES
--FUNCIONES AGREGADO (COUNT *, COUNT [CAMPO],MAX,MIN, SUM. AUG)

select  COUNT (DISTINCT Puesto) AS [NO. PUESTOS]
from Representantes;

--SELECIONAR EL PRECIO MINIMO DE LOS PRODUCTOS
select  MIN ( PRECIO) AS [PRECIO MIN]
from Productos;

--LISTAR LAS OFICINAS CUYAS VENTAS ESTAN POR DEBAJO DEL 80 PORCIENTO
--DE SUS OBJETIVOS

select  Ciudad,Ventas,Objetivo (.8 * Objetivo) AS [80% DEL OBJETIVO]
from Oficinas
WHERE VENTAS < (.8*Objetivo);

--seleccionar los primeros 5 registros de los pedidos

select top  5 Num_Pedido, Fecha_Pedido,Producto,Importe, Cantidad
from Pedidos
order by importe DESC;

--test de rango (between)
--hallar los pedidos del ultimo trimestre de 1989

select Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from Pedidos
where Fecha_Pedido between '1989-10-01' and '1989-12-31'
order by Fecha_Pedido desc;


select Num_Pedido,Fecha_Pedido,Fab,Producto,Importe
from Pedidos
where datepart(quarter,Fecha_Pedido) =4
order by Fecha_Pedido desc;

--hallar los pedidos que se tieenen un importe encre 30000 y 39999.99

select Num_Pedido,Importe
from Pedidos
where Importe between 30000.0 and 39999.99
;

--listar los representantes cuyas ventas 
--no se encuentran entre el 80 y el 120 % de su cuota

select Nombre,Ventas
from Representantes
where not (Ventas >= (0.8*Cuota) and Ventas <=(1.2*Cuota) );

--test de pertenencia a conjuntos (in)
--hallar los pedidos de cuatro representantes en concreto

select Num_Pedido,Fecha_Pedido,Importe,Rep
from Pedidos
where Rep in (107,109,101,103);

select Num_Pedido,Fecha_Pedido,Importe,Rep
from Pedidos
where Rep =107 or Rep=109 or Rep= 101 or Rep=103;

select Num_Pedido,Fecha_Pedido,Importe,Rep
from Pedidos
where not(Rep =107 or Rep=109 or Rep= 101 or Rep=103);


--test de encaje de patrones (like)

select *
from Clientes
where Empresa like '%er%';




--listar las oficinas con un objetivo superior a 60000
--mostrando, el nombre de la ciudad el nombre del representannte y su puesto

select o.Ciudad as [Oficina], 
		r.Nombre as [Representante],
		r.Puesto as [Puesto],
		o.Objetivo as [Objetivo]
from Oficinas AS o
inner join Representantes AS r
on o.Jef=r.Num_Empl
where o.Objetivo >600000;

--listar todos los pedidos, mostrando el numero de pedido,
--el importe, el nombre y limite de credito del cliente

select p.Num_Pedido as[Num. Pedido],
		p.Importe as [Importe],
		c.Empresa as [Cliente],
		c.Limite_Credito as [limite de Credito]
		
from Pedidos as p
inner join Clientes as c
on p.Cliente=c.Num_Cli;

--////////////////////////////////////////////////////////////////////////////////////

select *
from Pedidos as p
inner join Clientes as c
on p.Cliente=c.Num_Cli;


--listar cada representante mostrando su nombre , la ciudad, y la region en que trabaja

select r.Nombre as [Representante],
		o.Ciudad as [Ciudad],
		o.Region as [Region]
from Oficinas as o
inner join Representantes as r
on r.Oficina_Rep=o.Oficina
;

--listar las oficinas(ciudad),nombres y puestos de sus jefes
select o.Ciudad AS [Oficina],
		r.Nombre as [Jefe]

from Oficinas as o
inner join Representantes as r
on r.Oficina_Rep = o.Jef
;
--listar todos los pedidos , mostrando el numero de pedido, el importe,
-- y la cantidad de cada producto
select p.Num_Pedido as [Numero de pedido],
		p.Importe as [importe],
		pro.Descripcion as [Descripcion],
		pro.Stock as [cantidad]
from Pedidos as p
inner join Productos as pro
on pro.Id_fab = p.Fab
and pro.Id_producto = p.Producto;

--listar los nombres de los empleados y los nombres de sus jefes

select j.Nombre as  [Empleado],
		e.nombre as [Jefe]
from Representantes as j
inner join Representantes as e
on j.Num_Empl= e.Jefe;

select*from Representantes;

--listar los pedidos con un importe superior a 25000,
-- incluyendo el nombre del representante que tomo nota del pedido, numero de pedido, y el cliente

select pe.Num_Pedido as [NUM. Pedido],
		pe.Importe as[importe],
		r.Nombre as[Representante que tomo la orden],
		cl.Empresa as [Cliente]
from Representantes as r
inner join Pedidos as pe 
on r.Num_Empl=pe.Rep

inner join Clientes as cl
on cl.Num_Cli=pe.Cliente
where pe.Importe >25000
;

--listar los pedidos superiores a 25_000
--mostrando el numero del pedido, el nombre del cliente que lo encargo , nomnbre del representante del cliente y el importe

select p.Num_Pedido as [num pedido],
		p.Importe as [importe],
		c.Empresa as [cliente],
		r.Nombre as [Representante del cliente]

from Clientes as c
inner join Pedidos as p
on c.Num_Cli = p.Cliente
inner join Representantes as r
on r.Num_Empl = c.Rep_Cli
where p.Importe >25000
;