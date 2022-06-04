-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2022 a las 18:17:47
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
(1, 5, 1, 30),
(2, 4, 3, 0),
(3, 5, 1, 2);

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
(5, 'Dragon Ball', 'Son Goku, es un niño muy especial que ha tenido que valerse por sí mismo en medio de la naturaleza y sin contacto con otras personas. Un día conoció a Bulma, una chica que busca las siete Esferas del Dragón, estos son elementos mágicos que al ser reunidos invocan a un dios dragón llamado Shenlong, el cual concederá un único deseo, cualquiera que este sea. Goku se une a Bulma en la búsqueda de las esferas sin imaginar que hay otros seres muy peligrosos que también las desean.', 'Imagenes/5/portada/db.jpg');

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
('Imagenes/01.jpg', 1),
('Imagenes/1.jpg', 2),
('Imagenes/2.jpg', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `manga`
--
ALTER TABLE `manga`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
