DROP DATABASE IF EXISTS StockFlow;
CREATE DATABASE StockFlow;
USE StockFlow;

-- DDL --
-- USUARIOS --
CREATE TABLE usuarios (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre_usuario VARCHAR(32) UNIQUE,
    dni INT UNIQUE,
    nombre VARCHAR(64),
    apellido VARCHAR(64),
    razon_social VARCHAR(64),
    cuit VARCHAR(64) UNIQUE,
    eslogan VARCHAR(64),
    telefono VARCHAR(64),
    email VARCHAR(96) UNIQUE,
    direccion VARCHAR(96),
    barrio VARCHAR(96),
    provincia VARCHAR(96),
    contraseña VARCHAR(256)
);


-- AUXILIARES PRODUCTOS --
CREATE TABLE categorias (
    id_categoria INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64),
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE marcas (
    id_marca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64),
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE colores (
    id_color INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64),
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE paises (
    id_pais INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    iso CHAR(2),
	nombre VARCHAR(96)
);

CREATE TABLE unidades_peso (
    id_unidad_peso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64)
);

CREATE TABLE unidades_longitud (
    id_unidad_longitud INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64)
);

CREATE TABLE imagenes_productos (
    id_imagen_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(32),
	nombre VARCHAR(128),
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- PRODUCTOS -- 
CREATE TABLE productos (
	id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_imagen_producto INT,
    nombre VARCHAR(96),
    id_categoria INT,
    modelo VARCHAR(96),
    id_marca INT,
    id_color INT,
    id_pais INT,
    caracteristicas VARCHAR(256),
    peso INT,
    id_unidad_peso INT,
    alto INT,
    ancho INT,
    profundidad INT,
    id_unidad_longitud INT,
    garantia INT,
    stock INT,
    precio_actual DECIMAL(16, 2),
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
	FOREIGN KEY (id_imagen_producto) REFERENCES imagenes_productos(id_imagen_producto),
    FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
	FOREIGN KEY (id_marca) REFERENCES marcas(id_marca),
	FOREIGN KEY (id_color) REFERENCES colores(id_color),
	FOREIGN KEY (id_pais) REFERENCES paises(id_pais),
	FOREIGN KEY (id_unidad_peso) REFERENCES unidades_peso(id_unidad_peso),
	FOREIGN KEY (id_unidad_longitud) REFERENCES unidades_longitud(id_unidad_longitud)
);


-- AUXILIARES FACTURAS -- 
CREATE TABLE tipos_transaccion (
    id_tipo_transaccion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64)
); 

CREATE TABLE metodos_pago (
    id_metodo_pago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64)
);

-- PROVEEDORES Y CLIENTES --
CREATE TABLE proveedores (
    id_proveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	razon_social VARCHAR(64),
    cuit VARCHAR(64) UNIQUE,
    direccion VARCHAR(96),
    barrio VARCHAR(96),
    provincia VARCHAR(96),
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dni INT UNIQUE,
    nombre VARCHAR(64),
    apellido VARCHAR (64),
	razon_social VARCHAR(64),
    cuit VARCHAR(64) UNIQUE,
    telefono VARCHAR(64),
    email VARCHAR(64),
    direccion VARCHAR(96),
    barrio VARCHAR(96),
    provincia VARCHAR(96),
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- CONTACTOS --
CREATE TABLE tipos_contacto (
    id_tipo_contacto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	descripcion VARCHAR(64)
);

CREATE TABLE contactos (
    id_contacto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_proveedor INT NOT NULL,
    contacto VARCHAR(64),
    id_tipo_contacto INT NOT NULL,
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_tipo_contacto) REFERENCES tipos_contacto(id_tipo_contacto)
);

-- FACTURAS --
CREATE TABLE  facturas(
    nro_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    hora TIME,
    id_tipo_transaccion INT NOT NULL,
    id_proveedor INT,
    id_cliente INT,
    descuento INT,
    id_metodo_pago INT,
    id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_tipo_transaccion) REFERENCES tipos_transaccion(id_tipo_transaccion),
    FOREIGN KEY (id_proveedor) REFERENCES proveedores(id_proveedor),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_metodo_pago) REFERENCES metodos_pago(id_metodo_pago)
);

