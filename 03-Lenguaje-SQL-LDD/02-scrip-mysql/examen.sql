CREATE DATABASE controlpedido;

USE controlpedido;

create table productos(
id_fab char(3) not null ,
id_producto char(5) not null,
descripcion varchar(20) not null,
precio numeric not null,
stock int not null,
Constraint pk_productos
primary key (id_fab,id_producto),
Constraint unique_descripcion
unique (descripcion),
Constraint chk_stock
Check(stock>0)
	
);

create table pedidos(
num_pedido int not null,
fecha_pedido date not null,
cliente int not null,
rep int ,
fab char(3) not null,
producto char(5) not null,
cantidad int not null,
importe numeric not null,
constraint Pk_pedido
primary key (num_pedido),
constraint chk_cantidad
check (cantidad>0),
constraint fk_pedidos_productos
foreign key  (fab,producto)
references productos(id_fab,id_producto)

);

alter table pedidos
add constraint fk_pedidos_Representantes
foreign key (rep)
references representantes(num_empl); 

create table clientes(
num_cli int not null,
empresa varchar (20) not null,
rep_cli int,
limite_credito numeric, 

constraint pk_cliente 
primary key (num_cli),
constraint chk_lim_credito
check (limite_credito>0 and limite_credito < 40000),

constraint fk_cliente_representante
foreign key (rep_cli)
references representantes(num_empl)

);

create table representantes(
num_empl int not null,
nombre varchar(16) not null, 
Edad int ,
oficina_rep int,
puesto varchar(13),
Fecha_contrato date not null,
jefe int ,
cuota numeric ,
ventas numeric not null,

constraint pk_representantes
primary key (num_empl) ,
constraint chk_edad
check (edad>18),
constraint fk_repre_repre
 foreign key (jefe)
 references representantes(num_empl)
);

create table oficinas(
oficina int not null,
ciudad varchar(15) not null,
region varchar(15)not null,
jef int ,
objetivo numeric,
ventas numeric not null,

constraint pk_oficina
primary key (oficina),
 constraint chk_ventas
 check (ventas>=0),
 
 constraint fk_oficinas_representantes
 foreign key (jef)
 references representantes(num_empl)
);


alter table representantes
add constraint fk_Representantes_oficina
foreign key (oficina_rep)
references oficinas(oficina); 

alter table pedidos
add constraint fk_pedidos_representantes2
foreign key (rep)
references representantes(num_empl); 


