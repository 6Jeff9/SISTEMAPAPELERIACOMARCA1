-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2022 a las 13:48:02
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `comarca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idAdmin` int(11) NOT NULL,
  `tipoIdentificacionA` varchar(10) COLLATE latin1_general_ci NOT NULL,
  `numIdentificacionA` int(11) NOT NULL,
  `nombreAdmin` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `correoAdmin` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `telefonoAdmin` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `direccionAdmin` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `contraseñaAdmin` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdmin`, `tipoIdentificacionA`, `numIdentificacionA`, `nombreAdmin`, `correoAdmin`, `telefonoAdmin`, `direccionAdmin`, `contraseñaAdmin`) VALUES
(3, 'cc', 126554778, 'Tartaro', 'jos@gmail.com', '322547789', 'calle 6 sur', '12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL,
  `categoria` varchar(50) CHARACTER SET latin1 NOT NULL,
  `idProductos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`idCategoria`, `categoria`, `idProductos`) VALUES
(1, 'Perfumeria', 3),
(2, 'Belleza', 2),
(3, 'Electrodomestico', 1),
(4, 'Aseo', 12),
(5, 'Papeleria', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL COMMENT 'esta es la forma de al identificar del cliente en la tabla',
  `tipoIdentificacion` varchar(10) CHARACTER SET utf8mb4 NOT NULL COMMENT 'el tipo de la identificacion del cliente',
  `numIdentificacionC` int(11) NOT NULL COMMENT 'el numero de la identificacion del cliente',
  `nombreCliente` varchar(200) CHARACTER SET utf8mb4 NOT NULL COMMENT 'este el nombre completo del cliente',
  `correoCliente` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT 'el correo del cliente',
  `telefonoCliente` varchar(13) CHARACTER SET utf8mb4 NOT NULL COMMENT 'el telefono del cliente',
  `direccionCliente` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT 'esta es la direccion del cliente',
  `contraseñaCliente` varchar(20) CHARACTER SET utf8mb4 NOT NULL COMMENT 'la contraseña del cliente '
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `tipoIdentificacion`, `numIdentificacionC`, `nombreCliente`, `correoCliente`, `telefonoCliente`, `direccionCliente`, `contraseñaCliente`) VALUES
(1, 'CE', 123, 'tom', 'c@gafg', '1334', 'fr', '213'),
(2, 'CC', 533848558, 'Antonio', 'antoni@gmail.com', '3625548', 'calle 6 sur', '34anto'),
(3, 'CE', 52444786, 'Anabel', 'anab@gmail.com', '362225478', 'Kr 56', 'ana34'),
(4, 'PS', 625548258, 'Hernesto', 'hernes@gmail.com', '36225484', 'Transversal 45', 'hernes455'),
(5, 'CC', 522447584, 'Diana', 'Dian@gmail.com', '3225478978|', 'calle 56 ', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idCompra` int(11) NOT NULL,
  `fechaCompra` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idProductos` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL,
  `numeroFact` float NOT NULL,
  `numeroPed` float NOT NULL,
  `fechaCre` date NOT NULL,
  `fechaVen` date NOT NULL,
  `idCategoria` int(11) NOT NULL,
  `idProductos` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `numeroFact`, `numeroPed`, `fechaCre`, `fechaVen`, `idCategoria`, `idProductos`, `idCliente`, `idAdmin`, `idCompra`) VALUES
(6, 55151, 234346, '2022-02-01', '2022-09-09', 1, 3, 1, 3, 0),
(7, 1654, 51541, '2022-05-17', '2022-07-14', 2, 2, 2, 3, 0),
(8, 25451, 2687, '2022-06-01', '2022-06-30', 3, 1, 3, 3, 0),
(9, 3567340, 3345460, '2022-04-10', '2022-06-30', 4, 12, 4, 3, 0),
(10, 541564, 651561, '2021-06-14', '2023-02-21', 5, 11, 5, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL COMMENT ' Esta es la identificacion de l producto',
  `nombreProducto` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'este es el nombre del producto',
  `descripcionProducto` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cantidadProductos` int(11) NOT NULL,
  `precioVenta` int(11) NOT NULL COMMENT 'este es el precio de la venta a los clientes ',
  `precioCompra` int(11) NOT NULL COMMENT 'estes es el precio al que se compro el producto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='estos son los productos ';

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProductos`, `nombreProducto`, `descripcionProducto`, `cantidadProductos`, `precioVenta`, `precioCompra`) VALUES
(1, 'Celular', 'Iphone', 4, 1000000, 4000000),
(2, 'Collar', 'Perla', 2, 200000, 400000),
(3, 'Perfume', 'Hombre', 3, 330000, 660000),
(10, 'tygv', 'y gfbv', 123, 1232, 4343),
(11, 'tygv', 'y gfbv', 123, 1232, 4343),
(12, 'Sombrilla', 'Color negro', 4, 2000, 6000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdmin`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`idCategoria`),
  ADD KEY `idProductos` (`idProductos`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idProductos` (`idProductos`),
  ADD KEY `idAdmin` (`idAdmin`),
  ADD KEY `idFactura` (`idFactura`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`),
  ADD KEY `idProductos` (`idProductos`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idCategoria` (`idCategoria`),
  ADD KEY `idAdmin` (`idAdmin`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'esta es la forma de al identificar del cliente en la tabla', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT COMMENT ' Esta es la identificacion de l producto', AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`),
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idAdmin`),
  ADD CONSTRAINT `compra_ibfk_4` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idProductos`) REFERENCES `productos` (`idProductos`),
  ADD CONSTRAINT `factura_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `factura_ibfk_3` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  ADD CONSTRAINT `factura_ibfk_4` FOREIGN KEY (`idAdmin`) REFERENCES `administrador` (`idAdmin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
