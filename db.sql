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