-- Crear la base de datos BD_Market // DROP DATABASE BD_Market // USE master;
CREATE DATABASE BD_Market;
GO

-- Usar la base de datos BD_Market
USE BD_Market;
GO

-- Crear tabla CLIENTE
CREATE TABLE CLIENTE (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    NumRuc VARCHAR(12),
    Direccion VARCHAR(100),
    Telefono VARCHAR(20)
);
GO

-- Crear tabla VENTA
CREATE TABLE VENTA (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Cliente_ID INT,
    Fecha DATETIME NOT NULL,
    CONSTRAINT FK_Venta_Cliente FOREIGN KEY (Cliente_ID) REFERENCES CLIENTE(ID) ON DELETE SET NULL
);
GO

-- Crear tabla CATEGORIA
CREATE TABLE CATEGORIA (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);
GO

-- Crear tabla PRODUCTO
CREATE TABLE PRODUCTO (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Codigo_inventario VARCHAR(12),
    Descripcion VARCHAR(100) NOT NULL,
    Categoria_ID INT,
    Precio DECIMAL(11,2) NOT NULL,
    Stock INT DEFAULT 0 CHECK (Stock >= 0),
    CONSTRAINT FK_Producto_Categoria FOREIGN KEY (Categoria_ID) REFERENCES CATEGORIA(ID) ON DELETE SET NULL
);
GO

-- Crear tabla DETALLE
CREATE TABLE DETALLE (
    Venta_ID INT NOT NULL,
    Producto_ID INT NOT NULL,
    PrecioUnitario DECIMAL(11,2) NOT NULL,
    Cantidad INT CHECK (Cantidad > 0),
    PRIMARY KEY (Venta_ID, Producto_ID),
    CONSTRAINT FK_Detalle_Venta FOREIGN KEY (Venta_ID) REFERENCES VENTA(ID) ON DELETE CASCADE,
    CONSTRAINT FK_Detalle_Producto FOREIGN KEY (Producto_ID) REFERENCES PRODUCTO(ID) ON DELETE CASCADE
);
GO

CREATE TABLE USUARIO (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(250) UNIQUE NOT NULL,
	Clave_Hash VARCHAR(256) NOT NULL,
	Email VARCHAR(100) UNIQUE,
	FechaCreacion DATETIME DEFAULT GETDATE(), -- Fecha y Hora en que se creó
	FechaActualizacion DATETIME DEFAULT GETDATE(), -- Fecha y Hora de su última actualización
	Estado BIT NOT NULL -- 0: Deshabilitado y 1: Habilitado
);
GO

CREATE TABLE ROL (
    ID INT IDENTITY(1,1) PRIMARY KEY,
	Nombre VARCHAR(250) UNIQUE NOT NULL
);
GO

CREATE TABLE USUARIO_ROL (
    UsuarioID INT,
	RolID INT,
	PRIMARY KEY (UsuarioID, RolID),
	CONSTRAINT FK_Usuario_Rol FOREIGN KEY (UsuarioID) REFERENCES USUARIO(ID),
	CONSTRAINT FK_Rol_Usuario FOREIGN KEY (RolID) REFERENCES ROL(ID)
);
GO
