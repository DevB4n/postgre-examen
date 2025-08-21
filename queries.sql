SELECT id_producto, nombre_producto, stock
FROM productos
WHERE stock < 5
ORDER BY stock ASC;


SELECT DATE_TRUNC('month', fecha_compra) AS mes,
       SUM(total) AS ventas_totales
FROM compra
WHERE EXTRACT(YEAR FROM fecha_compra) = 2025
  AND EXTRACT(MONTH FROM fecha_compra) = 8
GROUP BY 1
ORDER BY 1;


SELECT c.id_cliente, c.nombre, c.apellido, COUNT(*) AS compras_realizadas
FROM compra co
JOIN clientes c ON c.id_cliente = co.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido
ORDER BY compras_realizadas DESC, c.id_cliente
LIMIT 1;
