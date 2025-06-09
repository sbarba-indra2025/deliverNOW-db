# deliverNOW - Base de Datos

## Descripción

Este repositorio contiene la configuración para la base de datos de la aplicación **deliverNOW**, que almacena la información necesaria para gestionar pedidos, repartidores, usuarios, productos y proveedores. La base de datos utiliza **PostgreSQL** como motor.

### Estructura de la Base de Datos

La base de datos contiene las siguientes tablas:

- **repartidores**: Almacena la información de los repartidores disponibles para entregar los pedidos.
- **usuarios**: Almacena la información de los usuarios registrados, incluyendo sus datos de pago.
- **proveedores**: Contiene los proveedores de productos (restaurantes y supermercados).
- **productos**: Almacena los productos disponibles de cada proveedor.

### Estructura de las Tablas

- **repartidores**:
  - `id`: Identificador único del repartidor.
  - `nombre`: Nombre del repartidor.
  - `direccion`: Código postal donde reside el repartidor.

- **usuarios**:
  - `id`: Identificador único del usuario.
  - `nombre`: Nombre del usuario.
  - `nombre_usuario`: Nombre de usuario único.
  - `contrasena`: Contraseña cifrada.
  - `datos_pago`: Información del método de pago (por ejemplo, número de tarjeta).

- **proveedores**:
  - `id`: Identificador único del proveedor.
  - `nombre`: Nombre del proveedor (restaurantes, supermercados, etc.).
  - `categoria`: Categoría del proveedor (por ejemplo, comida o supermercado).

- **productos**:
  - `id`: Identificador único del producto.
  - `nombre`: Nombre del producto.
  - `precio`: Precio del producto.
  - `proveedor_id`: Referencia al proveedor que ofrece el producto.

### Datos de Prueba

El archivo `init.sql` se encarga de crear las tablas necesarias y poblarlas con datos de prueba al iniciar la base de datos. Los datos incluyen algunos **repartidores**, **usuarios**, **proveedores** y **productos** que pueden utilizarse para probar el funcionamiento de la aplicación.

#### Ejemplo de Datos Insertados:

- **Repartidores**:
  - `Repartidor 1` (CP: 28001)
  - `Repartidor 2` (CP: 28002)
  - `Repartidor 3` (CP: 28003)

- **Usuarios**:
  - `Sandra` (Username: `sandra`)
  - `María` (Username: `maria`)

- **Proveedores**:
  - `Telepizza`, `Sushi Express`, `Mercadona`, `Carrefour`, entre otros.

- **Productos**:
  - `Pizza Margarita`, `Roll de salmón`, `Leche desnatada`, etc.

## Cómo ejecutar la base de datos

La base de datos se ejecuta en un contenedor Docker usando `docker-compose`, y está configurada para cargar automáticamente el archivo `init.sql` al inicializar el contenedor.

### Ejecución con `docker-compose`

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/sbarba-indra2025/deliverNOW-db.git
   cd deliverNOW-db

2. **Levantar los contenedores**:  

   ```bash
   docker-compose up

Este comando descargará las imágenes necesarias y creará los contenedores correspondientes. Durante la inicialización, el contenedor de la base de datos ejecutará el archivo `init.sql` para crear las tablas y cargar los datos de prueba.

3. **Acceder a la base de datos**:

   La base de datos estará disponible en el puerto `5432` de la máquina local. Se puede usar cualquier cliente PostgreSQL (como pgAdmin, DBeaver, o el cliente `psql`) con las siguientes credenciales:

   - **Usuario**: `admin`
   - **Contraseña**: `admin`
   - **Base de datos**: `delivernowdb`
   - **Host**: `localhost`
   - **Puerto**: `5432`


### Uso del archivo init.sql
El archivo init.sql se encuentra en la carpeta ./db y se utiliza para:

- Crear las tablas necesarias en la base de datos.
- Insertar datos de prueba para facilitar las pruebas de la aplicación.

Este archivo se ejecuta automáticamente cuando el contenedor de la base de datos se inicia por primera vez.

## Información adicional
En el [repositorio de documentación](https://github.com/sbarba-indra2025/deliverNOW-docs/) se encuentra más información y el fichero docker-compose para levantar toda la aplicación con un solo comando.
