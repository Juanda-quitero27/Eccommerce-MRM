-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-05-2025 a las 22:40:04
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mrm_ecommerce`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre_categoria` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comprobantes`
--

CREATE TABLE `comprobantes` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `archivo` varchar(255) DEFAULT NULL,
  `fecha_subida` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_venta` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nombre_marca` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes`
--

CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `productos` text DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `estado` varchar(20) DEFAULT 'pendiente',
  `factura_path` varchar(255) DEFAULT NULL,
  `comprobante_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ordenes`
--

INSERT INTO `ordenes` (`id`, `nombre_cliente`, `cedula`, `direccion`, `telefono`, `email`, `productos`, `total`, `fecha`, `estado`, `factura_path`, `comprobante_path`) VALUES
(86, 'Rosmila Lizarazo', '60345698', 'Av 5a #23-16 San Mateo', '3103119727', 'rosmy25@mrm.edu.co', '[{\"id\":2.7736374171717236e+23,\"name\":\"Top Case SHAD 29L\",\"price\":175000,\"imagen\":\"https:\\/\\/http2.mlstatic.com\\/D_NQ_NP_773637-MCO41717172346_052020-O.webp\",\"quantity\":1}]', 175000.00, '2025-05-14 19:26:33', 'pendiente', '../public/facturas/factura_86.pdf', NULL),
(87, 'Rosmila Lizarazo', '60345698', 'Av 5a #23-16 San Mateo', '3103119727', 'rosmy25@mrm.edu.co', '[{\"id\":2022066000,\"name\":\"Luz LED alta potencia\",\"price\":20000,\"imagen\":\"https:\\/\\/lujosyautopartesh.com\\/wp-content\\/uploads\\/2022\\/06\\/motoled6000.jpg\",\"quantity\":3}]', 60000.00, '2025-05-14 21:18:45', 'aprobado', '../public/facturas/factura_87.pdf', '../public/comprobantes/1747275534_factura_87.pdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `precio_costo` decimal(10,2) DEFAULT NULL,
  `precio_venta` decimal(10,2) DEFAULT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `imagen` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `codigo`, `categoria`, `cantidad`, `marca`, `precio_costo`, `precio_venta`, `tipo`, `imagen`) VALUES
(4, 'Llantas', '48562', 'Respuestos', 65, 'Cachocontento', 500000.00, 600000.00, '', 'https://www.romacarabs.com/wp-content/uploads/2024/05/Llantas.jpg'),
(9, 'Filtro de aceite Yamaha', 'ACE001', 'aceites', 19, 'Yamaha', 12000.00, 18000.00, 'General', 'https://assets.bridgestonetire.com/content/dam/consumer/bst/la/tips-bridgestone/cuidado-de-las-llantas/llantas-bridgestone-tips-cuidado-de-las-llantas_filtro-aceite-pendiente1.jpeg'),
(11, 'Bujía NGK Iridium', 'REP002', 'repuestos', 25, 'NGK', 18000.00, 25000.00, 'General', 'https://t1.uc.ltmcdn.com/es/posts/2/5/4/cuando_cambiar_las_bujias_de_mi_moto_27452_orig.jpg'),
(12, 'Exploradoras LED', 'ACC001', 'accesorios', 30, 'Genéricas', 35000.00, 50000.00, 'General', 'https://http2.mlstatic.com/D_NQ_NP_847910-MCO73602168205_122023-O.webp'),
(13, 'Top Case SHAD 29L', 'ACC002', 'accesorios', 6, 'SHAD', 145000.00, 175000.00, 'general', 'https://http2.mlstatic.com/D_NQ_NP_773637-MCO41717172346_052020-O.webp'),
(16, 'Luz LED alta potencia', 'ELEC001', 'componentes eléctricos', 32, 'H4 Tech', 9000.00, 20000.00, 'general', 'https://lujosyautopartesh.com/wp-content/uploads/2022/06/motoled6000.jpg'),
(35, 'Aceite Motor 5W30', 'ACE-010', '', 80, 'Mobil', 140000.00, 220000.00, 'general', 'data:image/jpeg;base64,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QEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREH//Z');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_old`
--

CREATE TABLE `productos_old` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `creado_por` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `rol` enum('admin','colaborador','cliente') NOT NULL,
  `ultimo_acceso` datetime DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `cedula`, `email`, `telefono`, `contraseña`, `rol`, `ultimo_acceso`, `estado`) VALUES
(1, 'Diego Alvarez', '1005027350', 'admin@mrm.edu.co', '3107897525', '$2y$10$VmAHHHlCEcIGr2XHzHEwXOx69fOG/mN53ZVd6y99ZPKjypYjlnzLC', 'admin', NULL, 1),
(37, 'Diego Marquez', '60458752', 'diegomarquez00@mrm.edu.co', '3104568975', '$2y$10$CeWGSal05gR1QFKm6Fd5teUmkpb1d2DnMknUhTr6IPWMiuevEU/dC', 'colaborador', NULL, 1),
(38, 'Juan Quintero', '1111111', 'juandavid@mrm.edu.co', '3108975632', '$2y$10$T/T2jWjJCxgpqjYDY9NyROkwdxlpnCCi4jASFJq.kUKffNoI3lKXK', 'cliente', NULL, 1),
(39, 'Pedro Pérez', '654645', 'pedroperez@mrm.edu.co', '3107897525', '$2y$10$OBbBU16QIGOFTC0T3FbdbuYOw/arqo72KlHeHH7VKPdpsPKKYC2im', 'cliente', NULL, 1),
(40, 'Rosmila Lizarazo', '60345698', 'rosmy25@mrm.edu.co', '3103119727', '$2y$10$aAqYkEBGlM5X5.vHJq4gfuCAxPfD12nWryug.58cdodRD3GNtjLcW', 'cliente', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) DEFAULT NULL,
  `estado` enum('pendiente','aprobado','rechazado') DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos_old`
--
ALTER TABLE `productos_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`),
  ADD KEY `id_marca` (`id_marca`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ordenes`
--
ALTER TABLE `ordenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos_old` (`id`);

--
-- Filtros para la tabla `comprobantes`
--
ALTER TABLE `comprobantes`
  ADD CONSTRAINT `comprobantes_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`),
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos_old` (`id`);

--
-- Filtros para la tabla `productos_old`
--
ALTER TABLE `productos_old`
  ADD CONSTRAINT `productos_old_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `productos_old_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marcas` (`id`),
  ADD CONSTRAINT `productos_old_ibfk_3` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
