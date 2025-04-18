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

-- SP para validar el usuario y retornar sus datos con los roles asociados
DELIMITER $$

CREATE PROCEDURE SP_Validar_Usuario (
    IN pNombreUsuario VARCHAR(250),
    IN pContrasena VARCHAR(250)
)
BEGIN
    DECLARE vContrasenaHash VARCHAR(256);

    -- Calcular el hash SHA-256 de la contraseña ingresada
    SET vContrasenaHash = UPPER(SHA2(pContrasena, 256));

    -- Validar si el usuario existe y tiene el hash correcto
    IF EXISTS (
        SELECT 1 FROM USUARIO 
        WHERE Nombre = pNombreUsuario 
        AND Clave_Hash = vContrasenaHash 
        AND Estado = 1
    ) THEN

        -- Retornar datos del usuario y sus roles
        SELECT 
            u.ID,
            u.Nombre,
            u.Clave_Hash,
            u.Email,
            u.Estado,
            r.ID AS RolID,
            r.Nombre AS NombreRol
        FROM 
            USUARIO u
        LEFT JOIN 
            USUARIO_ROL ur ON u.ID = ur.UsuarioID
        LEFT JOIN 
            ROL r ON ur.RolID = r.ID
        WHERE 
            u.Nombre = pNombreUsuario
            AND u.Clave_Hash = vContrasenaHash
            AND u.Estado = 1;

    END IF;
END$$

DELIMITER ;

-- CALL SP_Validar_Usuario('mgarcia', 'Empresa#123');
