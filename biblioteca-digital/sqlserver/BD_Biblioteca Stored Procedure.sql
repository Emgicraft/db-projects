USE BibliotecaDigital;
GO

-- Procedimiento almacenado para retornar los datos de la tabla Libro con el nombre de la Categoria
CREATE PROCEDURE SP_ObtenerLibrosPorCategoria
    @categoriaID INT
AS
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
        L.Categoria_ID = @categoriaID;
END;
GO

-- Ejecutar el procedimiento almacenado
-- EXEC SP_ObtenerLibrosPorCategoria 3;

-- SELECT * FROM Libro WHERE ID = 2

CREATE PROCEDURE SP_ActualizarLibro
    @pIdLibro INT,
    @pTitulo NVARCHAR(200),
    @pAutor NVARCHAR(150),
    @pAnio INT,
    @pResumen NVARCHAR(MAX),
    @pNPaginas INT,
    @pEditorial NVARCHAR(100),
    @pIdCategoria INT
AS
BEGIN
    -- Intentamos realizar la actualización
    BEGIN TRY
        UPDATE Libro 
        SET 
            Titulo = @pTitulo,
            Autor = @pAutor,
            Anio_publicacion = @pAnio,
            Resumen = @pResumen,
            NumPaginas = @pNPaginas,
            Editorial = @pEditorial,
            Categoria_ID = @pIdCategoria
        WHERE ID = @pIdLibro;

        -- Si se actualizó al menos una fila, consideramos la operación exitosa
        IF @@ROWCOUNT > 0
        BEGIN
            SELECT 1 AS Success;  -- Indica que la actualización fue exitosa
        END
        ELSE
        BEGIN
            SELECT 0 AS Success;  -- No se encontró el libro o no se actualizó nada
        END
    END TRY
    BEGIN CATCH
        SELECT 0 AS Success;  -- En caso de error, retornamos un 0
    END CATCH
END;
GO
-- EXEC SP_ActualizarLibro

-- SP para validar credenciales de inicio de sesión
CREATE PROCEDURE SP_Validar_Usuario 
    @NombreUsuario VARCHAR(250),
    @Contrasena VARCHAR(250)
AS
BEGIN
    -- Declarar una variable para almacenar el hash de la contraseña proporcionada
    DECLARE @ContrasenaHash VARCHAR(256)

    -- Calcular el hash SHA-256 de la contraseña proporcionada
    SET @ContrasenaHash = CONVERT(VARCHAR(256), HASHBYTES('SHA2_256', CONVERT(VARCHAR(250), @Contrasena)), 2)
    
    -- Validar si el usuario existe y si el hash de la contraseña coincide
    IF EXISTS (
        SELECT 1
        FROM USUARIO
        WHERE Nombre = @NombreUsuario
        AND Clave_Hash = @ContrasenaHash
        AND Estado = 1 -- El usuario debe estar habilitado
    )
    BEGIN
        -- Recuperar los datos del usuario y sus roles
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
            USUARIO_ROL ur ON u.Id = ur.UsuarioID
        LEFT JOIN 
            ROL r ON ur.RolID = r.Id
        WHERE 
            u.Nombre = @NombreUsuario
            AND u.Clave_Hash = @ContrasenaHash
            AND u.Estado = 1; -- El usuario debe estar habilitado
    END
END
GO

-- Ejemplo de ejecución del procedimiento almacenado
EXEC SP_Validar_Usuario 
    @NombreUsuario = 'mgarcia',
    @Contrasena = 'Empresa#123';
GO
