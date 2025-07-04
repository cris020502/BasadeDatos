## Venta EPP ##
Asignatura: Base de Datos
Elaborado por: Cristopher Vargas Mendoza
Fecha: 23 de mayo de 2025

1️. Descripción del Caso Práctico
Nombre del Proyecto: SISTEMA GESTOR DE VENTA DE EPP

Objetivo General: Diseñar y desarrollar una base de datos que permita gestionar
de forma eficiente el inventario de una pequeña empresa que se dedica a la venta
de equipo de protección personal.

Descripción del Problema o Necesidad:
La pequeña empresa de venta de EPP tiene el problema de no contar con un
sistema que le ayude a organizar el inventario, y también poder consultar
existencia si necesidad de buscar de forma manual, se requiere que el sistema
organice los datos de clientes, inventario y facturación.
2️⃣ Requerimientos Funcionales y No Funcionales
Funcionalidades Clave:
Requisitos No Funcionales
•	Interfaz intuitiva: Fácil de usar para personal sin conocimientos técnicos.
•	Seguridad:
o	Respaldo automático de la base de datos.
o	Contraseñas para usuarios (ej: administrador vs. vendedor).
•	Escalabilidad: Posibilidad de agregar más productos o categorías en el futuro
Recoleccion de Requerimentos

Entrevista:
1.¿Que tipos de equipos  de protección personal (EPP) Vende?
Vendo mas que nada cascos, guantes, chalecos, botas, mascarillas, etc. 
2. ¿Qué categorías maneja?
Manejo equipos para Seguridad industrial, construcción.
3. Marcas que maneja
*PENDIENTE DE REVISAR
4. ¿Como maneja el inventario?
Manejo mi inventario en Excel.
5. ¿Qué datos registra de sus productos en inventario?
Su código, nombre, marca, precio, stock mínimo, tipo.
6. ¿ Cuando realiza una venta que es lo que registra de dicha venta realizada?
Códigos de los productos, cantidad, precio, cliente, fecha, subtotal y total. 
7. Proveedores contacto, productos que compra, fecha
8. Clientes contacto, RFC, historial de compras realizadas.
9. Reportes ventas del mes, productos mas vendidos, ganancias.



Entidades Principales y Relaciones:
Entidades y Atributos
1. Producto
•	Atributos:
o	id_producto (PK, clave primaria) 
o	nombre 
o	descripcion 
o	id_categoria (FK, clave foránea) 
o	marca 
o	precio_venta 
o	precio_compra 
o	stock_actual 
o	stock_minimo  
o	ubicacion 
2. Categoria
•	Atributos:
o	id_categoria (PK) 
o	nombre 
3. Cliente
•	Atributos:
o	id_cliente (PK)
o	nombre
o	rfc 
o	direccion, telefono, email 
4. Proveedor
•	Atributos:
o	id_proveedor (PK) 
o	nombre 
o	contacto 
o	telefono, email, direccion.
5. Venta
•	Atributos:
o	id_venta (PK) 
o	fecha_hora 
o	id_cliente (FK) 
o	total 
o	metodo_pago 
