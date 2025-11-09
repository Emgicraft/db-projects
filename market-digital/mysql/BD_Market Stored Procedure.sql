SET NAMES utf8mb4;

USE BD_Market;

-- =====================================
-- SP: Buscar producto por ID
-- =====================================
DROP PROCEDURE IF EXISTS SP_BuscarProductoPorID;

DELIMITER $$
CREATE PROCEDURE SP_BuscarProductoPorID (
    IN ProductoID INT
)
BEGIN
    SELECT 
        p.ID,
        p.Codigo_inventario,
        p.Descripcion,
        c.ID    AS CategoriaID,
        c.Nombre AS CategoriaNombre,
        p.Precio,
        p.Stock
    FROM PRODUCTO AS p
    INNER JOIN CATEGORIA AS c ON p.Categoria_ID = c.ID
    WHERE p.ID = ProductoID;
END $$
DELIMITER ;

-- Ejemplo de ejecución
CALL SP_BuscarProductoPorID(1);

-- =====================================
-- SP: Buscar productos por descripción
-- =====================================
DROP PROCEDURE IF EXISTS SP_BuscarProductoPorDescripcion;

DELIMITER $$
CREATE PROCEDURE SP_BuscarProductoPorDescripcion (
    IN DescripcionBuscar VARCHAR(100)
)
BEGIN
    SELECT 
        p.ID,
        p.Codigo_inventario,
        p.Descripcion,
        c.ID AS CategoriaID,
        c.Nombre AS CategoriaNombre,
        p.Precio,
        p.Stock
    FROM PRODUCTO AS p
    INNER JOIN CATEGORIA AS c ON p.Categoria_ID = c.ID
    WHERE p.Descripcion LIKE CONCAT('%', DescripcionBuscar, '%');
END $$
DELIMITER ;

-- Ejecución
CALL SP_BuscarProductoPorDescripcion('salsa');

-- =====================================
-- SP: Obtener todos los productos
-- =====================================
DROP PROCEDURE IF EXISTS SP_ObtenerTodosProductos;

DELIMITER $$
CREATE PROCEDURE SP_ObtenerTodosProductos()
BEGIN
    SELECT 
        p.ID,
        p.Codigo_inventario,
        p.Descripcion,
        c.ID    AS CategoriaID,
        c.Nombre AS CategoriaNombre,
        p.Precio,
        p.Stock
    FROM PRODUCTO AS p
    INNER JOIN CATEGORIA AS c ON p.Categoria_ID = c.ID
    ORDER BY p.Descripcion;
END $$
DELIMITER ;

-- Ejemplo
CALL SP_ObtenerTodosProductos();

-- =====================================
-- SP: Validar usuario (usuario/contraseña)
--  - Asume que USUARIO.Clave_Hash guarda SHA2(…,256) en HEX
-- =====================================
DROP PROCEDURE IF EXISTS SP_Validar_Usuario;

DELIMITER $$
CREATE PROCEDURE SP_Validar_Usuario (
    IN NombreUsuario VARCHAR(250),
    IN Contrasena    VARCHAR(250)
)
BEGIN
    /* En MySQL no hace falta variable temporal:
       comparamos Clave_Hash con SHA2(Contrasena, 256) directamente. */
    SELECT 
        u.ID,
        u.Nombre,
        u.Clave_Hash,
        u.Email,
        u.Estado,
        r.ID    AS RolID,
        r.Nombre AS NombreRol
    FROM USUARIO u
    LEFT JOIN USUARIO_ROL ur ON u.ID = ur.UsuarioID
    LEFT JOIN ROL r          ON ur.RolID = r.ID
    WHERE u.Nombre = NombreUsuario
      AND u.Clave_Hash = SHA2(Contrasena, 256)
      AND u.Estado = 1;
    /* Si credenciales no coinciden, la consulta devuelve 0 filas. */
END $$
DELIMITER ;

-- Ejecución de ejemplo
CALL SP_Validar_Usuario('mgarcia', 'Empresa#123');
