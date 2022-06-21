-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-06-2022 a las 00:07:40
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
(54, 1, 1, 123),
(63, 1, 24, 123);

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
(1, 'Berserk', 'Guts, un ex-mercenario conocido como el \"Espadachín Negro\", y en búsqueda de su venganza. Luego de una tumultuosa infancia, él finalmente encuentra a alguien a quien respeta y en quien puede confiar; y todo se desmorona cuando esta persona le arrebata todo lo importante para él, con el propósito de cumplir sus propios deseos. Ahora, siendo portador de la marca, Guts se encuentra condenado a un destino en el que es implacablemente perseguido por seres demoníacos. Encaminado en una terrible misión llena de desgracia, Guts, armado con una espada gigante y una fuerza monstruosa, no dejará que nada lo detenga, ni siquiera la misma muerte, hasta que sea capaz de tomar la cabeza de aquél que le robó toda su humanidad.', 'Imagenes\\1\\Portada\\Portada.jpg'),
(3, 'Full Metal Alchemist', 'La historia se centra en dos hermanos, Edward Elric y Alphonse Elric que rompieron el mayor tabú de la alquimia, la trasmutación humana al tratar de revivir a su fallecida madre; en consecuencia Edward pierde su pierna izquierda y Alphonse pierde todo su cuerpo, Edward para salvar a su hermano sella su alma en una gran armadura de hierro a cambio de su brazo derecho; ahora los dos con un nuevo objetivo buscan desesperadamente la piedra filosofal para poder regresar sus cuerpos a la normalidad...', 'Imagenes\\3\\Portada\\Portada.jpg'),
(5, 'Dragon Ball Z', 'Son Goku, es un niño muy especial que ha tenido que valerse por sí mismo en medio de la naturaleza y sin contacto con otras personas. Un día conoció a Bulma, una chica que busca las siete Esferas del Dragón, estos son elementos mágicos que al ser reunidos invocan a un dios dragón llamado Shenlong, el cual concederá un único deseo, cualquiera que este sea. Goku se une a Bulma en la búsqueda de las esferas sin imaginar que hay otros seres muy peligrosos que también las desean.', 'Imagenes\\5\\Portada\\Portada.jpg'),
(7, 'One Punch Man', 'La historia tiene lugar en una de las metrópolis de ficción de la Tierra, la Ciudad-Z. ¡Sigue la vida de un héroe promedio que gana todas sus peleas con un solo puño! Esto le causa un montón de frustración, ahora ya no siente la adrenalina y la emoción de una dura pelea. Tal vez ese riguroso entrenamiento para volverse fuerte no valió la pena. Después de todo, ¿qué tiene de bueno tener un poder tan aplastante?', 'Imagenes\\7\\Portada\\Portada.jpg'),
(18, 'Monster', 'La serie narra la historia de un neurocirujano Japonés llamado Kenzo Tenma, quien creyendo hacer lo correcto le salva la vida a un niño aparentemente normal; pero lejos de la realidad, este infante es en realidad un asesino sociópata que cambiará y destruirá las vidas de todos aquellos con los que se cruce en el camino, incluyendo al propio Tenma a quien inculpa de una serie de homicidios cometidos por él, haciendo que Tenma tenga que viajar por toda Alemania para encontrar a este individuo para detenerlo y de paso, poder demostrar su inocencia.', 'Imagenes\\18\\Portada\\Portada.jpg'),
(24, 'Gantz', 'Kei Kurono es un estudiante egoísta y apático que se ve obligado a salvar a una persona de morir atropellada por un tren subterráneo debido a que su compañero de la infancia Masaru Kato lo llama para que le ayude. Como consecuencia él y Kato mueren en el intento.\r\n\r\nPosteriormente aparecen en un apartamento visualmente normal con otras personas igual de desconcertadas que ellos. Allí, una misteriosa esfera negra les obliga a participar de un sádico juego y para ello les pone a su disposición todo un exótico arsenal futurista que deberán aprender a usar para combatir a diversas especies de alienígenas y otras amenazas que para la gente común pasan desapercibidas.', 'Imagenes\\24\\Portada\\Portada.jpg');

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
('Imagenes\\1\\54\\(1).png', 54),
('Imagenes\\1\\54\\(10).png', 54),
('Imagenes\\1\\54\\(11).png', 54),
('Imagenes\\1\\54\\(12).png', 54),
('Imagenes\\1\\54\\(13).png', 54),
('Imagenes\\1\\54\\(14).png', 54),
('Imagenes\\1\\54\\(15).png', 54),
('Imagenes\\1\\54\\(16).png', 54),
('Imagenes\\1\\54\\(17).png', 54),
('Imagenes\\1\\54\\(18).png', 54),
('Imagenes\\1\\54\\(19).png', 54),
('Imagenes\\1\\54\\(2).png', 54),
('Imagenes\\1\\54\\(20).png', 54),
('Imagenes\\1\\54\\(21).png', 54),
('Imagenes\\1\\54\\(22).png', 54),
('Imagenes\\1\\54\\(23).png', 54),
('Imagenes\\1\\54\\(24).png', 54),
('Imagenes\\1\\54\\(25).png', 54),
('Imagenes\\1\\54\\(26).png', 54),
('Imagenes\\1\\54\\(27).png', 54),
('Imagenes\\1\\54\\(28).png', 54),
('Imagenes\\1\\54\\(29).png', 54),
('Imagenes\\1\\54\\(3).png', 54),
('Imagenes\\1\\54\\(30).png', 54),
('Imagenes\\1\\54\\(31).png', 54),
('Imagenes\\1\\54\\(32).png', 54),
('Imagenes\\1\\54\\(33).png', 54),
('Imagenes\\1\\54\\(34).png', 54),
('Imagenes\\1\\54\\(35).png', 54),
('Imagenes\\1\\54\\(36).png', 54),
('Imagenes\\1\\54\\(37).png', 54),
('Imagenes\\1\\54\\(38).png', 54),
('Imagenes\\1\\54\\(39).png', 54),
('Imagenes\\1\\54\\(4).png', 54),
('Imagenes\\1\\54\\(40).png', 54),
('Imagenes\\1\\54\\(41).png', 54),
('Imagenes\\1\\54\\(42).png', 54),
('Imagenes\\1\\54\\(43).png', 54),
('Imagenes\\1\\54\\(44).png', 54),
('Imagenes\\1\\54\\(45).png', 54),
('Imagenes\\1\\54\\(46).png', 54),
('Imagenes\\1\\54\\(47).png', 54),
('Imagenes\\1\\54\\(48).png', 54),
('Imagenes\\1\\54\\(49).png', 54),
('Imagenes\\1\\54\\(5).png', 54),
('Imagenes\\1\\54\\(50).png', 54),
('Imagenes\\1\\54\\(51).png', 54),
('Imagenes\\1\\54\\(52).png', 54),
('Imagenes\\1\\54\\(53).png', 54),
('Imagenes\\1\\54\\(54).png', 54),
('Imagenes\\1\\54\\(55).png', 54),
('Imagenes\\1\\54\\(56).png', 54),
('Imagenes\\1\\54\\(57).png', 54),
('Imagenes\\1\\54\\(58).png', 54),
('Imagenes\\1\\54\\(59).png', 54),
('Imagenes\\1\\54\\(6).png', 54),
('Imagenes\\1\\54\\(60).png', 54),
('Imagenes\\1\\54\\(61).png', 54),
('Imagenes\\1\\54\\(62).png', 54),
('Imagenes\\1\\54\\(63).png', 54),
('Imagenes\\1\\54\\(64).png', 54),
('Imagenes\\1\\54\\(65).png', 54),
('Imagenes\\1\\54\\(66).png', 54),
('Imagenes\\1\\54\\(67).png', 54),
('Imagenes\\1\\54\\(68).png', 54),
('Imagenes\\1\\54\\(69).png', 54),
('Imagenes\\1\\54\\(7).png', 54),
('Imagenes\\1\\54\\(70).png', 54),
('Imagenes\\1\\54\\(71).png', 54),
('Imagenes\\1\\54\\(72).png', 54),
('Imagenes\\1\\54\\(73).png', 54),
('Imagenes\\1\\54\\(74).png', 54),
('Imagenes\\1\\54\\(75).png', 54),
('Imagenes\\1\\54\\(76).png', 54),
('Imagenes\\1\\54\\(77).png', 54),
('Imagenes\\1\\54\\(78).png', 54),
('Imagenes\\1\\54\\(79).png', 54),
('Imagenes\\1\\54\\(8).png', 54),
('Imagenes\\1\\54\\(80).png', 54),
('Imagenes\\1\\54\\(81).png', 54),
('Imagenes\\1\\54\\(82).png', 54),
('Imagenes\\1\\54\\(83).png', 54),
('Imagenes\\1\\54\\(9).png', 54),
('Imagenes\\24\\63\\ (1).jpg', 63),
('Imagenes\\24\\63\\ (1).png', 63),
('Imagenes\\24\\63\\ (10).png', 63),
('Imagenes\\24\\63\\ (11).png', 63),
('Imagenes\\24\\63\\ (12).png', 63),
('Imagenes\\24\\63\\ (13).png', 63),
('Imagenes\\24\\63\\ (14).png', 63),
('Imagenes\\24\\63\\ (15).png', 63),
('Imagenes\\24\\63\\ (16).png', 63),
('Imagenes\\24\\63\\ (17).png', 63),
('Imagenes\\24\\63\\ (18).png', 63),
('Imagenes\\24\\63\\ (19).png', 63),
('Imagenes\\24\\63\\ (2).jpg', 63),
('Imagenes\\24\\63\\ (2).png', 63),
('Imagenes\\24\\63\\ (20).png', 63),
('Imagenes\\24\\63\\ (21).png', 63),
('Imagenes\\24\\63\\ (22).png', 63),
('Imagenes\\24\\63\\ (23).png', 63),
('Imagenes\\24\\63\\ (24).png', 63),
('Imagenes\\24\\63\\ (25).png', 63),
('Imagenes\\24\\63\\ (26).png', 63),
('Imagenes\\24\\63\\ (27).png', 63),
('Imagenes\\24\\63\\ (28).png', 63),
('Imagenes\\24\\63\\ (29).png', 63),
('Imagenes\\24\\63\\ (3).png', 63),
('Imagenes\\24\\63\\ (30).png', 63),
('Imagenes\\24\\63\\ (31).png', 63),
('Imagenes\\24\\63\\ (32).png', 63),
('Imagenes\\24\\63\\ (33).png', 63),
('Imagenes\\24\\63\\ (34).png', 63),
('Imagenes\\24\\63\\ (35).png', 63),
('Imagenes\\24\\63\\ (36).png', 63),
('Imagenes\\24\\63\\ (37).png', 63),
('Imagenes\\24\\63\\ (38).png', 63),
('Imagenes\\24\\63\\ (39).png', 63),
('Imagenes\\24\\63\\ (4).png', 63),
('Imagenes\\24\\63\\ (40).png', 63),
('Imagenes\\24\\63\\ (41).png', 63),
('Imagenes\\24\\63\\ (5).png', 63),
('Imagenes\\24\\63\\ (6).png', 63),
('Imagenes\\24\\63\\ (7).png', 63),
('Imagenes\\24\\63\\ (8).png', 63),
('Imagenes\\24\\63\\ (9).png', 63),
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
  `contra` varchar(255) NOT NULL,
  `email` varchar(250) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `alias`, `contra`, `email`, `admin`) VALUES
(10, 'usuario', '$argon2id$v=19$m=1024,t=1,p=1$CyTX6v6MuE9v5IUU6TGnOg$AWnKpNLelr2kHv/4RoQjdI/z874rjDogYgNEV2DcZ/w', 'usuario@gmail.com', 0),
(11, 'admin', '$argon2id$v=19$m=1024,t=1,p=1$vIcVy1OeVwDHpcq2WPD2yw$XvZU58kqUvW+Cik8BHPZ9dyTa/zNQPIwT5P1E/Gjqe8', 'admin@gmail.com', 1);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `manga`
--
ALTER TABLE `manga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

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
