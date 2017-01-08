/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Estructura de tabla para la tabla `encuesta`
--

CREATE TABLE `encuesta` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `encuesta`
--

INSERT INTO `encuesta` (`id`, `version`, `nombre`) VALUES
(4, 0, 'Encuesta 1'),
(16, 0, 'Encuesta 2'),
(38, 0, 'Encuesta 3');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hibernate_sequences`
--

CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hibernate_sequences`
--

INSERT INTO `hibernate_sequences` (`sequence_name`, `sequence_next_hi_value`) VALUES
('DomainEntity', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opcion`
--

CREATE TABLE `opcion` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `recuento` int(11) DEFAULT NULL,
  `texto` varchar(255) DEFAULT NULL,
  `pregunta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `opcion`
--

INSERT INTO `opcion` (`id`, `version`, `recuento`, `texto`, `pregunta_id`) VALUES
(8, 0, 10, 'Manuel', 5),
(9, 0, 3, 'Juan', 5),
(10, 0, 0, 'Antonio', 5),
(11, 0, 20, 'Si', 6),
(12, 0, 1, 'No', 6),
(13, 0, 19, 'Si', 7),
(14, 0, 1, 'No', 7),
(15, 0, 3, 'NS/NC', 7),
(18, 0, 40, 'Fifa 2016', 17),
(19, 0, 2, 'Pro Evolution 2016', 17),
(20, 0, 77, 'World Of Warcraft', 17),
(21, 0, 100, 'Call Of Duty', 17),
(23, 0, 1000, 'Bien, precio correcto', 17),
(24, 0, 10, 'Mal, en otras tiendas estan mas baratos', 17),
(25, 0, 100, 'Muy caros', 22),
(27, 0, 2, '0', 26),
(28, 0, 5, '1', 26),
(29, 0, 2, '2', 26),
(30, 0, 8, '3', 26),
(31, 0, 2, '4', 26),
(32, 0, 9, '5', 26),
(33, 0, 8, '6', 26),
(34, 0, 4, '7', 26),
(35, 0, 2, '8', 26),
(36, 0, 2, '9', 26),
(37, 0, 1, '10', 26),
(40, 0, 121, 'PP', 39),
(41, 0, 95, 'PSOE', 39),
(42, 0, 75, 'Podemos', 39),
(43, 0, 40, 'Ciudadanos', 39),
(44, 0, 4, 'Fifa 2016', 39),
(45, 0, 1, 'UPyD', 39),
(46, 0, 40, 'Otros', 39);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cp` varchar(255) DEFAULT NULL,
  `pregunta` varchar(255) DEFAULT NULL,
  `encuesta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `version`, `cp`, `pregunta`, `encuesta_id`) VALUES
(5, 0, '41013', '¿Quién debe de ser el presidente de la comunidad?', 4),
(6, 0, '41013', '¿Consideras las cuentas de este año correctas?', 4),
(7, 0, '41013', '¿En general, estás satisfecho con el antiguo presidente?', 4),
(17, 0, '41012', '¿Cual es el mejor juego de nuestra tienda?', 16),
(22, 0, '41012', '¿Qué le parece nuestra politica de precios?', 16),
(26, 0, '41012', '¿En general, como calificarias nuestra tienda?', 16),
(39, 0, '28052', '¿Quien debería de ganar las elecciones?', 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `useraccount`
--

CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `useraccount`
--

INSERT INTO `useraccount` (`id`, `version`, `password`, `username`) VALUES
(1, 0, '21232f297a57a5a743894a0e4a801fc3', 'admin'),
(2, 0, '91ec1f9324753048c0096d036a694f86', 'customer'),
(3, 0, '1b3231655cebb7a1f783eddf27d254ca', 'super');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `useraccount_authorities`
--

CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `useraccount_authorities`
--

INSERT INTO `useraccount_authorities` (`UserAccount_id`, `authority`) VALUES
(1, 'ADMIN'),
(2, 'CUSTOMER'),
(3, 'ADMIN'),
(3, 'CUSTOMER');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `encuesta`
--
ALTER TABLE `encuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_rxa0pvkiqhexo8pddttijsstd` (`pregunta_id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_qj0l1b5xskt5ulo37no4819k4` (`encuesta_id`);

--
-- Indices de la tabla `useraccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`);

--
-- Indices de la tabla `useraccount_authorities`
--
ALTER TABLE `useraccount_authorities`
  ADD KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `opcion`
--
ALTER TABLE `opcion`
  ADD CONSTRAINT `FK_rxa0pvkiqhexo8pddttijsstd` FOREIGN KEY (`pregunta_id`) REFERENCES `pregunta` (`id`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FK_qj0l1b5xskt5ulo37no4819k4` FOREIGN KEY (`encuesta_id`) REFERENCES `encuesta` (`id`);

--
-- Filtros para la tabla `useraccount_authorities`
--
ALTER TABLE `useraccount_authorities`
  ADD CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
