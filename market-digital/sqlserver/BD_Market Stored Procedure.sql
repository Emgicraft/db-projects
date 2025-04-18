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

-- SP para validar credenciales de inicio de sesi�n
CREATE PROCEDURE SP_Validar_Usuario 
    @NombreUsuario VARCHAR(250),
    @Contrasena VARCHAR(250)
AS
BEGIN
    -- Declarar una variable para almacenar el hash de la contrase�a proporcionada
    DECLARE @ContrasenaHash VARCHAR(256)

    -- Calcular el hash SHA-256 de la contrase�a proporcionada
    SET @ContrasenaHash = CONVERT(VARCHAR(256), HASHBYTES('SHA2_256', CONVERT(VARCHAR(250), @Contrasena)), 2)
    
    -- Validar si el usuario existe y si el hash de la contrase�a coincide
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

EXEC SP_Validar_Usuario 
    @NombreUsuario = 'mgarcia',
    @Contrasena = 'Empresa#123';
GO


-- CONJUNTO 1: Consultas por Cliente
-- SP 1: SP_Consulta_Ventas_Cliente
-- Lista las ventas realizadas según el nombre del cliente.
CREATE PROCEDURE SP_Consulta_Ventas_Cliente
    @NombreCliente VARCHAR(100)
AS
BEGIN
    SELECT 
        V.ID,
        V.Fecha,
        C.Nombre AS NombreCliente,
        C.Direccion,
        C.Telefono
    FROM 
        VENTA V
    INNER JOIN 
        CLIENTE C ON V.Cliente_ID = C.ID
    WHERE 
        C.Nombre LIKE '%' + @NombreCliente + '%';
END;
GO

-- SP 2: SP_Consulta_Cliente_por_RUC
-- Lista los clientes filtrados por su RUC.
CREATE PROCEDURE SP_Consulta_Cliente_por_RUC
    @RUC VARCHAR(12)
AS
BEGIN
    SELECT 
        ID,
        Nombre,
        Direccion,
        Telefono
    FROM 
        CLIENTE
    WHERE 
        NumRuc = @RUC;
END;
GO

-- SP 3: SP_Consulta_Ventas_Cliente_Fecha
-- Lista las ventas realizadas por un cliente entre dos fechas.
CREATE PROCEDURE SP_Consulta_Ventas_Cliente_Fecha
    @NombreCliente VARCHAR(100),
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT 
        V.ID,
        V.Fecha,
        SUM(D.Cantidad) AS TotalProductosVendidos
    FROM 
        VENTA V
    INNER JOIN 
        CLIENTE C ON V.Cliente_ID = C.ID
    INNER JOIN 
        DETALLE D ON V.ID = D.Venta_ID
    WHERE 
        C.Nombre LIKE '%' + @NombreCliente + '%'
        AND V.Fecha BETWEEN @FechaInicio AND @FechaFin
    GROUP BY 
        V.ID, V.Fecha;
END;
GO

-- CONJUNTO 2: Consultas de Productos
-- SP 1: SP_Consulta_Productos_Categoria
-- Lista los productos según su categoría.
CREATE PROCEDURE SP_Consulta_Productos_Categoria
    @NombreCategoria VARCHAR(100)
AS
BEGIN
    SELECT 
        P.ID,
        P.Descripcion,
        P.Precio,
        P.Stock
    FROM 
        PRODUCTO P
    INNER JOIN 
        CATEGORIA C ON P.Categoria_ID = C.ID
    WHERE 
        C.Nombre = @NombreCategoria;
END;
GO

-- SP 2: SP_Productos_Bajo_Stock
-- Lista los productos con un stock menor a un valor dado.
CREATE PROCEDURE SP_Productos_Bajo_Stock
    @StockMinimo INT
AS
BEGIN
    SELECT 
        ID,
        Descripcion,
        Precio,
        Stock
    FROM 
        PRODUCTO
    WHERE 
        Stock < @StockMinimo;
END;
GO

-- SP 3: SP_Productos_Vendidos_Fechas
-- Lista los productos vendidos en un rango de fechas.
CREATE PROCEDURE SP_Productos_Vendidos_Fechas
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT 
        P.ID,
        P.Descripcion,
        SUM(D.Cantidad) AS CantidadVendida
    FROM 
        DETALLE D
    INNER JOIN 
        PRODUCTO P ON D.Producto_ID = P.ID
    INNER JOIN 
        VENTA V ON D.Venta_ID = V.ID
    WHERE 
        V.Fecha BETWEEN @FechaInicio AND @FechaFin
    GROUP BY 
        P.ID, P.Descripcion;
END;
GO

-- CONJUNTO 3: Consultas de Ventas
-- SP 1: SP_Consulta_Ventas_Fechas
-- Lista las ventas realizadas entre dos fechas.
CREATE PROCEDURE SP_Consulta_Ventas_Fechas
    @FechaInicio DATE,
    @FechaFin DATE
AS
BEGIN
    SELECT 
        V.ID,
        V.Fecha,
        C.Nombre AS NombreCliente
    FROM 
        VENTA V
    INNER JOIN 
        CLIENTE C ON V.Cliente_ID = C.ID
    WHERE 
        V.Fecha BETWEEN @FechaInicio AND @FechaFin;
END;
GO

-- SP 2: SP_Ventas_Total_Cliente
-- Lista el total de ventas realizadas por cada cliente.
CREATE PROCEDURE SP_Ventas_Total_Cliente
AS
BEGIN
    SELECT 
        C.Nombre AS NombreCliente,
        COUNT(V.ID) AS TotalVentas
    FROM 
        VENTA V
    INNER JOIN 
        CLIENTE C ON V.Cliente_ID = C.ID
    GROUP BY 
        C.Nombre;
END;
GO

-- SP 3: SP_Detalles_Venta
-- Lista los productos vendidos en una venta específica.
CREATE PROCEDURE SP_Detalles_Venta
    @IDVenta INT
AS
BEGIN
    SELECT 
        P.ID,
        P.Descripcion,
        D.Cantidad,
        D.PrecioUnitario
    FROM 
        DETALLE D
    INNER JOIN 
        PRODUCTO P ON D.Producto_ID = P.ID
    WHERE 
        D.Venta_ID = @IDVenta;
END;
GO
