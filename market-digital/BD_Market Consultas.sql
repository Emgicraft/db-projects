-- Usar la base de datos BD_Market
USE BD_Market;

SELECT * FROM Cliente;
SELECT * FROM Categoria;
SELECT * FROM Producto;
SELECT * FROM USUARIO;
SELECT * FROM ROL;
-- SELECT ID_Categoria, Nombre FROM CATEGORIA GROUP BY Nombre ORDER BY ID_Categoria;
SELECT DISTINCT Nombre FROM CATEGORIA;
-- SELECT ID_Producto, Descripcion, Categoria_ID FROM Producto GROUP BY Categoria_ID ORDER BY Categoria_ID;
SELECT * FROM Producto WHERE Descripcion LIKE '%queso%';
