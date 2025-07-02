# 📘 Diccionario de Datos – Plantilla General
**Tabla Cliente**
| Campo           | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK                      | Referencia a                    | Descripción                             |
|----------------|--------------|--------|-----|-----|------|--------|--------------------------------------------|----------------------------------|-----------------------------------------|
| `IdCliente`     | INT          | -      | ✅  | ❌  | ❌   | ✅     | > 0                                        | -                                | Identificador del cliente               |
| `Nombre`        | VARCHAR      | 20   | ❌  | ❌  | ❌   | ❌     | Solo letras A-Z, longitud >= 3             | -                                                    |
| `Apellido1`          | NVARCHAR |  20       | -      | ❌  | ❌  | ❌   | Check nada     |        | -                                |                         |
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     |   check  nada                | -                                | Correo electrónico                      |
| `Apellido2`        | VARCHAR      | 20    | ❌  | ❌  | ❌   | ❌     |   check  nada                | -                                | Correo electrónico                      |
| `CURP`        | NCHAR      | 18    | ❌  | ❌  | ❌   | ✅     |   check  nada                | -                                |                       |
| `Telefono`        | NCHAR      | 12   | ❌  | ❌  | ✅   | ❌     |   check  nada                | -                                |telefono del cliente



**Tabla Sucursal**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a        | Descripción               |
|---------------|--------------|--------|-----|-----|------|--------|----------------------|---------------------|---------------------------|
| `idSucursal`  | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                    | -                   | Identificador de sucursal |
| `nombre`      | NVARCHAR     | 25     | ❌  | ❌  | ❌   | ❌     | -                    | -                   | Nombre de la sucursal     |
| `direccion`   | NVARCHAR     | 25     | ❌  | ❌  | ❌   | ❌     | -                    | -                   | Dirección de la sucursal  |
| `idVehículo`  | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                    | Vehículos(idVehículo)| Vehículo asignado         | 

**Tabla Vehículos**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a | Descripción               |
|---------------|--------------|--------|-----|-----|------|--------|----------------------|--------------|---------------------------|
| `idVehículo`  | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                    | -            | Identificador del vehículo|
| `placa`       | NVARCHAR     | 8      | ❌  | ❌  | ❌   | ✅     | -                    | -            | Placa del vehículo        |
| `modelo`      | NVARCHAR     | 25     | ❌  | ❌  | ❌   | ❌     | -                    | -            | Modelo del vehículo       |
| `año`         | DATE         | -      | ❌  | ❌  | ❌   | ❌     | -                    | -            | Año del vehículo          |
| `Marca`         | NVARCHAR        | 20  | ❌  | ❌  | ❌   | ❌     | -                    | -            | Año del vehículo          |
| `NUM clienta`   | INT        | --  | ❌  | 👍  | ❌   | ❌     | -                    | -            |           |

**Tabla Renta**

| Campo         | Tipo de Dato | Tamaño | PK  | FK  | Nulo | Único | Restricciones / CHECK | Referencia a        | Descripción               |
|---------------|--------------|--------|-----|-----|------|--------|----------------------|---------------------|---------------------------|
| idRenta     | INT          | -      | ✅  | ❌  | ❌   | ✅     | -                    | -                   | Identificador de renta    |
| idCliente   | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                    | Clientes(idCliente) | Cliente que renta         |
| idVehículo  | INT          | -      | ❌  | ✅  | ❌   | ❌     | -                    | Vehículos(idVehículo)| Vehículo rentado          |
| fechaInicio | DATE         | -      | ❌  | ❌  | ❌   | ❌     | -                    | -                   | Fecha inicio de renta     |
| fechaFin    | DATE         | -      | ❌  | ❌  | ❌   | ❌     | -                    | -                   | Fecha fin de renta        |
