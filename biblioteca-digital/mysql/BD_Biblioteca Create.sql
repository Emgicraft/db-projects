-- Crear base de datos
CREATE DATABASE BibliotecaDigital;

USE BibliotecaDigital;

-- Crear tabla Categoría
CREATE TABLE Categoria (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL
);

-- Crear tabla Libro
CREATE TABLE Libro (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Titulo VARCHAR(200) NOT NULL,
    Autor VARCHAR(150) NOT NULL,
    Anio_publicacion INT NOT NULL,
    Resumen TEXT,
    NumPaginas INT NOT NULL,
    Editorial VARCHAR(100),
    Categoria_ID INT,
    FOREIGN KEY (Categoria_ID) REFERENCES Categoria(ID)
);

-- Crear tabla USUARIO
CREATE TABLE USUARIO (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(250) UNIQUE NOT NULL,
    Clave_Hash VARCHAR(256) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    FechaCreacion DATETIME DEFAULT NOW(),
    FechaActualizacion DATETIME DEFAULT NOW() ON UPDATE NOW(),
    Estado BOOLEAN NOT NULL -- 0: Deshabilitado, 1: Habilitado
);

-- Crear tabla ROL
CREATE TABLE ROL (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(250) UNIQUE NOT NULL
);

-- Tabla de relación USUARIO_ROL
CREATE TABLE USUARIO_ROL (
    UsuarioID INT,
    RolID INT,
    PRIMARY KEY (UsuarioID, RolID),
    FOREIGN KEY (UsuarioID) REFERENCES USUARIO(ID),
    FOREIGN KEY (RolID) REFERENCES ROL(ID)
);
