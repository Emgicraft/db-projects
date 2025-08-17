-- Opcional: eliminar y crear la BD
DROP DATABASE IF EXISTS BD_Market;

CREATE DATABASE BD_Market CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
-- utf8mb4 -> significa que la base de datos va a usar UTF-8 de 4 bytes
-- utf8mb4_0900_ai_ci -> es una colación de que:
-- 1. "0900" es compatible con la versión 9.0 de Unicode (incluye emojis y caracteres especiales).
-- 2. "ai" significa "accent insensitive" (insensible a acentos).
-- 3. "ci" significa "case insensitive" (insensible a mayúsculas y minúsculas).
-- Esto es importante porque:
-- Garantiza que puedas guardar y comparar texto internacional (incluyendo emojis) y que las 
-- búsquedas/ordenamientos no diferencien entre acentos ni mayúsculas.

USE BD_Market;

-- =========================
-- Tabla: CLIENTE
-- =========================
CREATE TABLE CLIENTE (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    NumRuc VARCHAR(12),
    Direccion VARCHAR(100),
    Telefono VARCHAR(20)
) ENGINE=InnoDB;
-- InnoDB es el motor de almacenamiento recomendado para MySQL, ya que soporta transacciones, 
-- claves foráneas y es más robusto.

-- =========================
-- Tabla: VENTA
-- =========================
CREATE TABLE VENTA (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Cliente_ID INT,
    Fecha DATETIME NOT NULL,
    CONSTRAINT FK_Venta_Cliente
        FOREIGN KEY (Cliente_ID) REFERENCES CLIENTE(ID)
        ON DELETE SET NULL
) ENGINE=InnoDB;

-- =========================
-- Tabla: CATEGORIA
-- =========================
CREATE TABLE CATEGORIA (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- =========================
-- Tabla: PRODUCTO
-- =========================
CREATE TABLE PRODUCTO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Codigo_inventario VARCHAR(12),
    Descripcion VARCHAR(100) NOT NULL,
    Categoria_ID INT,
    Precio DECIMAL(11,2) NOT NULL,
    Stock INT DEFAULT 0,
    CONSTRAINT CK_Producto_Stock CHECK (Stock >= 0),
    CONSTRAINT FK_Producto_Categoria
        FOREIGN KEY (Categoria_ID) REFERENCES CATEGORIA(ID)
        ON DELETE SET NULL
) ENGINE=InnoDB;

-- =========================
-- Tabla: DETALLE
-- =========================
CREATE TABLE DETALLE (
    Venta_ID INT NOT NULL,
    Producto_ID INT NOT NULL,
    PrecioUnitario DECIMAL(11,2) NOT NULL,
    Cantidad INT NOT NULL,
    CONSTRAINT CK_Detalle_Cantidad CHECK (Cantidad > 0),
    PRIMARY KEY (Venta_ID, Producto_ID),
    CONSTRAINT FK_Detalle_Venta
        FOREIGN KEY (Venta_ID) REFERENCES VENTA(ID)
        ON DELETE CASCADE,
    CONSTRAINT FK_Detalle_Producto
        FOREIGN KEY (Producto_ID) REFERENCES PRODUCTO(ID)
        ON DELETE CASCADE
) ENGINE=InnoDB;

-- =========================
-- Tabla: USUARIO
-- =========================
CREATE TABLE USUARIO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(250) NOT NULL UNIQUE,
    Clave_Hash VARCHAR(256) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    FechaCreacion DATETIME DEFAULT CURRENT_TIMESTAMP,
    FechaActualizacion DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    Estado TINYINT UNSIGNED NOT NULL  -- 0: Deshabilitado, 1: Habilitado
) ENGINE=InnoDB;

-- =========================
-- Tabla: ROL
-- =========================
CREATE TABLE ROL (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(250) NOT NULL UNIQUE
) ENGINE=InnoDB;

-- =========================
-- Tabla: USUARIO_ROL
-- =========================
CREATE TABLE USUARIO_ROL (
    UsuarioID INT NOT NULL,
    RolID INT NOT NULL,
    PRIMARY KEY (UsuarioID, RolID),
    CONSTRAINT FK_Usuario_Rol FOREIGN KEY (UsuarioID) REFERENCES USUARIO(ID),
    CONSTRAINT FK_Rol_Usuario FOREIGN KEY (RolID) REFERENCES ROL(ID)
) ENGINE=InnoDB;
