-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2022 a las 20:19:09
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ingweb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capitulo`
--

CREATE TABLE `capitulo` (
  `id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT 0,
  `mangaid` int(11) NOT NULL,
  `usuarioid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `capitulo`
--

INSERT INTO `capitulo` (`id`, `num`, `mangaid`, `usuarioid`) VALUES
(53, 208, 7, 123),
(54, 1, 1, 123);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `manga`
--

CREATE TABLE `manga` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `port` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `manga`
--

INSERT INTO `manga` (`id`, `nombre`, `descripcion`, `port`) VALUES
(1, 'Berserk', 'Guts, un ex-mercenario conocido como el \"Espadachín Negro\", y en búsqueda de su venganza. Luego de una tumultuosa infancia, él finalmente encuentra a alguien a quien respeta y en quien puede confiar; y todo se desmorona cuando esta persona le arrebata todo lo importante para él, con el propósito de cumplir sus propios deseos. Ahora, siendo portador de la marca, Guts se encuentra condenado a un destino en el que es implacablemente perseguido por seres demoníacos.\nEncaminado en una terrible misión llena de desgracia, Guts, armado con una espada gigante y una fuerza monstruosa, no dejará que nada lo detenga, ni siquiera la misma muerte, hasta que sea capaz de tomar la cabeza de aquél que le robó toda su humanidad.', 'Imagenes/1/portada/berserk.jpg'),
(3, 'Full Metal Alchemist', 'La historia se centra en dos hermanos, Edward Elric y Alphonse Elric que rompieron el mayor tabú de la alquimia, la trasmutación humana al tratar de revivir a su fallecida madre; en consecuencia Edward pierde su pierna izquierda y Alphonse pierde todo su cuerpo, Edward para salvar a su hermano sella su alma en una gran armadura de hierro a cambio de su brazo derecho; ahora los dos con un nuevo objetivo buscan desesperadamente la piedra filosofal para poder regresar sus cuerpos a la normalidad...', 'Imagenes/3/portada/fma.jpg'),
(5, 'Dragon Ball', 'Son Goku, es un niño muy especial que ha tenido que valerse por sí mismo en medio de la naturaleza y sin contacto con otras personas. Un día conoció a Bulma, una chica que busca las siete Esferas del Dragón, estos son elementos mágicos que al ser reunidos invocan a un dios dragón llamado Shenlong, el cual concederá un único deseo, cualquiera que este sea. Goku se une a Bulma en la búsqueda de las esferas sin imaginar que hay otros seres muy peligrosos que también las desean.', 'Imagenes/5/portada/db.jpg'),
(7, 'One Punch Man', 'La historia tiene lugar en una de las metrópolis de ficción de la Tierra, la Ciudad-Z. ¡Sigue la vida de un héroe promedio que gana todas sus peleas con un solo puño! Esto le causa un montón de frustración, ahora ya no siente la adrenalina y la emoción de una dura pelea. Tal vez ese riguroso entrenamiento para volverse fuerte no valió la pena. Después de todo, ¿qué tiene de bueno tener un poder tan aplastante?', 'Imagenes/7/portada/opm.jpg'),
(16, 'Hunter X Hunter', 'Doce años antes del inicio de la historia, Ging Freecss abandonó a su hijo Gon en manos de su tía Mito en Isla Ballena. Gon, quien siempre creyó que sus padres habían muerto, descubre un día gracias al aprendiz de su padre, Kite, que este aún se encuentra con vida y se ha convertido en uno de los mejores cazadores,​ individuos de élite y acreditados para el rastreo de tesoros secretos, bestias exóticas e, incluso, otros individuos.​ Motivado por esta revelación, Gon decide dejar su hogar y presentarse al examen de cazador,​ una serie de desafíos que buscan probar las habilidades, supervivencia y trabajo en equipo de sus participantes.', 'Imagenes\\16\\Portada\\hxh.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagina`
--

