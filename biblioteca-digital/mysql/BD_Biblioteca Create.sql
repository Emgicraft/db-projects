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
