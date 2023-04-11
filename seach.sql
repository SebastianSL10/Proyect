-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-04-2023 a las 03:33:36
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `seach`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(2) NOT NULL,
  `Tipo_categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `Tipo_categoria`) VALUES
(1, 'Limpiadores'),
(2, 'Desinfectantes'),
(3, 'Detergentes'),
(4, 'Productos de Limpieza'),
(5, 'Productos industriales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida`
--

CREATE TABLE `detalle_salida` (
  `Cant_produc` int(4) NOT NULL,
  `Codigo_producto_FK` int(10) NOT NULL,
  `Id_salida_pk` int(15) DEFAULT NULL,
  `Id_producto` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingresar`
--

CREATE TABLE `ingresar` (
  `id_ingresar` int(10) NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Num_id_PK` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingresar`
--

INSERT INTO `ingresar` (`id_ingresar`, `Fecha_ingreso`, `Num_id_PK`) VALUES
(1, '0000-00-00', 1598763542),
(2, '0000-00-00', 1023568498),
(3, '0000-00-00', 1022569842);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `Id_lote` int(6) NOT NULL,
  `Fecha_Vencimento` date NOT NULL,
  `Cantidad_lote` int(10) NOT NULL,
  `Id_ingresar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lote`
--

INSERT INTO `lote` (`Id_lote`, `Fecha_Vencimento`, `Cantidad_lote`, `Id_ingresar`) VALUES
(123, '2025-03-14', 90, 1),
(213, '2027-12-16', 28, 2),
(345, '2031-05-29', 65, 3),
(543, '2032-05-18', 45, 4),
(987, '2026-06-18', 32, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Num_id` int(10) NOT NULL,
  `Tipo_id` varchar(4) NOT NULL,
  `Prim_Nombre` varchar(15) NOT NULL,
  `Segun_Nombre` varchar(15) DEFAULT NULL,
  `Prim_Apellido` varchar(15) NOT NULL,
  `Segun_Apellido` varchar(15) DEFAULT NULL,
  `Telefono` varchar(15) NOT NULL,
  `Direccion` varchar(90) NOT NULL,
  `Nom_Usuario` varchar(31) NOT NULL,
  `Contra_Usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Num_id`, `Tipo_id`, `Prim_Nombre`, `Segun_Nombre`, `Prim_Apellido`, `Segun_Apellido`, `Telefono`, `Direccion`, `Nom_Usuario`, `Contra_Usuario`) VALUES
(0, '', '', '', '', '', '', '', '', 'd41d8cd98f00b204e980'),
(1010148795, 'CC', 'Jhonny', 'Alejandro', 'Gualdron', 'Vargas', '+58 3228330148', 'calle 78 sur #89', 'jhonnyg2', '81dc9bdb52d04dc20036'),
(1022924695, 'CC', 'Juan', 'Sebastian', 'Diaz', 'Lopez', '311463770', 'Kra 4 #136', 'Juanse10', '5f4dcc3b5aa765d61d83'),
(1022964696, 'CC', 'Cristian', 'Andres', 'Cardona', 'Giron', '+57 3132960252', 'calle 68 sur #95', 'Cris88', '68053af2923e00204c3c'),
(1025526487, 'CC', 'Erick', 'Santiago', 'Rodriguez', 'Molina', '3223303436', 'calle 76 #55', 'Ericksanti', '250cf8b51c773f3f8dc8');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_rol`
--

CREATE TABLE `persona_rol` (
  `Num_id` int(10) NOT NULL,
  `ROLid_Rol` int(1) NOT NULL,
  `Nom_Estado` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id_Presentacion` int(10) NOT NULL,
  `Nom_presentacion` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `presentacion`
--

INSERT INTO `presentacion` (`id_Presentacion`, `Nom_presentacion`) VALUES
(1, 'Liquido'),
(2, 'Polvo'),
(3, 'Compacto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_producto` int(10) NOT NULL,
  `Nom_producto` varchar(30) NOT NULL,
  `Num_producto` int(10) NOT NULL,
  `Valor_unitario` varchar(20) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `id_categorias` int(2) NOT NULL,
  `id_presentacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Id_producto`, `Nom_producto`, `Num_producto`, `Valor_unitario`, `Descripcion`, `id_categorias`, `id_presentacion`) VALUES
(1, 'Alcohol', 5, '8.150', ' Alcohol para desinfeccion de baño en presentacion de 1.000 ml', 2, 1),
(2, 'Fabuloso', 10, '4.500', ' Producto de limpieza para el hogar en presentacion de 750 ml', 4, 1),
(3, 'Varsol', 2, '3.000', ' Producto industrial para procesos requeridos en presentacion de 5.000 ml', 5, 1),
(4, 'Jabon Ropa', 39, '11.850', ' Jabon de ropa para proceso de lavado textil en presentacion de 5.000 kg', 1, 2),
(5, 'Bolsa Basura', 100, '1.000', ' Bolsa de basura para acumulacion de residuos No reciclables', 4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_Rol` int(1) NOT NULL,
  `Nom_Rol` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_Rol`, `Nom_Rol`) VALUES
(1, 'SuperAdmin'),
(2, 'Admin'),
(3, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `Id_salida` int(10) NOT NULL,
  `Fecha_salida` date NOT NULL,
  `Responsable_salida` varchar(35) NOT NULL,
  `Cant_salida` int(4) NOT NULL,
  `Num_id_PK` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD KEY `FK` (`Id_producto`),
  ADD KEY `Id_salida` (`Id_salida_pk`);

--
-- Indices de la tabla `ingresar`
--
ALTER TABLE `ingresar`
  ADD PRIMARY KEY (`id_ingresar`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`Id_lote`),
  ADD KEY `Id_ingresar` (`Id_ingresar`),
  ADD KEY `Id_ingresar_2` (`Id_ingresar`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Num_id`);

--
-- Indices de la tabla `persona_rol`
--
ALTER TABLE `persona_rol`
  ADD KEY `FK` (`Num_id`),
  ADD KEY `ROLid_Rol` (`ROLid_Rol`) USING BTREE;

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`id_Presentacion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_Rol`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`Id_salida`),
  ADD KEY `fk` (`Num_id_PK`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD CONSTRAINT `detalle_salida_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `producto` (`Id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_salida_ibfk_2` FOREIGN KEY (`Id_salida_pk`) REFERENCES `salida` (`Id_salida`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona_rol`
--
ALTER TABLE `persona_rol`
  ADD CONSTRAINT `FK` FOREIGN KEY (`Num_id`) REFERENCES `persona` (`Num_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_rol_ibfk_1` FOREIGN KEY (`ROLid_Rol`) REFERENCES `rol` (`id_Rol`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`Num_id_PK`) REFERENCES `persona` (`Num_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
