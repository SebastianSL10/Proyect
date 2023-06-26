-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2023 a las 03:45:47
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
-- Base de datos: `proyecto_seach`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `Id_Categoria` int(2) NOT NULL,
  `Tipo_categoria` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_ingreso`
--

CREATE TABLE `detalle_ingreso` (
  `Id_DetalleIngreso` int(10) NOT NULL,
  `Id_Ingreso` int(10) DEFAULT NULL,
  `Num_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_salida`
--

CREATE TABLE `detalle_salida` (
  `Id_registro` int(10) NOT NULL,
  `Cant_Producto` int(4) NOT NULL,
  `Codigo_Producto` int(10) NOT NULL,
  `Id_Salida` int(10) DEFAULT NULL,
  `Id_Producto` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `Id_Ingreso` int(10) NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Cant_producto` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lote`
--

CREATE TABLE `lote` (
  `Id_Lote` int(6) NOT NULL,
  `Fecha_Vencimiento` date NOT NULL,
  `Cant_lote` int(7) NOT NULL,
  `Id_Ingreso` int(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Num_id` int(10) NOT NULL,
  `Tipo_id` varchar(4) DEFAULT NULL,
  `Prim_Nombre` varchar(15) DEFAULT NULL,
  `Segun_Nombre` varchar(15) DEFAULT NULL,
  `Prim_Apellido` varchar(15) DEFAULT NULL,
  `Segun_Apellido` varchar(15) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `Direccion` varchar(90) DEFAULT NULL,
  `Nom_Usuario` varchar(31) DEFAULT NULL,
  `Contra_Usuario` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_rol`
--

CREATE TABLE `persona_rol` (
  `Id_Registro` int(10) NOT NULL,
  `Num_Id` int(10) DEFAULT NULL,
  `Id_Rol` int(2) DEFAULT NULL,
  `Nom_Estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presentacion`
--

CREATE TABLE `presentacion` (
  `Id_Presentacion` int(10) NOT NULL,
  `Nom_Presentacion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Id_producto` int(10) NOT NULL,
  `Nom_Producto` varchar(15) NOT NULL,
  `Num_Producto` int(10) NOT NULL,
  `Valor_Unitario` int(7) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Id_Categoria` int(2) DEFAULT NULL,
  `Id_Presentacion` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_Rol` int(2) NOT NULL,
  `Nom_Rol` varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `Id_Salida` int(10) NOT NULL,
  `Fecha_Salida` date NOT NULL,
  `Responsable_Salida` varchar(31) NOT NULL,
  `Cant_Salida` int(10) NOT NULL,
  `Num_Id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`Id_Categoria`);

--
-- Indices de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD PRIMARY KEY (`Id_DetalleIngreso`),
  ADD KEY `Id_Ingreso` (`Id_Ingreso`),
  ADD KEY `Num_id` (`Num_id`);

--
-- Indices de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD PRIMARY KEY (`Id_registro`),
  ADD KEY `Id_Salida` (`Id_Salida`),
  ADD KEY `Id_Producto` (`Id_Producto`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`Id_Ingreso`);

--
-- Indices de la tabla `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`Id_Lote`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Num_id`);

--
-- Indices de la tabla `persona_rol`
--
ALTER TABLE `persona_rol`
  ADD PRIMARY KEY (`Id_Registro`),
  ADD KEY `Id_Rol` (`Id_Rol`),
  ADD KEY `Num_Id` (`Num_Id`);

--
-- Indices de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  ADD PRIMARY KEY (`Id_Presentacion`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Id_producto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`Id_Salida`),
  ADD KEY `Num_Id` (`Num_Id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `Id_Categoria` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  MODIFY `Id_DetalleIngreso` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  MODIFY `Id_registro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `Id_Ingreso` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `persona_rol`
--
ALTER TABLE `persona_rol`
  MODIFY `Id_Registro` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `presentacion`
--
ALTER TABLE `presentacion`
  MODIFY `Id_Presentacion` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `Id_Salida` int(10) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`Id_Categoria`) REFERENCES `producto` (`Id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_ingreso`
--
ALTER TABLE `detalle_ingreso`
  ADD CONSTRAINT `detalle_ingreso_ibfk_1` FOREIGN KEY (`Id_Ingreso`) REFERENCES `ingreso` (`Id_Ingreso`),
  ADD CONSTRAINT `detalle_ingreso_ibfk_2` FOREIGN KEY (`Num_id`) REFERENCES `persona` (`Num_id`);

--
-- Filtros para la tabla `detalle_salida`
--
ALTER TABLE `detalle_salida`
  ADD CONSTRAINT `detalle_salida_ibfk_1` FOREIGN KEY (`Id_Salida`) REFERENCES `salida` (`Id_Salida`),
  ADD CONSTRAINT `detalle_salida_ibfk_2` FOREIGN KEY (`Id_Producto`) REFERENCES `producto` (`Id_producto`);

--
-- Filtros para la tabla `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`Id_Lote`) REFERENCES `ingreso` (`Id_Ingreso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona_rol`
--
ALTER TABLE `persona_rol`
  ADD CONSTRAINT `persona_rol_ibfk_1` FOREIGN KEY (`Id_Registro`) REFERENCES `rol` (`Id_Rol`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `persona_rol_ibfk_2` FOREIGN KEY (`Id_Rol`) REFERENCES `rol` (`Id_Rol`),
  ADD CONSTRAINT `persona_rol_ibfk_3` FOREIGN KEY (`Num_Id`) REFERENCES `persona` (`Num_id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Id_producto`) REFERENCES `presentacion` (`Id_Presentacion`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_ibfk_1` FOREIGN KEY (`Num_Id`) REFERENCES `persona` (`Num_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
