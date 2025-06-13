-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS campuswork DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE campuswork;

-- Tabla: usuarios
CREATE TABLE `usuarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL UNIQUE,
  `password` VARCHAR(255) NOT NULL,
  `rol` ENUM('usuario', 'admin', 'superadmin') NOT NULL DEFAULT 'usuario',
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultima_actualizacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla: oportunidades
CREATE TABLE `oportunidades` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `empresa` VARCHAR(255) NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `requisitos` TEXT DEFAULT NULL,
  `ubicacion` VARCHAR(255) DEFAULT NULL,
  `area_estudio` VARCHAR(100) DEFAULT NULL,
  `modalidad` VARCHAR(50) DEFAULT NULL,
  `horario` VARCHAR(50) DEFAULT NULL,
  `salario_hora` DECIMAL(10,2) DEFAULT NULL,
  `fecha_publicacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `estado` VARCHAR(50) DEFAULT 'activa',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabla: productos
CREATE TABLE `productos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(255) NOT NULL,
  `descripcion` TEXT DEFAULT NULL,
  `precio` DECIMAL(10,2) NOT NULL,
  `estado` VARCHAR(50) DEFAULT 'Nuevo',
  `categoria` VARCHAR(100) DEFAULT NULL,
  `imagen` VARCHAR(255) DEFAULT 'https://via.placeholder.com/300x200',
  `ubicacion` VARCHAR(255) DEFAULT NULL,
  `vendedor_id` INT(11) DEFAULT NULL,
  `disponible` TINYINT(1) DEFAULT 1,
  `fecha_publicacion` DATETIME DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vendedor_id` (`vendedor_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`vendedor_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Datos de ejemplo para usuarios
INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `rol`, `fecha_creacion`, `ultima_actualizacion`) VALUES
(1, 'Juan Pérez', 'juan@example.com', '$2b$10$zYwdB9yOyfF7Nqzjmt9f9eryGxxTRr3EJYUeeEFJO0sjwMyZDxuyW', 'superadmin', '2025-04-22 10:49:29', '2025-05-05 06:35:37'),
(3, 'Carlos López', 'carlos@example.com', '$2b$10$CRxV.m9m573pjwdiKIH4T.4oqZjcPpuZT2cwv0ScxnIN.KhI0P28q', 'usuario', '2025-04-22 10:49:29', '2025-04-22 10:49:29'),
(5, 'jaja', 'jaja@gmail.com', '12345', 'admin', '2025-05-06 01:08:42', '2025-05-06 01:08:42'),
(7, 'jumm', 'jumm@gmail.com', '123', 'usuario', '2025-05-06 01:10:56', '2025-05-06 01:10:56'),
(8, 'Juan Cabrera', 'cabrera@gmail.com', '123', 'usuario', '2025-05-06 01:20:29', '2025-05-06 01:20:29');

-- Datos de ejemplo para oportunidades
INSERT INTO `oportunidades` (`id`, `titulo`, `empresa`, `descripcion`, `requisitos`, `ubicacion`, `area_estudio`, `modalidad`, `horario`, `salario_hora`, `fecha_publicacion`, `estado`) VALUES
(1, '1', '1', '1', '1', '1', 'Ingeniería', 'Presencial', '1', 12.50, '2025-05-05 21:11:49', 'activa'),
(2, '1', '1', '1', '1', '1', 'Ingeniería', 'Presencial', '1', 15.00, '2025-05-05 21:19:33', 'activa'),
(3, 'Desarrollador Web Junior', 'TechSolutions', 'Buscamos un desarrollador web para trabajar en proyectos innovadores. Ideal para estudiantes de últimos años.', 'Conocimientos en HTML, CSS, JavaScript. Valorable experiencia con React.', 'Madrid', 'Ingeniería Informática', 'Remoto', 'Medio Tiempo', 18.75, '2025-05-05 21:39:25', 'activa'),
(4, 'Asistente de Marketing', 'MarketingPro', 'Apoya al equipo de marketing en campañas digitales y análisis de datos.', 'Estudiantes de Marketing o Comunicación. Conocimientos de redes sociales y herramientas de análisis.', 'Barcelona', 'Marketing', 'Presencial', 'Fines de Semana', 14.25, '2025-05-05 21:39:25', 'activa'),
(7, 'Diseñador Gráfico', 'CreativeStudio', 'Diseño de materiales promocionales para redes sociales y web.', 'Conocimientos de Adobe Photoshop e Illustrator. Portfolio de trabajos previos.', 'Madrid', 'Diseño Gráfico', 'Remoto', 'Flexible', 20.00, '2025-05-05 21:39:25', 'activa'),
(8, 'Asistente Administrativo', 'Consultora Empresarial', 'Apoyo en tareas administrativas y atención al cliente.', 'Estudiantes de Administración de Empresas o similar. Buen manejo de Excel.', 'Bilbao', 'Administración', 'Presencial', 'Mañanas', 16.50, '2025-05-05 21:39:25', 'activa'),
(9, '2', '2', '2', '2', '2', '2', 'Remoto', 'Flexible', 22.00, '2025-05-05 22:02:51', 'activa'),
(10, '4', '4', '4', '4', '4', '4', 'Remoto', 'Tiempo Completo', 25.00, '2025-05-05 22:04:17', 'activa');

-- Datos de ejemplo para productos
INSERT INTO `productos` (`id`, `titulo`, `descripcion`, `precio`, `estado`, `categoria`, `imagen`, `ubicacion`, `vendedor_id`, `disponible`, `fecha_publicacion`) VALUES
(1, 'Laptop HP Pavilion 15', 'Laptop en excelente estado, 8GB RAM, 512GB SSD, procesador i5 de 10ma generación. Ideal para estudiantes.', 1800000.00, 'Como nuevo', 'Electrónicos', 'https://via.placeholder.com/300x200', 'Campus Central', 3, 1, '2025-05-01 10:00:00'),
(2, 'Libro Cálculo de Varias Variables - Stewart', 'Libro de cálculo multivariable, 7ma edición. Tiene algunas anotaciones pero está en buen estado general.', 140000.00, 'Buen estado', 'Libros', 'https://via.placeholder.com/300x200', 'Facultad de Ciencias', 7, 1, '2025-05-02 15:30:00'),
(3, 'Escritorio Plegable para Estudiantes', 'Escritorio plegable ideal para espacios pequeños. Incluye estante para libros y soporte para laptop.', 340000.00, 'Nuevo', 'Muebles', 'https://via.placeholder.com/300x200', 'Residencia Universitaria', 8, 1, '2025-05-03 09:15:00'),
(4, 'Calculadora Científica Texas Instruments', 'Calculadora TI-84 Plus, perfecta para clases de matemáticas y estadística. Incluye cable USB y manual.', 260000.00, 'Buen estado', 'Electrónicos', 'https://via.placeholder.com/300x200', 'Facultad de Ingeniería', 3, 1, '2025-05-04 14:20:00'),
(5, 'Bicicleta Urbana', 'Bicicleta de ciudad, 21 velocidades, frenos de disco. Perfecta para moverse por el campus.', 480000.00, 'Usado', 'Deportes', 'https://via.placeholder.com/300x200', 'Pabellón Deportivo', 7, 1, '2025-05-05 11:45:00');


-- Add barcode column to productos table
ALTER TABLE `productos` 
ADD COLUMN `barcode` VARCHAR(50) DEFAULT NULL AFTER `imagen`;

-- Update existing products with random barcodes
UPDATE `productos` 
SET `barcode` = CONCAT('PRD', LPAD(id, 8, '0')) 
WHERE `barcode` IS NULL;