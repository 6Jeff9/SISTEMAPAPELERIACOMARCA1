-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2022 a las 07:30:15
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

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
  `passAdmin` varchar(50) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`idAdmin`, `tipoIdentificacionA`, `numIdentificacionA`, `nombreAdmin`, `correoAdmin`, `telefonoAdmin`, `direccionAdmin`, `passAdmin`) VALUES
(1, 'CC', 1025877788, 'Maicol', 'mai@gmail.com', '544151', 'carrera 4', '$2y$10$qFGWyqOhNTpQR.1gE.6uIuOYmSakzf2AUhrCipPq4vE');

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
  `contraseñaCliente` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT 'la contraseña del cliente ',
  `usuarioCliente` varchar(255) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `tipoIdentificacion`, `numIdentificacionC`, `nombreCliente`, `correoCliente`, `telefonoCliente`, `direccionCliente`, `contraseñaCliente`, `usuarioCliente`) VALUES
(13, 'T.I', 1061697131, 'Jeffrey Ceron', 'ceronarandia@gmail.com', '3228492068', 'call 65 sur N77 M04', '$2y$10$QHNv16lf2wAGRI1kWNsR1.6.1VT5gjVTR3UXeKKgvO/CYEhbijSZ2', 'Jeffer126'),
(14, 'C.C', 54822585, 'Juanito Fonseca', 'fonseca@gmail.com', '3214594862', 'call 65 sur N87 M05', '$2y$10$lTk5QzyDGsrrdVco3cAFL.K6XM.k8IuGhKphKMRERdLYGdf4JgYyO', 'Juanito'),
(15, 'C.C', 2489546, 'Carlitos Lucresio', 'carlitos1@gmail.com', '3214854862', 'call 78 Norte N77 M04', '$2y$10$OIbMuRJj0n6MYGmMctuLGOMYrH7gADS/KEYv.6i7Jhr8E7mitNmli', 'Carlitos16');

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

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`idCompra`, `fechaCompra`, `idCliente`, `idProductos`, `idAdmin`, `idFactura`) VALUES
(1, '2022-06-01', 1, 3, 11, 6),
(2, '2022-06-02', 2, 14, 11, 7),
(3, '2022-06-03', 3, 3, 11, 8),
(4, '2022-06-04', 4, 3, 11, 9),
(5, '2022-06-15', 5, 14, 11, 10);

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
  `idCliente` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`idFactura`, `numeroFact`, `numeroPed`, `fechaCre`, `fechaVen`, `idCliente`, `idAdmin`, `idCompra`) VALUES
(6, 55151, 234346, '2022-02-01', '2022-09-09', 1, 3, 0),
(7, 1654, 51541, '2022-05-17', '2022-07-14', 2, 3, 0),
(8, 25451, 2687, '2022-06-01', '2022-06-30', 3, 3, 0),
(9, 3567340, 3345460, '2022-04-10', '2022-06-30', 4, 3, 0),
(10, 541564, 651561, '2021-06-14', '2023-02-21', 5, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL COMMENT ' Esta es la identificacion de l producto',
  `categoriaProducto` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nombreProducto` varchar(50) CHARACTER SET latin1 NOT NULL COMMENT 'este es el nombre del producto',
  `descripcionProducto` varchar(50) CHARACTER SET latin1 NOT NULL,
  `cantidadProductos` int(11) NOT NULL,
  `precioVenta` varchar(11) COLLATE latin1_general_ci NOT NULL COMMENT 'este es el precio de la venta a los clientes ',
  `precioCompra` varchar(25) COLLATE latin1_general_ci NOT NULL COMMENT 'estes es el precio al que se compro el producto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci COMMENT='estos son los productos ';

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProductos`, `categoriaProducto`, `nombreProducto`, `descripcionProducto`, `cantidadProductos`, `precioVenta`, `precioCompra`) VALUES
(1, 'VARIEDAD', 'Betun en pasta/crema', 'Betun para zapatos de cuero', 55, '5.000', '4.000'),
(2, 'VARIEDAD', 'Bloqueador Solar', 'Bloqueador para el cuerpo', 100, '10.000', '5.000'),
(3, 'UTILES ESCOLARES', 'Bombas R-9', 'Bombas para fiestas', 80, '2000', '1400'),
(4, 'VARIEDAD', 'Desodorantes (Balance Hombre/Mujer) en gel', 'Desodorante para axilas', 50, '5.000', '4.000'),
(25, 'UTILES ESCOLARES', 'Escarapela', 'Juguete', 20, '2.500', '1.500'),
(26, 'VARIEDAD', 'Jabon de baño (Marca avon y jhonson)', 'Jabon de baño', 20, '5.000', '4.000'),
(27, 'UTILES ESCOLARES', 'Sobres', 'Sobres para lluvia de sobre o cartas', 30, '7.000', '6.000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idAdmin`);

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
  ADD KEY `idCliente` (`idCliente`),
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
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'esta es la forma de al identificar del cliente en la tabla', AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT COMMENT ' Esta es la identificacion de l producto', AUTO_INCREMENT=28;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
