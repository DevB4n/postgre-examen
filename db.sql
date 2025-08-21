DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes(
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    telefono INT(20),
    correo_electronico VARCHAR(50),
    direccion VARCHAR(50)
);

DROP TABLE IF EXISTS compra
CREATE TYPE metodo ENUM('tarjeta','efectivo')
CREATE TABLE compra(
    id_compra SERIAL PRIMARY KEY,
    id_cliente INT(14),
    fecha_compra TIMESTAMP,
    total INT(14),
    metodo metodo
);

DROP TABLE IF EXISTS compra_productos;
CREATE TABLE compra_productos(
    id_compra INT(14),
    id_producto INT(14),
    ADD CONSTRAINT fk_id_compra FOREIGN KEY (id_compra) REFERENCES compra(id_compra),
    ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
DROP TABLE IF EXISTS productos;
CREATE TABLE productos(
    id_producto SERIAL PRIMARY KEY,
    id_categoria INT(14),
    nombre_producto VARCHAR(50),
    valor_unitario DECIMAL(30,2),
    stock INT(10),
    ADD CONSTRAINT fk_id_categoria FOREIGN KEY (id_categoria) REFERENCES categoria_producto(id_categoria)
);
DROP TABLE IF EXISTS proveedores_productos;
CREATE TABLE proveedores_productos(
    id_proveedor INT(14),
    id_producto INT(14),
    ADD CONSTRAINT fk_id_proveedor FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    ADD CONSTRAINT fk_id_producto FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);
DROP TABLE IF EXISTS categoria_producto;
CREATE TABLE categoria_producto(
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(50)
);
DROP TABLE IF EXISTS proveedores;
CREATE TABLE proveedores(
    id_proveedor SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(50),
    correo_electronico VARCHAR(50)
)

