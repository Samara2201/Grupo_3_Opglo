
CREATE  DATABASE OPGLO2;
USE OPGLO2;
--
-- Base de datos: `opglo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `id_brands` int(11) NOT NULL,
  `brand` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`id_brands`, `brand`) VALUES
(1, 'Casio'),
(2, 'Rolex'),
(3, 'Hublot'),
(4, 'IWC'),
(5, 'Zenith'),
(6, 'Longines'),
(7, 'FOSIL'),
(8, 'MIDO'),
(9, 'INVICTA'),
(10, 'HILFIGER'),
(11, 'TEMPUS'),
(12, 'Otros'),
(13, 'Apple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `car`
--

CREATE TABLE `car` (
  `id_products_car` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_products` int(11) NOT NULL,
  `status_car` varchar(10) NOT NULL,
  `total_car` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `categories` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_categories`, `categories`) VALUES
(1, 'Hombre'),
(2, 'Mujer'),
(3, 'Pared'),
(4, 'Digital'),
(5, 'Otros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colors`
--

CREATE TABLE `colors` (
  `id_colors` int(11) NOT NULL,
  `colors` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `colors`
--

INSERT INTO `colors` (`id_colors`, `colors`) VALUES
(1, 'Negro'),
(2, 'Blanco'),
(3, 'Amarillo'),
(4, 'Azul'),
(5, 'Rojo'),
(6, 'Violeta'),
(7, 'Verde'),
(8, 'Gris'),
(9, 'Rosado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id_products` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `accesories` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` text NOT NULL,
  `visible` tinyint(3) DEFAULT NULL,
  `id_categories` int(11) NOT NULL,
  `id_brands` int(11) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `car` varchar(45) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id_products`, `name`, `price`, `accesories`, `image`, `description`, `visible`, `id_categories`, `id_brands`, `deleted_at`, `car`, `updated_at`, `created_at`) VALUES
(92, 'MIDO - MTP-E350D-7BV', 2000000, 'NINGUNO', '1686676705172_img_.png', 'Reloj MIDO PARA HOMBRE', 1, 1, 8, NULL, 'false', '2023-06-13 17:46:28', '2023-06-13 05:46:28'),
(93, 'FOSIL NEGRO ', 500000, 'NINGUNO', '1686677018409_img_.png', 'RELOJ FOSIL EN CUERO ', 1, 1, 7, NULL, 'false', '2023-06-13 17:23:38', '2023-06-13 05:54:02'),
(94, 'INVICTA- CHRONOGRAM', 700000, 'NINGUNO', '1686677150719_img_.png', 'RELOJ INVICTA- CHRONOGRAM', 1, 1, 9, NULL, 'false', '2023-06-13 17:25:50', '2023-06-13 17:25:50'),
(95, 'HILFIGER', 50000, 'NINGUNO', '1686699829463_img_.png', 'HILFIGER HOMBRE PLATEADO', 1, 1, 10, NULL, 'false', '2023-06-13 23:43:49', '2023-06-13 23:43:49'),
(96, 'TEMPUS', 200000, 'NINGUNO', '1686699920619_img_.png', 'RELOJ TEMPUS MUJER ROSADO', 1, 2, 11, NULL, 'false', '2023-06-13 23:45:20', '2023-06-13 23:45:20'),
(97, 'RELOJ DE PARED', 25000, 'NINGUNO', '1686700002974_img_.png', 'RELOJ DE PARED COLOR  NEGRO', 1, 5, 12, NULL, 'false', '2023-06-13 23:46:42', '2023-06-13 23:46:42'),
(98, 'APPLE WATCH SERIES 5', 1200000, 'NINGUNO', '1686700190978_img_.png', 'APPLE WATCH SERIES 5', 1, 4, 13, NULL, 'false', '2023-06-13 23:49:50', '2023-06-13 23:49:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products_has_colors`
--

CREATE TABLE `products_has_colors` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_products` int(11) NOT NULL,
  `id_colors` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `products_has_colors`
--

INSERT INTO `products_has_colors` (`id`, `id_products`, `id_colors`) VALUES
(89, 92, 8),
(90, 92, 1),
(92, 93, 1),
(93, 94, 1),
(94, 95, 1),
(95, 96, 1),
(96, 97, 1),
(97, 98, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `newsletter` tinyint(3) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_rol` varchar(100) DEFAULT NULL,
  `user_phone` varchar(100) DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_users`, `name`, `lastname`, `email`, `password`, `image`, `newsletter`, `deleted_at`, `created_at`, `updated_at`, `user_rol`, `user_phone`, `user_address`) VALUES
(1, 'Diego Alejandro ', 'NiNo Lozano', 'diegoalejandroninolozano@hotmail.com', '$2a$10$/iWnzQSy8sPPFJ4li0jZqeXGAZcY17WwkaQWcD.OWuNS6TQal8kcu', '1686103072188_img_.jpg', 0, NULL, '2023-06-07 01:57:52', '2023-06-07 01:57:52', 'admin', '3195647855', 'calle '),
(2, 'Allan', ' Romero', 'allanr@gmial.com', '$2a$10$WbnYmtku454DOVPjkdi5BeKRcwNcY6joBJycNZ8qPClC87QKTfhgW', '1686674358947_img_.jpg', 0, NULL, '2023-06-13 16:39:19', '2023-06-13 16:39:19', 'usuario', '319517848', 'Calle 13 # santa fe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id_brands`);

--
-- Indices de la tabla `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`id_products_car`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_products` (`id_products`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`);

--
-- Indices de la tabla `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id_colors`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id_products`),
  ADD KEY `id_categories` (`id_categories`),
  ADD KEY `id_brands` (`id_brands`);

--
-- Indices de la tabla `products_has_colors`
--
ALTER TABLE `products_has_colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_products` (`id_products`),
  ADD KEY `id_colors` (`id_colors`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `id_brands` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `car`
--
ALTER TABLE `car`
  MODIFY `id_products_car` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `colors`
--
ALTER TABLE `colors`
  MODIFY `id_colors` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id_products` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT de la tabla `products_has_colors`
--
ALTER TABLE `products_has_colors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id_users`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`id_products`) REFERENCES `products` (`id_products`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id_categories`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_brands`) REFERENCES `brands` (`id_brands`);

--
-- Filtros para la tabla `products_has_colors`
--
ALTER TABLE `products_has_colors`
  ADD CONSTRAINT `products_has_colors_ibfk_1` FOREIGN KEY (`id_products`) REFERENCES `products` (`id_products`),
  ADD CONSTRAINT `products_has_colors_ibfk_2` FOREIGN KEY (`id_colors`) REFERENCES `colors` (`id_colors`);


