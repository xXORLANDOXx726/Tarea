CREATE DATABASE IF NOT EXISTS tienda_ddl
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE tienda_ddl;

CREATE TABLE IF NOT EXISTS categorias (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS productos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(150) NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  categoria_id INT NOT NULL,
  sku VARCHAR(30) UNIQUE,
  CONSTRAINT chk_precio_pos CHECK (precio_unitario > 0),
  CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id)
      REFERENCES categorias(id) ON DELETE RESTRICT
);

INSERT INTO categorias(nombre) VALUES
('Electrónica'),
('Ropa');

INSERT INTO productos(nombre, precio_unitario, categoria_id, sku) VALUES
('Audífonos', 150000, 1, 'SKU-001'),
('Mouse', 25000, 1, 'SKU-002'),
('Camisa algodón', 35000, 2, 'SKU-003');

-- ===============================================
-- SECCIÓN 2: DML (tienda_dml)
-- ===============================================

CREATE DATABASE IF NOT EXISTS tienda_dml CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE tienda_dml;

DROP TABLE IF EXISTS pedido_detalle;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS clientes;

CREATE TABLE categoria (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE producto (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  categoria_id INT,
  sku VARCHAR(30) UNIQUE,
  CONSTRAINT fk_prod_categoria FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE productos_prueba (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  categoria_id INT,
  sku VARCHAR(30)
);

INSERT INTO categorias (nombre) VALUES ('Electrónica'), ('Hogar'), ('Jardín');

INSERT INTO productos (nombre, precio, categoria_id, sku) VALUES
('Auriculares', 29.90, 1, 'SKU-AUR-001'),
('Televisor', 499.00, 1, 'SKU-TEL-001');

INSERT INTO productos_prueba (nombre, precio, categoria_id, sku) VALUES
('Producto A', 10.00, 1, 'A-001'),
('Producto B', 20.00, 2, 'B-001');



CREATE DATABASE IF NOT EXISTS tienda_select CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE tienda_select;



CREATE TABLE productos (
  id INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(150) NOT NULL,
  precio DECIMAL(10,2) NOT NULL,
  categoria_id INT,
  stock INT NOT NULL DEFAULT 0,
  activo BOOLEAN NOT NULL DEFAULT TRUE,
  sku VARCHAR(30),
  creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO categorias (nombre) VALUES ('Electrónica'), ('Hogar'), ('Jardín');

INSERT INTO productos (nombre, precio, categoria_id, stock, activo, sku) VALUES
('Auriculares', 29.90, 1, 50, TRUE, 'SKU-AUR-001'),
('Televisor', 499.00, 1, 10, TRUE, 'SKU-TEL-001');cursoscursos

