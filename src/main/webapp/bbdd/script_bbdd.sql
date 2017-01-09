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
(1, 0, 'Encuesta 1'),
(13, 0, 'Encuesta 2'),
(35, 0, 'Encuesta 3');

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
(5, 0, 10, 'Manuel', 2),
(6, 0, 3, 'Juan', 2),
(7, 0, 0, 'Antonio', 2),
(8, 0, 20, 'Si', 3),
(9, 0, 1, 'No', 3),
(10, 0, 19, 'Si', 4),
(11, 0, 1, 'No', 4),
(12, 0, 3, 'NS/NC', 4),
(15, 0, 40, 'Fifa 2016', 14),
(16, 0, 2, 'Pro Evolution 2016', 14),
(17, 0, 77, 'World Of Warcraft', 14),
(18, 0, 100, 'Call Of Duty', 14),
(20, 0, 1000, 'Bien, precio correcto', 14),
(21, 0, 10, 'Mal, en otras tiendas estan mas baratos', 14),
(22, 0, 100, 'Muy caros', 19),
(24, 0, 2, '0', 23),
(25, 0, 5, '1', 23),
(26, 0, 2, '2', 23),
(27, 0, 8, '3', 23),
(28, 0, 2, '4', 23),
(29, 0, 9, '5', 23),
(30, 0, 8, '6', 23),
(31, 0, 4, '7', 23),
(32, 0, 2, '8', 23),
(33, 0, 2, '9', 23),
(34, 0, 1, '10', 23),
(37, 0, 121, 'PP', 36),
(38, 0, 95, 'PSOE', 36),
(39, 0, 75, 'Podemos', 36),
(40, 0, 40, 'Ciudadanos', 36),
(41, 0, 4, 'Fifa 2016', 36),
(42, 0, 1, 'UPyD', 36),
(43, 0, 40, 'Otros', 36);

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
(2, 0, '41013', '¿Quién debe de ser el presidente de la comunidad?', 1),
(3, 0, '41013', '¿Consideras las cuentas de este año correctas?', 1),
(4, 0, '41013', '¿En general, estás satisfecho con el antiguo presidente?', 1),
(14, 0, '41012', '¿Cual es el mejor juego de nuestra tienda?', 13),
(19, 0, '41012', '¿Qué le parece nuestra politica de precios?', 13),
(23, 0, '41012', '¿En general, como calificarias nuestra tienda?', 13),
(36, 0, '28052', '¿Quien debería de ganar las elecciones?', 35);

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `useraccount_authorities`
--

CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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