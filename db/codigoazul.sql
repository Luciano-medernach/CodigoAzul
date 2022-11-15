-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 22:27:11
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `codigoazul`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id`, `name`) VALUES
(2, 'Sector 11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calls`
--

CREATE TABLE `calls` (
  `id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `area` int(11) NOT NULL,
  `origin` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `attended` tinyint(1) NOT NULL DEFAULT 0,
  `time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurses`
--

CREATE TABLE `nurses` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nurses`
--

INSERT INTO `nurses` (`id`, `name`, `lastname`) VALUES
(3, 'Emi', 'Martinez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurse_area`
--

CREATE TABLE `nurse_area` (
  `id` int(11) NOT NULL,
  `nurseid` int(11) NOT NULL,
  `areaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nurse_area`
--

INSERT INTO `nurse_area` (`id`, `nurseid`, `areaid`) VALUES
(8, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nurse_patient`
--

CREATE TABLE `nurse_patient` (
  `id` int(11) NOT NULL,
  `nurseid` int(11) NOT NULL,
  `patientid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `nurse_patient`
--

INSERT INTO `nurse_patient` (`id`, `nurseid`, `patientid`) VALUES
(12, 3, 5),
(14, 3, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `dni` int(11) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `family_phone` varchar(50) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `medical_history` text DEFAULT NULL,
  `medicines` text DEFAULT NULL,
  `area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `patients`
--

INSERT INTO `patients` (`id`, `name`, `lastname`, `dni`, `age`, `address`, `phone`, `family_phone`, `height`, `weight`, `medical_history`, `medicines`, `area`) VALUES
(2, 'Julio', 'Martinez', 0, 46, '', '', '', 1.67, 44, '', '', 2),
(5, 'Ivanaw', 'Medernach', 174437, 51, '64-156', '2262141510', '2262140631', 1.84, 70, '', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patient_area`
--

CREATE TABLE `patient_area` (
  `id` int(11) NOT NULL,
  `patientid` int(11) NOT NULL,
  `areaid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `patient_area`
--

INSERT INTO `patient_area` (`id`, `patientid`, `areaid`) VALUES
(14, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `lastname`, `username`, `password`, `admin`) VALUES
(1, 'admin', 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calls`
--
ALTER TABLE `calls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `origin` (`origin`);

--
-- Indices de la tabla `nurses`
--
ALTER TABLE `nurses`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nurse_area`
--
ALTER TABLE `nurse_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nurseid` (`nurseid`),
  ADD KEY `areaid` (`areaid`);

--
-- Indices de la tabla `nurse_patient`
--
ALTER TABLE `nurse_patient`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nurseid` (`nurseid`),
  ADD KEY `patientid` (`patientid`);

--
-- Indices de la tabla `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `area` (`area`) USING BTREE;

--
-- Indices de la tabla `patient_area`
--
ALTER TABLE `patient_area`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patientid` (`patientid`),
  ADD KEY `areaid` (`areaid`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `calls`
--
ALTER TABLE `calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `nurses`
--
ALTER TABLE `nurses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `nurse_area`
--
ALTER TABLE `nurse_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `nurse_patient`
--
ALTER TABLE `nurse_patient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `patient_area`
--
ALTER TABLE `patient_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calls`
--
ALTER TABLE `calls`
  ADD CONSTRAINT `calls_ibfk_1` FOREIGN KEY (`origin`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `nurse_area`
--
ALTER TABLE `nurse_area`
  ADD CONSTRAINT `nurse_area_ibfk_1` FOREIGN KEY (`nurseid`) REFERENCES `nurses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nurse_area_ibfk_2` FOREIGN KEY (`areaid`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `nurse_patient`
--
ALTER TABLE `nurse_patient`
  ADD CONSTRAINT `nurse_patient_ibfk_1` FOREIGN KEY (`nurseid`) REFERENCES `nurses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `nurse_patient_ibfk_2` FOREIGN KEY (`patientid`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`area`) REFERENCES `areas` (`id`);

--
-- Filtros para la tabla `patient_area`
--
ALTER TABLE `patient_area`
  ADD CONSTRAINT `patient_area_ibfk_1` FOREIGN KEY (`patientid`) REFERENCES `patients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `patient_area_ibfk_2` FOREIGN KEY (`areaid`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
