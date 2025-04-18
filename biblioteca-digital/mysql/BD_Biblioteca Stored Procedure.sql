USE BibliotecaDigital;

-- SP para retornar los datos de la tabla Libro con el nombre de la Categoria
DELIMITER $$

CREATE PROCEDURE SP_ObtenerLibrosPorCategoria(IN categoriaID INT)
BEGIN
    SELECT 
        L.ID,
        L.Titulo,
        L.Autor,
        L.Anio_publicacion,
        L.Resumen,
        L.NumPaginas,
        L.Editorial,
        C.Nombre AS NombreCategoria
    FROM 
        Libro L
    LEFT JOIN 
        Categoria C ON L.Categoria_ID = C.ID
	WHERE
		L.Categoria_ID = categoriaID;
END $$

DELIMITER ;

-- CALL SP_ObtenerLibrosPorCategoria(3);