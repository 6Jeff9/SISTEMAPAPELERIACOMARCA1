-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-05-2022 a las 01:05:50
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
(3, 'cc', 126554778, 'Tartaro', 'jos@gmail.com', '322547789', 'calle 6 sur', '12'),
(5, 'PS', 522699787, 'Manuela', 'manu@gmail.com', '325455555', 'Av calle 56 N', '54321');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `idCateoria` int(11) NOT NULL,
  `categoria` varchar(50) CHARACTER SET latin1 NOT NULL,
  `idProductos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
(1, 'CE', 123, 'tom', 'c@gafg', '1334', 'fr', '213');

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
  `idAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

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
  ADD PRIMARY KEY (`idCateoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`idFactura`);

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
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `idCateoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'esta es la forma de al identificar del cliente en la tabla', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT COMMENT ' Esta es la identificacion de l producto', AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
