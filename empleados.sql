-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-03-2023 a las 05:32:31
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
-- Base de datos: `empleados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `id_empleado` int(11) NOT NULL,
  `calle` varchar(250) NOT NULL,
  `numero` varchar(250) NOT NULL,
  `colonia` varchar(250) NOT NULL,
  `ciudad` varchar(250) NOT NULL,
  `codigo_postal` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`id_empleado`, `calle`, `numero`, `colonia`, `ciudad`, `codigo_postal`) VALUES
(40, 'San Hidalgo', '187', 'Allende', 'Juarez', '54123'),
(41, 'Hermandad', '4031', 'Unidad', 'Chihuahua', '31124'),
(42, 'Familiaridad', '546', 'Oscar Flores', 'Chihuahua', '7802'),
(43, 'Solidaridad', '6721', 'Soledad', 'Chihuahua', '8914'),
(44, 'Integracion', '301', 'Libertadores', 'Chihuahua', '31125'),
(45, 'Rosales', '9871', 'Gardemias', 'Guadalajara', '0984'),
(46, 'Concordia', '987', 'Limas', 'Meoqui', '512');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono` varchar(250) DEFAULT NULL,
  `email` varchar(250) NOT NULL,
  `f_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`id`, `nombre`, `fecha_nacimiento`, `telefono`, `email`, `f_registro`) VALUES
(40, 'Joel Martinez', '2023-02-28', '6149827845', 'joelmart@hotmail.com', '2023-03-26 23:55:40'),
(41, 'Luis Ángel Arteaga Navarrete', '2001-01-27', '6143639472', 'luis_arteaga2701@outlook.com', '2023-03-26 22:11:31'),
(42, 'Antonio Laviosser', '2007-06-06', '6148729384', 'antonio_laviosser31@outlook.com', '2023-03-26 22:13:48'),
(43, 'Raul Fernando Vera Fernandez', '2001-05-04', '6147948723', 'raul.vera@hotmail.com', '2023-03-26 22:27:28'),
(44, 'Josefina Peña Loera', '1995-05-12', '6148273051', 'josefinaloera@gmail.com', '2023-03-26 23:20:54'),
(45, 'Flor Estefania', '1998-02-03', '6148793674', 'flor.como@hotmail.com', '2023-03-27 00:11:51'),
(46, 'Luis Gonzalez', '2002-09-11', '6148290345', 'wowing556@outlook.com', '2023-03-27 00:24:55');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
