-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-06-2013 a las 22:21:19
-- Versión del servidor: 5.5.27
-- Versión de PHP: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `pry`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncio`
--

CREATE TABLE IF NOT EXISTS `anuncio` (
  `ANU_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ANU_DES` text,
  `ANU_MTO` int(11) DEFAULT NULL,
  `ANU_TIP` int(11) DEFAULT NULL,
  `ANU_EST` int(11) DEFAULT NULL,
  `ANU_CRN_FEC` datetime DEFAULT NULL,
  `ANU_VEN_FEC` datetime DEFAULT NULL,
  `IDO_ID` int(11) NOT NULL,
  `ANU_OPC_DTA` text,
  `ANU_IMG_DIR` varchar(255) DEFAULT NULL,
  `MOD_ID` int(11) NOT NULL,
  PRIMARY KEY (`ANU_ID`),
  KEY `FK_MODELO_idx` (`MOD_ID`),
  KEY `FK_INTERESADO_idx` (`IDO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncio_sitio`
--

CREATE TABLE IF NOT EXISTS `anuncio_sitio` (
  `ANU_SIT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ANU_ID` int(11) NOT NULL,
  `SIT_ID` int(11) NOT NULL,
  `ANU_SIT_EST` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ANU_SIT_ID`),
  KEY `FK_ANUNCIO_idx` (`ANU_ID`),
  KEY `FK_SITIO_idx` (`SIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `app_config`
--

CREATE TABLE IF NOT EXISTS `app_config` (
  `APP_CFG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_CFG_OPT` varchar(150) DEFAULT NULL,
  `APP_CFG_VAL` int(11) DEFAULT NULL,
  PRIMARY KEY (`APP_CFG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automotora`
--

CREATE TABLE IF NOT EXISTS `automotora` (
  `AUT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `AUT_NOM` varchar(255) DEFAULT NULL,
  `AUT_RZN_SOC` varchar(255) DEFAULT NULL,
  `AUT_RUT` varchar(10) DEFAULT NULL,
  `AUT_DV` char(1) DEFAULT NULL,
  `AUT_EST` int(11) DEFAULT NULL,
  `AUT_DIR` varchar(255) DEFAULT NULL,
  `COM_ID` int(11) NOT NULL,
  `AUT_TEL1` bigint(20) DEFAULT NULL,
  `AUT_TEL2` bigint(20) DEFAULT NULL,
  `AUT_MAIL` varchar(255) DEFAULT NULL,
  `IDO_ID` int(11) NOT NULL,
  PRIMARY KEY (`AUT_ID`),
  KEY `FK_COMUNA_idx` (`COM_ID`),
  KEY `FK_INTERESADO_idx` (`IDO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comuna`
--

CREATE TABLE IF NOT EXISTS `comuna` (
  `COM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COM_NOM` varchar(100) NOT NULL,
  `PRV_ID` int(11) DEFAULT NULL,
  `REG_ID` int(11) NOT NULL,
  PRIMARY KEY (`COM_ID`),
  KEY `FK_REGION_idx` (`REG_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15203 ;

--
-- Volcado de datos para la tabla `comuna`
--

INSERT INTO `comuna` (`COM_ID`, `COM_NOM`, `PRV_ID`, `REG_ID`) VALUES
(1101, 'Iquique', 1100, 1),
(1102, 'Camiña', 1100, 1),
(1103, 'Colchane', 1100, 1),
(1104, 'Huara', 1100, 1),
(1105, 'Pica', 1100, 1),
(1106, 'Pozo Almonte', 1100, 1),
(2101, 'Antofagasta', 2100, 2),
(2102, 'Mejillones', 2100, 2),
(2103, 'Sierra Gorda', 2100, 2),
(2104, 'Taltal', 2100, 2),
(2201, 'Calama', 2200, 2),
(2202, 'Ollagüe', 2200, 2),
(2203, 'San Pedro de Atacama', 2200, 2),
(2301, 'Tocopilla', 2300, 2),
(2302, 'María Elena', 2300, 2),
(3101, 'Copiapó', 3100, 3),
(3102, 'Caldera', 3100, 3),
(3103, 'Tierra Amarilla', 3100, 3),
(3201, 'Chañaral', 3200, 3),
(3202, 'Diego de Almagro', 3200, 3),
(3301, 'Vallenar', 3300, 3),
(3302, 'Alto del Carmen', 3300, 3),
(3303, 'Freirina', 3300, 3),
(3304, 'Huasco', 3300, 3),
(4101, 'La Serena', 4100, 4),
(4102, 'Coquimbo', 4100, 4),
(4103, 'Andacollo', 4100, 4),
(4104, 'La Higuera', 4100, 4),
(4105, 'Paiguano', 4100, 4),
(4106, 'Vicuña', 4100, 4),
(4201, 'Illapel', 4200, 4),
(4202, 'Canela', 4200, 4),
(4203, 'Los Vilos', 4200, 4),
(4204, 'Salamanca', 4200, 4),
(4301, 'Ovalle', 4300, 4),
(4302, 'Combarbalá', 4300, 4),
(4303, 'Monte Patria', 4300, 4),
(4304, 'Punitaqui', 4300, 4),
(4305, 'Río Hurtado', 4300, 4),
(5101, 'Valparaíso', 5100, 5),
(5102, 'Casablanca', 5100, 5),
(5103, 'Concón', 5100, 5),
(5104, 'Juan Fernández', 5100, 5),
(5105, 'Puchuncaví', 5100, 5),
(5106, 'Quilpué', 5100, 5),
(5107, 'Quintero', 5100, 5),
(5108, 'Villa Alemana', 5100, 5),
(5109, 'Viña del Mar', 5100, 5),
(5201, 'Isla de Pascua', 5200, 5),
(5301, 'Los Andes', 5300, 5),
(5302, 'Calle Larga', 5300, 5),
(5303, 'Rinconada', 5300, 5),
(5304, 'San Esteban', 5300, 5),
(5401, 'La Ligua', 5400, 5),
(5402, 'Cabildo', 5400, 5),
(5403, 'Papudo', 5400, 5),
(5404, 'Petorca', 5400, 5),
(5405, 'Zapallar', 5400, 5),
(5501, 'Quillota', 5500, 5),
(5502, 'Calera', 5500, 5),
(5503, 'Hijuelas', 5500, 5),
(5504, 'La Cruz', 5500, 5),
(5505, 'Limache', 5500, 5),
(5506, 'Nogales', 5500, 5),
(5507, 'Olmué', 5500, 5),
(5601, 'San Antonio', 5600, 5),
(5602, 'Algarrobo', 5600, 5),
(5603, 'Cartagena', 5600, 5),
(5604, 'El Quisco', 5600, 5),
(5605, 'El Tabo', 5600, 5),
(5606, 'Santo Domingo', 5600, 5),
(5701, 'San Felipe', 5700, 5),
(5702, 'Catemu', 5700, 5),
(5703, 'Llaillay', 5700, 5),
(5704, 'Panquehue', 5700, 5),
(5705, 'Putaendo', 5700, 5),
(5706, 'Santa María', 5700, 5),
(6101, 'Rancagua', 6100, 6),
(6102, 'Codegua', 6100, 6),
(6103, 'Coinco', 6100, 6),
(6104, 'Coltauco', 6100, 6),
(6105, 'Doñihue', 6100, 6),
(6106, 'Graneros', 6100, 6),
(6107, 'Las Cabras', 6100, 6),
(6108, 'Machalí', 6100, 6),
(6109, 'Malloa', 6100, 6),
(6110, 'Mostazal', 6100, 6),
(6111, 'Olivar', 6100, 6),
(6112, 'Peumo', 6100, 6),
(6113, 'Pichidegua', 6100, 6),
(6114, 'Quinta de Tilcoco', 6100, 6),
(6115, 'Rengo', 6100, 6),
(6116, 'Requínoa', 6100, 6),
(6117, 'San Vicente', 6100, 6),
(6201, 'Pichilemu', 6200, 6),
(6202, 'La Estrella', 6200, 6),
(6203, 'Litueche', 6200, 6),
(6204, 'Marchihue', 6200, 6),
(6205, 'Navidad', 6200, 6),
(6206, 'Paredones', 6200, 6),
(6301, 'San Fernando', 6300, 6),
(6302, 'Chépica', 6300, 6),
(6303, 'Chimbarongo', 6300, 6),
(6304, 'Lolol', 6300, 6),
(6305, 'Nancagua', 6300, 6),
(6306, 'Palmilla', 6300, 6),
(6307, 'Peralillo', 6300, 6),
(6308, 'Placilla', 6300, 6),
(6309, 'Pumanque', 6300, 6),
(6310, 'Santa Cruz', 6300, 6),
(7101, 'Talca', 7100, 7),
(7102, 'Constitución', 7100, 7),
(7103, 'Curepto', 7100, 7),
(7104, 'Empedrado', 7100, 7),
(7105, 'Maule', 7100, 7),
(7106, 'Pelarco', 7100, 7),
(7107, 'Pencahue', 7100, 7),
(7108, 'Río Claro', 7100, 7),
(7109, 'San Clemente', 7100, 7),
(7110, 'San Rafael', 7100, 7),
(7201, 'Cauquenes', 7200, 7),
(7202, 'Chanco', 7200, 7),
(7203, 'Pelluhue', 7200, 7),
(7301, 'Curicó', 7300, 7),
(7302, 'Hualañé', 7300, 7),
(7303, 'Licantén', 7300, 7),
(7304, 'Molina', 7300, 7),
(7305, 'Rauco', 7300, 7),
(7306, 'Romeral', 7300, 7),
(7307, 'Sagrada Familia', 7300, 7),
(7308, 'Teno', 7300, 7),
(7309, 'Vichuquén', 7300, 7),
(7401, 'Linares', 7400, 7),
(7402, 'Colbún', 7400, 7),
(7403, 'Longaví', 7400, 7),
(7404, 'Parral', 7400, 7),
(7405, 'Retiro', 7400, 7),
(7406, 'San Javier', 7400, 7),
(7407, 'Villa Alegre', 7400, 7),
(7408, 'Yerbas Buenas', 7400, 7),
(8101, 'Concepción', 8100, 8),
(8102, 'Coronel', 8100, 8),
(8103, 'Chiguayante', 8100, 8),
(8104, 'Florida', 8100, 8),
(8105, 'Hualqui', 8100, 8),
(8106, 'Lota', 8100, 8),
(8107, 'Penco', 8100, 8),
(8108, 'San Pedro de La Paz', 8100, 8),
(8109, 'Santa Juana', 8100, 8),
(8110, 'Talcahuano', 8100, 8),
(8111, 'Tomé', 8100, 8),
(8201, 'Lebu', 8200, 8),
(8202, 'Arauco', 8200, 8),
(8203, 'Cañete', 8200, 8),
(8204, 'Contulmo', 8200, 8),
(8205, 'Curanilahue', 8200, 8),
(8206, 'Los Alamos', 8200, 8),
(8207, 'Tirúa', 8200, 8),
(8301, 'Los Angeles', 8300, 8),
(8302, 'Antuco', 8300, 8),
(8303, 'Cabrero', 8300, 8),
(8304, 'Laja', 8300, 8),
(8305, 'Mulchén', 8300, 8),
(8306, 'Nacimiento', 8300, 8),
(8307, 'Negrete', 8300, 8),
(8308, 'Quilaco', 8300, 8),
(8309, 'Quilleco', 8300, 8),
(8310, 'San Rosendo', 8300, 8),
(8311, 'Santa Bárbara', 8300, 8),
(8312, 'Tucapel', 8300, 8),
(8313, 'Yumbel', 8300, 8),
(8401, 'Chillán', 8400, 8),
(8402, 'Bulnes', 8400, 8),
(8403, 'Cobquecura', 8400, 8),
(8404, 'Coelemu', 8400, 8),
(8405, 'Coihueco', 8400, 8),
(8406, 'Chillán Viejo', 8400, 8),
(8407, 'El Carmen', 8400, 8),
(8408, 'Ninhue', 8400, 8),
(8409, 'Ñiquén', 8400, 8),
(8410, 'Pemuco', 8400, 8),
(8411, 'Pinto', 8400, 8),
(8412, 'Portezuelo', 8400, 8),
(8413, 'Quillón', 8400, 8),
(8414, 'Quirihue', 8400, 8),
(8415, 'Ránquil', 8400, 8),
(8416, 'San Carlos', 8400, 8),
(8417, 'San Fabián', 8400, 8),
(8418, 'San Ignacio', 8400, 8),
(8419, 'San Nicolás', 8400, 8),
(8420, 'Treguaco', 8400, 8),
(8421, 'Yungay', 8400, 8),
(9101, 'Temuco', 9100, 9),
(9102, 'Carahue', 9100, 9),
(9103, 'Cunco', 9100, 9),
(9104, 'Curarrehue', 9100, 9),
(9105, 'Freire', 9100, 9),
(9106, 'Galvarino', 9100, 9),
(9107, 'Gorbea', 9100, 9),
(9108, 'Lautaro', 9100, 9),
(9109, 'Loncoche', 9100, 9),
(9110, 'Melipeuco', 9100, 9),
(9111, 'Nueva Imperial', 9100, 9),
(9112, 'Padre las Casas', 9100, 9),
(9113, 'Perquenco', 9100, 9),
(9114, 'Pitrufquén', 9100, 9),
(9115, 'Pucón', 9100, 9),
(9116, 'Saavedra', 9100, 9),
(9117, 'Teodoro Schmidt', 9100, 9),
(9118, 'Toltén', 9100, 9),
(9119, 'Vilcún', 9100, 9),
(9120, 'Villarrica', 9100, 9),
(9201, 'Angol', 9200, 9),
(9202, 'Collipulli', 9200, 9),
(9203, 'Curacautín', 9200, 9),
(9204, 'Ercilla', 9200, 9),
(9205, 'Lonquimay', 9200, 9),
(9206, 'Los Sauces', 9200, 9),
(9207, 'Lumaco', 9200, 9),
(9208, 'Purén', 9200, 9),
(9209, 'Renaico', 9200, 9),
(9210, 'Traiguén', 9200, 9),
(9211, 'Victoria', 9200, 9),
(10101, 'Puerto Montt', 10100, 10),
(10102, 'Calbuco', 10100, 10),
(10103, 'Cochamó', 10100, 10),
(10104, 'Fresia', 10100, 10),
(10105, 'Frutillar', 10100, 10),
(10106, 'Los Muermos', 10100, 10),
(10107, 'Llanquihue', 10100, 10),
(10108, 'Maullín', 10100, 10),
(10109, 'Puerto Varas', 10100, 10),
(10201, 'Castro', 10200, 10),
(10202, 'Ancud', 10200, 10),
(10203, 'Chonchi', 10200, 10),
(10204, 'Curaco de Vélez', 10200, 10),
(10205, 'Dalcahue', 10200, 10),
(10206, 'Puqueldón', 10200, 10),
(10207, 'Queilén', 10200, 10),
(10208, 'Quellón', 10200, 10),
(10209, 'Quemchi', 10200, 10),
(10210, 'Quinchao', 10200, 10),
(10301, 'Osorno', 10300, 10),
(10302, 'Puerto Octay', 10300, 10),
(10303, 'Purranque', 10300, 10),
(10304, 'Puyehue', 10300, 10),
(10305, 'Río Negro', 10300, 10),
(10306, 'San Juan de La Costa', 10300, 10),
(10307, 'San Pablo', 10300, 10),
(10401, 'Chaitén', 10400, 10),
(10402, 'Futaleufú', 10400, 10),
(10403, 'Hualaihué', 10400, 10),
(10404, 'Palena', 10400, 10),
(11101, 'Coihaique', 11100, 11),
(11102, 'Lago Verde', 11100, 11),
(11201, 'Aisén', 11200, 11),
(11202, 'Cisne', 11200, 11),
(11203, 'Guaitecas', 11200, 11),
(11301, 'Cochrane', 11300, 11),
(11302, 'O''Higgins', 11300, 11),
(11303, 'Tortel', 11300, 11),
(11401, 'Chile Chico', 11400, 11),
(11402, 'Río Ibáñez', 11400, 11),
(12101, 'Punta Arenas', 12100, 12),
(12102, 'Laguna Blanca', 12100, 12),
(12103, 'Río Verde', 12100, 12),
(12104, 'San Gregorio', 12100, 12),
(12201, 'Cabo de Horno', 12200, 12),
(12202, 'Antártica', 12200, 12),
(12301, 'Porvenir', 12300, 12),
(12302, 'Primavera', 12300, 12),
(12303, 'Timaukel', 12300, 12),
(12401, 'Natales', 12400, 12),
(12402, 'Torres del Paine', 12400, 12),
(13101, 'Santiago', 13100, 13),
(13102, 'Cerrillos', 13100, 13),
(13103, 'Cerro Navia', 13100, 13),
(13104, 'Conchalí', 13100, 13),
(13105, 'El Bosque', 13100, 13),
(13106, 'Estación Central', 13100, 13),
(13107, 'Huechuraba', 13100, 13),
(13108, 'Independencia', 13100, 13),
(13109, 'La Cisterna', 13100, 13),
(13110, 'La Florida', 13100, 13),
(13111, 'La Granja', 13100, 13),
(13112, 'La Pintana', 13100, 13),
(13113, 'La Reina', 13100, 13),
(13114, 'Las Condes', 13100, 13),
(13115, 'Lo Barnechea', 13100, 13),
(13116, 'Lo Espejo', 13100, 13),
(13117, 'Lo Prado', 13100, 13),
(13118, 'Macul', 13100, 13),
(13119, 'Maipú', 13100, 13),
(13120, 'Ñuñoa', 13100, 13),
(13121, 'Pedro Aguirre Cerda', 13100, 13),
(13122, 'Peñalolén', 13100, 13),
(13123, 'Providencia', 13100, 13),
(13124, 'Pudahuel', 13100, 13),
(13125, 'Quilicura', 13100, 13),
(13126, 'Quinta Normal', 13100, 13),
(13127, 'Recoleta', 13100, 13),
(13128, 'Renca', 13100, 13),
(13129, 'San Joaquín', 13100, 13),
(13130, 'San Miguel', 13100, 13),
(13131, 'San Ramón', 13100, 13),
(13132, 'Vitacura', 13100, 13),
(13201, 'Puente Alto', 13200, 13),
(13202, 'Pirque', 13200, 13),
(13203, 'San José de Maipo', 13200, 13),
(13301, 'Colina', 13300, 13),
(13302, 'Lampa', 13300, 13),
(13303, 'Tiltil', 13300, 13),
(13401, 'San Bernardo', 13400, 13),
(13402, 'Buin', 13400, 13),
(13403, 'Calera de Tango', 13400, 13),
(13404, 'Paine', 13400, 13),
(13501, 'Melipilla', 13500, 13),
(13502, 'Alhué', 13500, 13),
(13503, 'Curacaví', 13500, 13),
(13504, 'María Pinto', 13500, 13),
(13505, 'San Pedro', 13500, 13),
(13601, 'Talagante', 13600, 13),
(13602, 'El Monte', 13600, 13),
(13603, 'Isla de Maipo', 13600, 13),
(13604, 'Padre Hurtado', 13600, 13),
(13605, 'Peñaflor', 13600, 13),
(14101, 'Valdivia', 14100, 14),
(14102, 'Corral', 14100, 14),
(14103, 'Futrono', 14100, 14),
(14104, 'La Unión', 14100, 14),
(14105, 'Lago Ranco', 14100, 14),
(14106, 'Lanco', 14100, 14),
(14107, 'Los Lagos', 14100, 14),
(14108, 'Máfil', 14100, 14),
(14109, 'Mariquina', 14100, 14),
(14110, 'Paillaco', 14100, 14),
(14111, 'Panguipulli', 14100, 14),
(14112, 'Río Bueno', 14100, 14),
(14201, 'La Union', 14200, 14),
(14202, 'Futrono', 14200, 14),
(14203, 'Lago Ranco', 14200, 14),
(14204, 'Rio Bueno', 14200, 14),
(15101, 'Arica', 15100, 15),
(15102, 'Camarones', 15100, 15),
(15201, 'Putre', 15200, 15),
(15202, 'General Lagos', 15200, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dominio`
--

CREATE TABLE IF NOT EXISTS `dominio` (
  `DOM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DOM_COD` varchar(100) DEFAULT NULL,
  `DOM_VAL` int(11) DEFAULT NULL,
  `DOM_EST` int(11) DEFAULT NULL,
  `DOM_TXT_VAL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DOM_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `dominio`
--

INSERT INTO `dominio` (`DOM_ID`, `DOM_COD`, `DOM_VAL`, `DOM_EST`, `DOM_TXT_VAL`) VALUES
(2, 'IDOEST', 12, 1, 'Estado del interesado.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interesado`
--

CREATE TABLE IF NOT EXISTS `interesado` (
  `IDO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDO_EST` int(11) DEFAULT '1',
  `IDO_USR` varchar(80) DEFAULT NULL,
  `IDO_PWD` varchar(20) DEFAULT NULL,
  `IDO_LST_CNX` datetime DEFAULT NULL,
  `IDO_CRN_FEC` datetime DEFAULT NULL,
  PRIMARY KEY (`IDO_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=33 ;

--
-- Volcado de datos para la tabla `interesado`
--

INSERT INTO `interesado` (`IDO_ID`, `IDO_EST`, `IDO_USR`, `IDO_PWD`, `IDO_LST_CNX`, `IDO_CRN_FEC`) VALUES
(1, NULL, '', '', NULL, NULL),
(2, NULL, '', '', NULL, NULL),
(3, NULL, '', '', NULL, NULL),
(4, NULL, '', '', NULL, NULL),
(5, NULL, '', '', NULL, '2013-06-07 07:30:15'),
(6, NULL, '', '', NULL, '2013-06-07 07:32:04'),
(7, NULL, 'ASDASD', 'asdasd', NULL, '2013-06-07 07:32:24'),
(8, NULL, '', '', NULL, '2013-06-07 07:40:14'),
(9, NULL, '', '', NULL, '2013-06-07 07:44:24'),
(10, NULL, '', '', NULL, '2013-06-07 07:45:37'),
(11, NULL, '', '', NULL, '2013-06-07 07:50:05'),
(12, NULL, '', '', NULL, '2013-06-07 07:51:23'),
(13, NULL, '', '', NULL, '2013-06-07 07:53:54'),
(14, NULL, '', '', NULL, '2013-06-07 08:03:46'),
(15, NULL, '', '', NULL, '2013-06-07 08:05:07'),
(16, NULL, '', '', NULL, '2013-06-07 08:10:02'),
(17, NULL, 'asdasd', '', NULL, '2013-06-07 08:10:21'),
(18, NULL, '', '', NULL, '2013-06-07 08:11:20'),
(19, NULL, '', '', NULL, '2013-06-07 08:12:20'),
(20, NULL, '', '', NULL, '2013-06-07 08:27:47'),
(21, NULL, 'asdasd', '', NULL, '2013-06-07 08:28:48'),
(22, NULL, 'asdasd', '', NULL, '2013-06-07 07:36:40'),
(23, NULL, '', '', NULL, '2013-06-07 07:37:00'),
(24, NULL, '', '', NULL, '2013-06-07 07:37:45'),
(25, NULL, '', '', NULL, '2013-06-07 07:40:01'),
(26, NULL, '', '', NULL, '2013-06-07 07:41:10'),
(27, NULL, 'ASDAS', '123129', NULL, '2013-06-07 09:41:39'),
(28, NULL, '', '', NULL, '2013-06-07 09:48:27'),
(29, NULL, '', '', NULL, '2013-06-07 09:49:34'),
(30, NULL, '', '', NULL, '2013-06-07 09:50:07'),
(31, NULL, '', '', NULL, '2013-06-07 09:51:33'),
(32, NULL, '', '', NULL, '2013-06-07 09:52:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE IF NOT EXISTS `marca` (
  `MCA_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MCA_NOM` varchar(100) DEFAULT NULL,
  `MCA_EST` int(11) DEFAULT NULL,
  PRIMARY KEY (`MCA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE IF NOT EXISTS `modelo` (
  `MOD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `MOD_NOM` varchar(150) DEFAULT NULL,
  `MOD_CIL` int(11) DEFAULT NULL,
  `MOD_MOT_TIP` int(11) DEFAULT NULL,
  `MCA_ID` int(11) NOT NULL,
  PRIMARY KEY (`MOD_ID`),
  KEY `FK_MARCA_idx` (`MCA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE IF NOT EXISTS `persona` (
  `PER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PER_NOM` varchar(100) DEFAULT NULL,
  `PER_APE` varchar(255) DEFAULT NULL,
  `PER_RUT` varchar(10) DEFAULT NULL,
  `PER_DV` char(1) DEFAULT NULL,
  `PER_MAIL` varchar(255) DEFAULT NULL,
  `PER_EST` int(11) DEFAULT NULL,
  `PER_TEL1` bigint(20) DEFAULT NULL,
  `PER_TEL2` bigint(20) DEFAULT NULL,
  `COM_ID` int(11) NOT NULL,
  `IDO_ID` int(11) NOT NULL,
  PRIMARY KEY (`PER_ID`),
  KEY `FK_INTERESADO_idx` (`IDO_ID`),
  KEY `FK_COMUNA_idx` (`COM_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`PER_ID`, `PER_NOM`, `PER_APE`, `PER_RUT`, `PER_DV`, `PER_MAIL`, `PER_EST`, `PER_TEL1`, `PER_TEL2`, `COM_ID`, `IDO_ID`) VALUES
(1, 'Francisco', 'Marin', '7415267', '8', '', 1, NULL, NULL, 2301, 7),
(11, 'Kim', 'Chun', '', '', '', 1, NULL, NULL, 1101, 17),
(15, 'Claudio', 'sad', '', '', '', 1, NULL, NULL, 1101, 21),
(16, 'sadasd', '', '', '', '', 1, NULL, NULL, 1101, 22),
(18, '', '', '', '', '', 1, NULL, NULL, 1101, 24),
(19, '', '', '', '', '', 1, NULL, NULL, 1101, 25),
(20, '', '', '', '', '', 1, NULL, NULL, 1101, 26),
(21, 'Orlando', 'Marín', '16711276', '5', 'orlando.marin@outlook.com', 1, 84403785, 123123213, 13105, 27),
(22, '', '', '', '', '', 1, NULL, NULL, 1101, 28),
(23, '', '', '', '', '', 1, NULL, NULL, 1101, 29),
(24, '', '', '', '', '', 1, NULL, NULL, 1101, 30);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_NOM` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`REG_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Volcado de datos para la tabla `region`
--

INSERT INTO `region` (`REG_ID`, `REG_NOM`) VALUES
(1, 'Región de Tarapaca'),
(2, 'Región de Antofagasta'),
(3, 'Región de Atacama'),
(4, 'Región de Coquimbo'),
(5, 'Región de Valparaiso'),
(6, 'Región de O''Higgins'),
(7, 'Región del Maule'),
(8, 'Región del Bio-Bio'),
(9, 'Región de la Araucanía'),
(10, 'Región de los Lagos'),
(11, 'Región de Aysen del General Carlos Ibañez del Campo'),
(12, 'Región de Magallanes y la Antartica Chilena'),
(13, 'Región Metropolitana de Santiago'),
(14, 'Región de los Rios'),
(15, 'Región de Arica y Parinacota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitio`
--

CREATE TABLE IF NOT EXISTS `sitio` (
  `SIT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SIT_NOM` varchar(255) DEFAULT NULL,
  `SIT_DES` text,
  `SIT_IMG_DIR` varchar(255) DEFAULT NULL,
  `SIT_EST` int(11) DEFAULT NULL,
  `IDO_ID` int(11) NOT NULL,
  `SIT_MTO` int(11) DEFAULT NULL,
  `SIT_CRN_FEC` datetime DEFAULT NULL,
  `SIT_VEN_FEC` datetime DEFAULT NULL,
  PRIMARY KEY (`SIT_ID`),
  KEY `FK_INTERESADO_idx` (`IDO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='<double-click to overwrite multiple objects>' AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anuncio`
--
ALTER TABLE `anuncio`
  ADD CONSTRAINT `FK_INTERESADO_ANU` FOREIGN KEY (`IDO_ID`) REFERENCES `interesado` (`IDO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_MODELO_ANU` FOREIGN KEY (`MOD_ID`) REFERENCES `modelo` (`MOD_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `anuncio_sitio`
--
ALTER TABLE `anuncio_sitio`
  ADD CONSTRAINT `FK_ANUNCIO_ANU_SIT` FOREIGN KEY (`ANU_ID`) REFERENCES `anuncio` (`ANU_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SITIO_ANU_SIT` FOREIGN KEY (`SIT_ID`) REFERENCES `sitio` (`SIT_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `automotora`
--
ALTER TABLE `automotora`
  ADD CONSTRAINT `FK_COMUNA_AUT` FOREIGN KEY (`COM_ID`) REFERENCES `comuna` (`COM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_INTERESADO_AUT` FOREIGN KEY (`IDO_ID`) REFERENCES `interesado` (`IDO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `comuna`
--
ALTER TABLE `comuna`
  ADD CONSTRAINT `FK_REGION_COM` FOREIGN KEY (`REG_ID`) REFERENCES `region` (`REG_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `FK_MARCA_MOD` FOREIGN KEY (`MCA_ID`) REFERENCES `marca` (`MCA_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FK_COMUNA_PER` FOREIGN KEY (`COM_ID`) REFERENCES `comuna` (`COM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_INTERESADO_PER` FOREIGN KEY (`IDO_ID`) REFERENCES `interesado` (`IDO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `sitio`
--
ALTER TABLE `sitio`
  ADD CONSTRAINT `FK_INTERESADO_SIT` FOREIGN KEY (`IDO_ID`) REFERENCES `interesado` (`IDO_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
