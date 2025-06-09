-- CREACIÓN DE TABLAS --

-- crea la tabla de repartidores
CREATE TABLE repartidores (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  direccion VARCHAR(10) -- de momento sólo será un CP
);

-- crea la tabla de usuarios
CREATE TABLE usuarios (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  nombre_usuario VARCHAR(50) UNIQUE,
  contrasena VARCHAR(100),
  datos_pago TEXT
);

-- crea la tabla de proveedores
CREATE TABLE proveedores (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  categoria VARCHAR(50)
);

-- crea la tabla de productos
CREATE TABLE productos (
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(100),
  precio DECIMAL(10,2),
  proveedor_id INT REFERENCES proveedores(id)
);

-- crea la tabla de pedidos
CREATE TABLE pedidos (
  id SERIAL PRIMARY KEY,
  categoria VARCHAR(50),
  proveedor_id BIGINT REFERENCES proveedores(id),
  productos BIGINT[],
  usuario_id BIGINT REFERENCES usuarios(id),
  estado VARCHAR(15) DEFAULT 'pendiente'
);

-- INSERCCIÓN DE DATOS PRECARGADOS DE PRUEBA --

-- inserta datos de prueba en la tabla de repartidores
INSERT INTO repartidores (nombre, direccion) VALUES
  ('Repartidor 1', '28001'),
  ('Repartidor 2', '28002'),
  ('Repartidor 3', '28003');

-- inserta datos de prueba en la tabla de usuarios
INSERT INTO usuarios (nombre, username, password, datos_pago) VALUES
  ('Sandra', 'sandra', '1234', '1234567812345678, 12/24, 123'),
  ('María', 'maria', '1234', '2345678923456789, 11/23, 456');

-- inserta datos de prueba en la tabla de proveedores
INSERT INTO proveedores (nombre, categoria) VALUES
  ('Telepizza', 'comida'),
  ('Sushi Express', 'comida'),
  ('Taco Bell', 'comida'),
  ('Mercadona', 'supermercado'),
  ('Supermercado 24hrs', 'supermercado'),
  ('Carrefour', 'supermercado');

-- inserta productos para cada proveedor
INSERT INTO productos (nombre, precio, proveedor_id) VALUES
  -- productos para Telepizza
  ('Pizza Margarita', 8, 1),
  ('Pizza Pepperoni', 10, 1),
  ('Ensalada César', 6, 1),
  -- productos para Sushi Express
  ('Roll de salmón', 12, 2),
  ('Sashimi mix', 15, 2),
  -- productos para Taco Bell
  ('Taco de carne', 5, 3),
  ('Taco vegetariano', 4.5, 3),
  -- productos para Mercadona
  ('Leche desidesnatada', 1.2, 4),
  ('Pan integral', 1.5, 4),
  -- productos para Supermercado 24hrs
  ('Huevos', 2.5, 5),
  ('Manzanas', 3, 5),
  -- productos para Carrefour
  ('Aceite de oliva', 7, 6),
  ('Arroz integral', 2, 6);