CREATE TABLE detalles_facturas(
	nro_detalle_factura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nro_factura INT NOT NULL,
    id_producto INT,
    precio DECIMAL(16, 2),
    cantidad INT,
	id_usuario INT NOT NULL,
    
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (nro_factura) REFERENCES facturas(nro_factura),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

-- DDL --
INSERT INTO unidades_peso (descripcion)
VALUES 
("Miligramos"),
("Centigramos"),
("Decigramos"),
("Gramos"),
("Decagramos"),
("Hectogramos"),
("Kilogramos");

INSERT INTO unidades_longitud (descripcion)
VALUES 
("Milimetros"),
("Centimetros"),
("Decimetros"),
("Metros"),
("Decametros"),
("Hectometros"),
("Kilometros");

INSERT INTO paises 
VALUES
(1, "AF", "Afganistán"),
(2, "AX", "Islas Gland"),
(3, "AL", "Albania"),
(4, "DE", "Alemania"),
(5, "AD", "Andorra"),
(6, "AO", "Angola"),
(7, "AI", "Anguilla"),
(8, "AQ", "Antártida"),
(9, "AG", "Antigua y Barbuda"),
(10, "AN", "Antillas Holandesas"),
(11, "SA", "Arabia Saudí"),
(12, "DZ", "Argelia"),
(13, "AR", "Argentina"),
(14, "AM", "Armenia"),
(15, "AW", "Aruba"),
(16, "AU", "Australia"),
(17, "AT", "Austria"),
(18, "AZ", "Azerbaiyán"),
(19, "BS", "Bahamas"),
(20, "BH", "Bahréin"),
(21, "BD", "Bangladesh"),
(22, "BB", "Barbados"),
(23, "BY", "Bielorrusia"),
(24, "BE", "Bélgica"),
(25, "BZ", "Belice"),
(26, "BJ", "Benin"),
(27, "BM", "Bermudas"),
(28, "BT", "Bhután"),
(29, "BO", "Bolivia"),
(30, "BA", "Bosnia y Herzegovina"),
(31, "BW", "Botsuana"),
(32, "BV", "Isla Bouvet"),
(33, "BR", "Brasil"),
(34, "BN", "Brunéi"),
(35, "BG", "Bulgaria"),
(36, "BF", "Burkina Faso"),
(37, "BI", "Burundi"),
(38, "CV", "Cabo Verde"),
(39, "KY", "Islas Caimán"),
(40, "KH", "Camboya"),
(41, "CM", "Camerún"),
(42, "CA", "Canadá"),
(43, "CF", "República Centroafricana"),
(44, "TD", "Chad"),
(45, "CZ", "República Checa"),
(46, "CL", "Chile"),
(47, "CN", "China"),
(48, "CY", "Chipre"),
(49, "CX", "Isla de Navidad"),
(50, "VA", "Ciudad del Vaticano"),
(51, "CC", "Islas Cocos"),
(52, "CO", "Colombia"),
(53, "KM", "Comoras"),
(54, "CD", "República Democrática del Congo"),
(55, "CG", "Congo"),
(56, "CK", "Islas Cook"),
(57, "KP", "Corea del Norte"),
(58, "KR", "Corea del Sur"),
(59, "CI", "Costa de Marfil"),
(60, "CR", "Costa Rica"),
(61, "HR", "Croacia"),
(62, "CU", "Cuba"),
(63, "DK", "Dinamarca"),
(64, "DM", "Dominica"),
(65, "DO", "República Dominicana"),
(66, "EC", "Ecuador"),
(67, "EG", "Egipto"),
(68, "SV", "El Salvador"),
(69, "AE", "Emiratos Árabes Unidos"),
(70, "ER", "Eritrea"),
(71, "SK", "Eslovaquia"),
(72, "SI", "Eslovenia"),
(73, "ES", "España"),
(74, "UM", "Islas ultramarinas de Estados Unidos"),
(75, "US", "Estados Unidos"),
(76, "EE", "Estonia"),
(77, "ET", "Etiopía"),
(78, "FO", "Islas Feroe"),
(79, "PH", "Filipinas"),
(80, "FI", "Finlandia"),
(81, "FJ", "Fiyi"),
(82, "FR", "Francia"),
(83, "GA", "Gabón"),
(84, "GM", "Gambia"),
(85, "GE", "Georgia"),
(86, "GS", "Islas Georgias del Sur y Sandwich del Sur"),
(87, "GH", "Ghana"),
(88, "GI", "Gibraltar"),
(89, "GD", "Granada"),
(90, "GR", "Grecia"),
(91, "GL", "Groenlandia"),
(92, "GP", "Guadalupe"),
(93, "GU", "Guam"),
(94, "GT", "Guatemala"),
(95, "GF", "Guayana Francesa"),
(96, "GN", "Guinea"),
(97, "GQ", "Guinea Ecuatorial"),
(98, "GW", "Guinea-Bissau"),
(99, "GY", "Guyana"),
(100, "HT", "Haití"),
(101, "HM", "Islas Heard y McDonald"),
(102, "HN", "Honduras"),
(103, "HK", "Hong Kong"),
(104, "HU", "Hungría"),
(105, "IN", "India"),
(106, "ID", "Indonesia"),
(107, "IR", "Irán"),
(108, "IQ", "Iraq"),
(109, "IE", "Irlanda"),
(110, "IS", "Islandia"),
(111, "IL", "Israel"),
(112, "IT", "Italia"),
(113, "JM", "Jamaica"),
(114, "JP", "Japón"),
(115, "JO", "Jordania"),
(116, "KZ", "Kazajstán"),
(117, "KE", "Kenia"),
(118, "KG", "Kirguistán"),
(119, "KI", "Kiribati"),
(120, "KW", "Kuwait"),
(121, "LA", "Laos"),
(122, "LS", "Lesotho"),
(123, "LV", "Letonia"),
(124, "LB", "Líbano"),
(125, "LR", "Liberia"),
(126, "LY", "Libia"),
(127, "LI", "Liechtenstein"),
(128, "LT", "Lituania"),
(129, "LU", "Luxemburgo"),
(130, "MO", "Macao"),
(131, "MK", "ARY Macedonia"),
(132, "MG", "Madagascar"),
(133, "MY", "Malasia"),
(134, "MW", "Malawi"),
(135, "MV", "Maldivas"),
(136, "ML", "Malí"),
(137, "MT", "Malta"),
(138, "FK", "Islas Malvinas"),
(139, "MP", "Islas Marianas del Norte"),
(140, "MA", "Marruecos"),
(141, "MH", "Islas Marshall"),
(142, "MQ", "Martinica"),
(143, "MU", "Mauricio"),
(144, "MR", "Mauritania"),
(145, "YT", "Mayotte"),
(146, "MX", "México"),
(147, "FM", "Micronesia"),
(148, "MD", "Moldavia"),
(149, "MC", "Mónaco"),
(150, "MN", "Mongolia"),
(151, "MS", "Montserrat"),
(152, "MZ", "Mozambique"),
(153, "MM", "Myanmar"),
(154, "NA", "Namibia"),
(155, "NR", "Nauru"),
(156, "NP", "Nepal"),
(157, "NI", "Nicaragua"),
(158, "NE", "Níger"),
(159, "NG", "Nigeria"),
(160, "NU", "Niue"),
(161, "NF", "Isla Norfolk"),
(162, "NO", "Noruega"),
(163, "NC", "Nueva Caledonia"),
(164, "NZ", "Nueva Zelanda"),
(165, "OM", "Omán"),
(166, "NL", "Países Bajos"),
(167, "PK", "Pakistán"),
(168, "PW", "Palau"),
(169, "PS", "Palestina"),
(170, "PA", "Panamá"),
(171, "PG", "Papúa Nueva Guinea"),
(172, "PY", "Paraguay"),
(173, "PE", "Perú"),
(174, "PN", "Islas Pitcairn"),
(175, "PF", "Polinesia Francesa"),
(176, "PL", "Polonia"),
(177, "PT", "Portugal"),
(178, "PR", "Puerto Rico"),
(179, "QA", "Qatar"),
(180, "GB", "Reino Unido"),
(181, "RE", "Reunión"),
(182, "RW", "Ruanda"),
(183, "RO", "Rumania"),
(184, "RU", "Rusia"),
(185, "EH", "Sahara Occidental"),
(186, "SB", "Islas Salomón"),
(187, "WS", "Samoa"),
(188, "AS", "Samoa Americana"),
(189, "KN", "San Cristóbal y Nevis"),
(190, "SM", "San Marino"),
(191, "PM", "San Pedro y Miquelón"),
(192, "VC", "San Vicente y las Granadinas"),
(193, "SH", "Santa Helena"),
(194, "LC", "Santa Lucía"),
(195, "ST", "Santo Tomé y Príncipe"),
(196, "SN", "Senegal"),
(197, "CS", "Serbia y Montenegro"),
(198, "SC", "Seychelles"),
(199, "SL", "Sierra Leona"),
(200, "SG", "Singapur"),
(201, "SY", "Siria"),
(202, "SO", "Somalia"),
(203, "LK", "Sri Lanka"),
(204, "SZ", "Suazilandia"),
(205, "ZA", "Sudáfrica"),
(206, "SD", "Sudán"),
(207, "SE", "Suecia"),
(208, "CH", "Suiza"),
(209, "SR", "Surinam"),
(210, "SJ", "Svalbard y Jan Mayen"),
(211, "TH", "Tailandia"),
(212, "TW", "Taiwán"),
(213, "TZ", "Tanzania"),
(214, "TJ", "Tayikistán"),
(215, "IO", "Territorio Británico del Océano Índico"),
(216, "TF", "Territorios Australes Franceses"),
(217, "TL", "Timor Oriental"),
(218, "TG", "Togo"),
(219, "TK", "Tokelau"),
(220, "TO", "Tonga"),
(221, "TT", "Trinidad y Tobago"),
(222, "TN", "Túnez"),
(223, "TC", "Islas Turcas y Caicos"),
(224, "TM", "Turkmenistán"),
(225, "TR", "Turquía"),
(226, "TV", "Tuvalu"),
(227, "UA", "Ucrania"),
(228, "UG", "Uganda"),
(229, "UY", "Uruguay"),
(230, "UZ", "Uzbekistán"),
(231, "VU", "Vanuatu"),
(232, "VE", "Venezuela"),
(233, "VN", "Vietnam"),
(234, "VG", "Islas Vírgenes Británicas"),
(235, "VI", "Islas Vírgenes de los Estados Unidos"),
(236, "WF", "Wallis y Futuna"),
(237, "YE", "Yemen"),
(238, "DJ", "Yibuti"),
(239, "ZM", "Zambia"),
(240, "ZW", "Zimbabue");