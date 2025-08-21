INSERT INTO categoria_producto (nombre) VALUES
('Laptops'), ('Smartphones'), ('Auriculares'), ('Monitores'),
('Teclados'), ('Almacenamiento'), ('Accesorios');
INSERT INTO clientes (nombre, apellido, telefono, correo_electronico, direccion) VALUES
('Ana','García','3001112233','ana.garcia@correo.com','Cra 10 #12-34'),
('Luis','Martínez','3002223344','luis.martinez@correo.com','Calle 45 #67-89'),
('María','López','3015556677','maria.lopez@correo.com','Av. 80 #20-10'),
('Carlos','Pérez','3028889900','carlos.perez@correo.com','Calle 9 #8-15'),
('Jorge','Ramírez','3151234567','jorge.ramirez@correo.com','Transv. 30 #5-22'),
('Diana','Castro','3167654321','diana.castro@correo.com','Calle 100 #15-50'),
('Paula','Suárez','3170001122','paula.suarez@correo.com','Av. 68 #40-90');
INSERT INTO proveedores (nombre, direccion, correo_electronico) VALUES
('TechImport SAS','Zona Franca','ventas@techimport.com'),
('ElectroWorld Ltd','Parque Industrial','contact@electroworld.com'),
('GadgetPro','Centro','ventas@gadgetpro.com'),
('Andes Components','Bodega 4','sales@andescomp.com'),
('PixelStore','Bodega 2','ventas@pixelstore.com'),
('CompuVision','Oficina 7','contacto@compuvision.com'),
('CoreParts','Bodega 8','sales@coreparts.com');
INSERT INTO productos (id_categoria, nombre_producto, valor_unitario, stock) VALUES
(1,'Laptop Pro 14"', 4200000, 10),
(1,'Laptop Air 13"', 3500000, 8),
(2,'Smartphone X', 2800000, 15),
(2,'Smartphone Lite', 1500000, 20),
(3,'Headset Gamer', 300000, 25),
(4,'Monitor 27" 144Hz', 1200000, 12),
(5,'Teclado Mecánico', 280000, 18),
(6,'SSD 1TB NVMe', 480000, 22),
(6,'HDD 2TB', 350000, 16),
(7,'Cargador USB-C 65W', 120000, 30);
INSERT INTO proveedores_productos (id_proveedor, id_producto) VALUES
(1,1),(1,3),(1,6),
(2,2),(2,4),(2,10),
(3,5),(3,7),
(4,8),(4,9),
(5,6),(5,10),
(6,1),(6,7),
(7,3),(7,8);
INSERT INTO compra (id_cliente, fecha_compra, total, metodo) VALUES
(1, now() - INTERVAL '20 days', 7000000, 'tarjeta'),
(2, now() - INTERVAL '15 days', 1800000, 'efectivo'),
(3, now() - INTERVAL '10 days', 600000,  'efectivo'),
(4, now() - INTERVAL '7 days',  4800000, 'tarjeta'),
(5, now() - INTERVAL '5 days',  1320000, 'efectivo'),
(6, now() - INTERVAL '3 days',  3500000, 'tarjeta'),
(7, now() - INTERVAL '2 days',  600000,  'efectivo'),
(1, now() - INTERVAL '1 days',  1500000, 'tarjeta');
INSERT INTO compra_productos (id_compra, id_producto, cantidad, precio_unitario) VALUES
(1,1,1,4200000),(1,3,1,2800000),
(2,4,1,1500000),(2,10,1,300000),
(3,5,2,300000),
(4,6,4,1200000),
(5,7,2,280000),(5,10,3,120000),
(6,2,1,3500000),
(7,5,2,300000),
(8,4,1,1500000);