-- Usar la base de datos BD_Market
USE BD_Market;
GO

-- Procedimiento almacenado para buscar productos por descripci�n y obtener el nombre de la categor�a
CREATE PROCEDURE SP_BuscarProductoPorDescripcion
    @DescripcionBuscar VARCHAR(100)
AS
BEGIN
    SELECT p.ID, p.Codigo_inventario, p.Descripcion, c.Nombre AS CategoriaNombre, p.Precio, p.Stock
    FROM PRODUCTO as p
    INNER JOIN CATEGORIA as c ON p.Categoria_ID = c.ID
    WHERE p.Descripcion LIKE '%' + @DescripcionBuscar + '%';
END;
GO

EXEC SP_BuscarProductoPorDescripcion 'queso';
GO

