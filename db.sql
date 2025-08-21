CREATE TABLE clientes(
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(30),
    apellido VARCHAR(30),
    telefono INT(20),
    correo_electronico VARCHAR(50),
    direccion VARCHAR(50)
);