CREATE TABLE `pagina` (
  `img` varchar(50) NOT NULL,
  `cap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pagina`
--

INSERT INTO `pagina` (`img`, `cap`) VALUES
('Imagenes\\1\\54\\ (1).png', 54),
('Imagenes\\1\\54\\ (10).png', 54),
('Imagenes\\1\\54\\ (11).png', 54),
('Imagenes\\1\\54\\ (12).png', 54),
('Imagenes\\1\\54\\ (13).png', 54),
('Imagenes\\1\\54\\ (14).png', 54),
('Imagenes\\1\\54\\ (15).png', 54),
('Imagenes\\1\\54\\ (16).png', 54),
('Imagenes\\1\\54\\ (17).png', 54),
('Imagenes\\1\\54\\ (18).png', 54),
('Imagenes\\1\\54\\ (19).png', 54),
('Imagenes\\1\\54\\ (2).png', 54),
('Imagenes\\1\\54\\ (20).png', 54),
('Imagenes\\1\\54\\ (21).png', 54),
('Imagenes\\1\\54\\ (22).png', 54),
('Imagenes\\1\\54\\ (23).png', 54),
('Imagenes\\1\\54\\ (24).png', 54),
('Imagenes\\1\\54\\ (25).png', 54),
('Imagenes\\1\\54\\ (26).png', 54),
('Imagenes\\1\\54\\ (27).png', 54),
('Imagenes\\1\\54\\ (28).png', 54),
('Imagenes\\1\\54\\ (29).png', 54),
('Imagenes\\1\\54\\ (3).png', 54),
('Imagenes\\1\\54\\ (30).png', 54),
('Imagenes\\1\\54\\ (31).png', 54),
('Imagenes\\1\\54\\ (32).png', 54),
('Imagenes\\1\\54\\ (33).png', 54),
('Imagenes\\1\\54\\ (34).png', 54),
('Imagenes\\1\\54\\ (35).png', 54),
('Imagenes\\1\\54\\ (36).png', 54),
('Imagenes\\1\\54\\ (37).png', 54),
('Imagenes\\1\\54\\ (38).png', 54),
('Imagenes\\1\\54\\ (39).png', 54),
('Imagenes\\1\\54\\ (4).png', 54),
('Imagenes\\1\\54\\ (40).png', 54),
('Imagenes\\1\\54\\ (41).png', 54),
('Imagenes\\1\\54\\ (42).png', 54),
('Imagenes\\1\\54\\ (43).png', 54),
('Imagenes\\1\\54\\ (44).png', 54),
('Imagenes\\1\\54\\ (45).png', 54),
('Imagenes\\1\\54\\ (46).png', 54),
('Imagenes\\1\\54\\ (47).png', 54),
('Imagenes\\1\\54\\ (48).png', 54),
('Imagenes\\1\\54\\ (49).png', 54),
('Imagenes\\1\\54\\ (5).png', 54),
('Imagenes\\1\\54\\ (50).png', 54),
('Imagenes\\1\\54\\ (51).png', 54),
('Imagenes\\1\\54\\ (52).png', 54),
('Imagenes\\1\\54\\ (53).png', 54),
('Imagenes\\1\\54\\ (54).png', 54),
('Imagenes\\1\\54\\ (55).png', 54),
('Imagenes\\1\\54\\ (56).png', 54),
('Imagenes\\1\\54\\ (57).png', 54),
('Imagenes\\1\\54\\ (58).png', 54),
('Imagenes\\1\\54\\ (59).png', 54),
('Imagenes\\1\\54\\ (6).png', 54),
('Imagenes\\1\\54\\ (60).png', 54),
('Imagenes\\1\\54\\ (61).png', 54),
('Imagenes\\1\\54\\ (62).png', 54),
('Imagenes\\1\\54\\ (63).png', 54),
('Imagenes\\1\\54\\ (64).png', 54),
('Imagenes\\1\\54\\ (65).png', 54),
('Imagenes\\1\\54\\ (66).png', 54),
('Imagenes\\1\\54\\ (67).png', 54),
('Imagenes\\1\\54\\ (68).png', 54),
('Imagenes\\1\\54\\ (69).png', 54),
('Imagenes\\1\\54\\ (7).png', 54),
('Imagenes\\1\\54\\ (70).png', 54),
('Imagenes\\1\\54\\ (71).png', 54),
('Imagenes\\1\\54\\ (72).png', 54),
('Imagenes\\1\\54\\ (73).png', 54),
('Imagenes\\1\\54\\ (74).png', 54),
('Imagenes\\1\\54\\ (75).png', 54),
('Imagenes\\1\\54\\ (76).png', 54),
('Imagenes\\1\\54\\ (77).png', 54),
('Imagenes\\1\\54\\ (78).png', 54),
('Imagenes\\1\\54\\ (79).png', 54),
('Imagenes\\1\\54\\ (8).png', 54),
('Imagenes\\1\\54\\ (80).png', 54),
('Imagenes\\1\\54\\ (81).png', 54),
('Imagenes\\1\\54\\ (82).png', 54),
('Imagenes\\1\\54\\ (83).png', 54),
('Imagenes\\1\\54\\ (9).png', 54),
('Imagenes\\7\\53\\1.jpg', 53),
('Imagenes\\7\\53\\10.jpg', 53),
('Imagenes\\7\\53\\11.jpg', 53),
('Imagenes\\7\\53\\12.jpg', 53),
('Imagenes\\7\\53\\13.jpg', 53),
('Imagenes\\7\\53\\14.jpg', 53),
('Imagenes\\7\\53\\15.jpg', 53),
('Imagenes\\7\\53\\16.jpg', 53),
('Imagenes\\7\\53\\17.jpg', 53),
('Imagenes\\7\\53\\18.jpg', 53),
('Imagenes\\7\\53\\19.jpg', 53),
('Imagenes\\7\\53\\2.jpg', 53),
('Imagenes\\7\\53\\20.jpg', 53),
('Imagenes\\7\\53\\21.jpg', 53),
('Imagenes\\7\\53\\22.jpg', 53),
('Imagenes\\7\\53\\23.jpg', 53),
('Imagenes\\7\\53\\24.jpg', 53),
('Imagenes\\7\\53\\25.jpg', 53),
('Imagenes\\7\\53\\26.jpg', 53),
('Imagenes\\7\\53\\27.jpg', 53),
('Imagenes\\7\\53\\28.jpg', 53),
('Imagenes\\7\\53\\29.jpg', 53),
('Imagenes\\7\\53\\3.jpg', 53),
('Imagenes\\7\\53\\30.jpg', 53),
('Imagenes\\7\\53\\31.jpg', 53),
('Imagenes\\7\\53\\32.jpg', 53),
('Imagenes\\7\\53\\33.jpg', 53),
('Imagenes\\7\\53\\34.jpg', 53),
('Imagenes\\7\\53\\35.jpg', 53),
('Imagenes\\7\\53\\36.jpg', 53),
('Imagenes\\7\\53\\37.jpg', 53),
('Imagenes\\7\\53\\38.jpg', 53),
('Imagenes\\7\\53\\39.jpg', 53),
('Imagenes\\7\\53\\4.jpg', 53),
('Imagenes\\7\\53\\40.jpg', 53),
('Imagenes\\7\\53\\41.jpg', 53),
('Imagenes\\7\\53\\42.jpg', 53),
('Imagenes\\7\\53\\43.jpg', 53),
('Imagenes\\7\\53\\44.jpg', 53),
('Imagenes\\7\\53\\45.jpg', 53),
('Imagenes\\7\\53\\46.jpg', 53),
('Imagenes\\7\\53\\47.jpg', 53),
('Imagenes\\7\\53\\5.jpg', 53),
('Imagenes\\7\\53\\6.jpg', 53),
('Imagenes\\7\\53\\7.jpg', 53),
('Imagenes\\7\\53\\8.jpg', 53),
('Imagenes\\7\\53\\9.jpg', 53);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `alias` varchar(50) NOT NULL,
  `contra` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `alias`, `contra`, `email`, `admin`) VALUES
(1, 'dismas', '', 'rosasfran.97@gmail.com', 1),
(2, 'user', 'asd', 'asd', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `capitulo`
--
ALTER TABLE `capitulo`
  ADD PRIMARY KEY (`id`,`mangaid`) USING BTREE,
  ADD KEY `mangaid` (`mangaid`);

--
-- Indices de la tabla `manga`
--
ALTER TABLE `manga`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD PRIMARY KEY (`img`,`cap`),
  ADD KEY `cap` (`cap`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `alias` (`alias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `capitulo`
--
ALTER TABLE `capitulo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `manga`
--
ALTER TABLE `manga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `capitulo`
--
ALTER TABLE `capitulo`
  ADD CONSTRAINT `capitulo_ibfk_1` FOREIGN KEY (`mangaid`) REFERENCES `manga` (`id`);

--
-- Filtros para la tabla `pagina`
--
ALTER TABLE `pagina`
  ADD CONSTRAINT `pagina_ibfk_1` FOREIGN KEY (`cap`) REFERENCES `capitulo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
