-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-03-2023 a las 19:49:01
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
-- Base de datos: `search`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(2) NOT NULL,
  `Tipo_categoria` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `Telefono` int(10) NOT NULL,
  `Direccion` varchar(90) NOT NULL,
  `Nom_Usuario` varchar(31) NOT NULL,
  `Contra_Usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Num_id`, `Tipo_id`, `Prim_Nombre`, `Segun_Nombre`, `Prim_Apellido`, `Segun_Apellido`, `Telefono`, `Direccion`, `Nom_Usuario`, `Contra_Usuario`) VALUES
(1022569842, 'CC', 'Erick', 'Santiago', 'Rodriguez', 'Molina', 311524669, 'kra 4 5-89', 'Erick_santi32', 'password'),
(1022924893, 'CC', 'Juan', 'Sebastian', 'Diaz', 'Lopez', 2147483647, 'kra 4 136a 80', 'Juanse10', 'Contraseño'),
(1023568498, 'CC', 'Cristian', 'Andres', 'Cardona', 'Giron', 2147483647, 'kr 32 25-6', 'CristianCar', 'cardona12345'),
(1598763542, 'CC', 'Jhonny', 'Alejando', 'Gualdron', 'Vargas', 2147483647, 'kra 5 5-63', 'Jhonnyg2', 'contraseña');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_rol`
--

CREATE TABLE `persona_rol` (
  `Num_id` int(10) NOT NULL,
  `ROLid_Rol` int(1) NOT NULL,
  `Nom_Estado` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona_rol`
--

INSERT INTO `persona_rol` (`Num_id`, `ROLid_Rol`, `Nom_Estado`) VALUES
(1022569842, 1, 'Activo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `id_Presentacion` int(10) NOT NULL,
  `Nom_press` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_producto` int(10) NOT NULL,
  `Nom_producto` varchar(30) NOT NULL,
  `Num_producto` int(10) NOT NULL,
  `Valor_unitario` int(7) NOT NULL,
  `Descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
