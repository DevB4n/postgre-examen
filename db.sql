DROP TABLE IF EXISTS compra_productos;
DROP TABLE IF EXISTS compra;
DROP TABLE IF EXISTS proveedores_productos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS proveedores;
DROP TABLE IF EXISTS categoria_producto;
DROP TABLE IF EXISTS clientes;
DROP TYPE  IF EXISTS metodo_pago;


CREATE TYPE metodo_pago AS ENUM ('tarjeta', 'efectivo');

CREATE TABLE clientes (
    id_cliente           INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre               VARCHAR(30)     NOT NULL,
    apellido             VARCHAR(30)     NOT NULL,
    telefono             VARCHAR(20),                 
    correo_electronico   VARCHAR(50)     NOT NULL UNIQUE,
    direccion            VARCHAR(100)
);

CREATE TABLE categoria_producto (
    id_categoria         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre               VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE proveedores (
    id_proveedor         INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nombre               VARCHAR(50) NOT NULL,
    direccion            VARCHAR(100),
    correo_electronico   VARCHAR(50)
);

CREATE TABLE productos (
    id_producto          INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_categoria         INTEGER NOT NULL,
    nombre_producto      VARCHAR(50) NOT NULL,
    valor_unitario       NUMERIC(12,2) NOT NULL CHECK (valor_unitario >= 0),
    stock                INTEGER NOT NULL DEFAULT 0 CHECK (stock >= 0),
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (id_categoria) REFERENCES categoria_producto(id_categoria)
            ON UPDATE RESTRICT ON DELETE RESTRICT,
    CONSTRAINT uq_producto_nombre UNIQUE (nombre_producto)
);

CREATE TABLE proveedores_productos (
    id_proveedor         INTEGER NOT NULL,
    id_producto          INTEGER NOT NULL,
    PRIMARY KEY (id_proveedor, id_producto),
    CONSTRAINT fk_pp_proveedor FOREIGN KEY (id_proveedor)
        REFERENCES proveedores(id_proveedor)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_pp_producto FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE compra (
    id_compra            INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_cliente           INTEGER NOT NULL,
    fecha_compra         TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT now(),
    total                NUMERIC(14,2) NOT NULL CHECK (total >= 0),
    metodo               metodo_pago NOT NULL,
    CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE TABLE compra_productos (
    id_compra            INTEGER NOT NULL,
    id_producto          INTEGER NOT NULL,
    cantidad             INTEGER NOT NULL CHECK (cantidad > 0),
    precio_unitario      NUMERIC(12,2) NOT NULL CHECK (precio_unitario >= 0), 
    PRIMARY KEY (id_compra, id_producto),
    CONSTRAINT fk_cp_compra FOREIGN KEY (id_compra)
        REFERENCES compra(id_compra)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_cp_producto FOREIGN KEY (id_producto)
        REFERENCES productos(id_producto)
        ON UPDATE RESTRICT ON DELETE RESTRICT
);

CREATE INDEX IF NOT EXISTS idx_compra_fecha ON compra(fecha_compra);
CREATE INDEX IF NOT EXISTS idx_compra_cliente ON compra(id_cliente);
CREATE INDEX IF NOT EXISTS idx_producto_categoria ON productos(id_categoria);
CREATE INDEX IF NOT EXISTS idx_cp_producto ON compra_productos(id_producto);