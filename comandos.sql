-- Crear BBDD e ingresar
CREATE DATABASE prueba;
\c prueba

-- Crear Tablas
CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(80) NOT NULL, rut VARCHAR(20) NOT NULL UNIQUE, direccion VARCHAR(100) NOT NULL);

CREATE TABLE facturas(numero_de_factura SERIAL PRIMARY KEY, fecha_de_factura DATE NOT NULL, subtotal INT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL);

CREATE TABLE clientes_facturas(cliente_id INT NOT NULL, factura_id INT NOT NULL, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(numero_de_factura));

CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, descripcion VARCHAR(150), valor_unitario INT NOT NULL);

CREATE TABLE detalles(id SERIAL PRIMARY KEY, factura_id INT NOT NULL, producto_id INT NOT NULL, cantidad INT NOT NULL, FOREIGN KEY(factura_id) REFERENCES facturas(numero_de_factura), FOREIGN KEY(producto_id) REFERENCES productos(id));

CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre_categoria VARCHAR(80) NOT NULL UNIQUE, descripcion VARCHAR(150) NOT NULL);

CREATE TABLE categorias_productos(producto_id INT NOT NULL, categoria_id INT NOT NULL, FOREIGN KEY(producto_id) REFERENCES productos(id), FOREIGN KEY(categoria_id) REFERENCES categorias(id));

-- INSERTAR 5 CLIENTES
INSERT INTO clientes(nombre,rut,direccion) VALUES(
'juanito',
'11.123.567-1',
'av. hola 123'
);

INSERT INTO clientes(nombre,rut,direccion) VALUES(
'peter',
'15.235.557-2',
'av.asdd 1234'
);

INSERT INTO clientes(nombre,rut,direccion) VALUES(
'claudio',
'18.525.634-2',
'calle 5 1234'
);

INSERT INTO clientes(nombre,rut,direccion) VALUES(
'tomas',
'13.638.654-k',
'calle 10 34'
);

INSERT INTO clientes(nombre,rut,direccion) VALUES(
'alexandra',
'19.178.349-2',
'calle 25 344'
);

-- CREAR 8 PRODUCTOS
INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'pelota de futbol',
'asdsad',
5000
);

INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'pelota de tenis',
'asdsddd',
2000
);

INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'polera',
'asdsddd',
6000
);

INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'short',
'asdsddd',
6000
);

INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'caramelo',
'asdsddd',
50  
);

INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'jugo',
'asdsddd',
300
);

INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'bebida',
'asdsddd',
500
);

INSERT INTO productos(nombre,descripcion,valor_unitario) VALUES(
'poleron deportivo',
'asdsddd',
20000
);

-- CREAR 3 CATEGORIAS
INSERT INTO categorias(nombre_categoria,descripcion) VALUES(
'articulos deportivos',
'asdsda'
);

INSERT INTO categorias(nombre_categoria,descripcion) VALUES(
'ropa deportiva',
'asdsda'
);

INSERT INTO categorias(nombre_categoria,descripcion) VALUES(
'snacks',
'asdsda'
);

-- CREAR 10 FACTURAS
-- CLIENTE 1
INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-27',
7000,
1330,
8330
);

INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-28',
14000,
2660,
16660
);

-- CLIENTE 2
INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-25',
27000,
5130,
32130
);

INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-23',
350,
66.5,
416.5
);

INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-26',
7300,
1387,
8687
);

-- CLIENTE 3
INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-25',
50,
9.5,
59.5
);

-- CLIENTE 4
INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-09-01',
11000,
2090,
13090
);

INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-30',
11500,
2185,
13685
);

INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-09-02',
37000,
7030,
44030
);

INSERT INTO facturas(fecha_de_factura,subtotal,iva,precio_total) VALUES(
'2020-08-22',
50,
9.5,
59.5
);