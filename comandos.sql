-- Crear BBDD e ingresar
CREATE DATABASE prueba;
\c prueba

-- Crear Tablas
CREATE TABLE clientes(id SERIAL PRIMARY KEY, nombre VARCHAR(80) NOT NULL, rut VARCHAR(20) NOT NULL UNIQUE, direccion VARCHAR(100) NOT NULL);

CREATE TABLE facturas(numero_de_factura SERIAL PRIMARY KEY, fecha_de_factura DATE NOT NULL, subtotal INT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL);

CREATE TABLE clientes_facturas(cliente_id INT NOT NULL, factura_id INT NOT NULL, FOREIGN KEY(cliente_id) REFERENCES clientes(id), FOREIGN KEY(factura_id) REFERENCES facturas(numero_de_factura));

CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR(100) NOT NULL, descripcion VARCHAR(150), valor_unitario INT NOT NULL);

CREATE TABLE detalles(id SERIAL PRIMARY KEY, factura_id INT NOT NULL, producto_id INT NOT NULL, cantidad INT NOT NULL, valor_total_por_p INT NOT NULL, FOREIGN KEY(factura_id) REFERENCES facturas(numero_de_factura), FOREIGN KEY(producto_id) REFERENCES productos(id));

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

-- ENLAZAR CLIENTES CON FACTURAS
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(1,1);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(1,2);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(2,3);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(2,4);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(2,5);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(3,6);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(4,7);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(4,8);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(4,9);
INSERT INTO clientes_facturas(cliente_id,factura_id) VALUES(4,10);

-- ENLAZAR PRODUCTOS CON CATEGORIAS
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(1,1);
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(2,1);
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(3,2);
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(4,2);
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(8,2);
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(5,3);
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(6,3);
INSERT INTO categorias_productos(producto_id,categoria_id) VALUES(7,3);

-- INSERTAR DETALLES DE LAS FACTURAS
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(1,1,1,5000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(1,2,1,2000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(2,2,1,2000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(2,3,1,6000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(2,4,1,6000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(3,8,1,20000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(3,1,1,5000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(3,2,1,2000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(4,6,1,300);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(4,5,1,50);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(5,1,1,5000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(5,2,1,2000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(5,6,1,300);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(6,5,1,50);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(7,3,1,6000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(7,1,1,5000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(8,4,1,6000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(8,1,1,5000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(8,7,1,500);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(9,1,1,5000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(9,3,1,6000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(9,4,1,6000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(9,8,1,20000);
INSERT INTO detalles(factura_id,producto_id,cantidad, valor_total_por_p) VALUES(10,5,1,50);

-- CONSULTA 1
SELECT clientes.nombre FROM clientes
INNER JOIN clientes_facturas ON clientes.id = clientes_facturas.cliente_id
INNER JOIN facturas ON clientes_facturas.factura_id = facturas.numero_de_factura
WHERE precio_total = (SELECT precio_total FROM facturas ORDER BY precio_total DESC LIMIT 1);

-- CONSULTA 2
SELECT clientes.nombre FROM clientes
INNER JOIN clientes_facturas ON clientes.id = clientes_facturas.cliente_id
INNER JOIN facturas ON clientes_facturas.factura_id = facturas.numero_de_factura
WHERE precio_total >= 100 GROUP BY clientes.nombre;

-- CONSULTA 3
SELECT COUNT(DISTINCT clientes) FROM clientes
INNER JOIN clientes_facturas ON clientes.id = clientes_facturas.cliente_id
INNER JOIN facturas ON facturas.numero_de_factura = clientes_facturas.factura_id
INNER JOIN detalles ON facturas.numero_de_factura = detalles.factura_id
WHERE producto_id = 6 GROUP BY clientes.nombre;