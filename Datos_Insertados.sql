-- Secuencia para los IDs de Clientes
CREATE SEQUENCE Seq_Clientes
    START WITH 1
    INCREMENT BY 1;

-- Secuencia para los IDs de Productos
CREATE SEQUENCE Seq_Productos
    START WITH 1
    INCREMENT BY 1;

-- Secuencia para los IDs de Pedidos
CREATE SEQUENCE Seq_Pedidos
    START WITH 1
    INCREMENT BY 1;

-- Secuencia para los IDs de DetalleVenta
CREATE SEQUENCE Seq_DetalleVenta
    START WITH 1
    INCREMENT BY 1;

-- Secuencia para los IDs de Pagos
CREATE SEQUENCE Seq_Pagos
    START WITH 1
    INCREMENT BY 1;

-- Tabla de Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq_Clientes), -- Usar la secuencia
    Nombre VARCHAR(100) NOT NULL,
    CorreoElectronico VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(20) NULL,
    FechaRegistro DATETIME DEFAULT GETDATE()
);

-- Tabla de Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq_Productos), -- Usar la secuencia
    NombreProducto VARCHAR(100) NOT NULL,
    Descripcion TEXT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL CHECK (Stock >= 0)
);

-- Tabla de Pedidos
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq_Pedidos), -- Usar la secuencia
    ClienteID INT NOT NULL,
    FechaPedido DATETIME DEFAULT GETDATE(),
    Estado VARCHAR(50) CHECK (Estado IN ('Pendiente', 'Completado', 'Cancelado')),
    Total DECIMAL(10,2) NOT NULL CHECK (Total >= 0),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID) ON DELETE CASCADE
);

-- Tabla de DetalleVenta
CREATE TABLE DetalleVenta (
    DetalleID INT PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq_DetalleVenta), -- Usar la secuencia
    PedidoID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL CHECK (Cantidad > 0),
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID) ON DELETE CASCADE,
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID) ON DELETE CASCADE
);

-- Tabla de Pagos
CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq_Pagos), -- Usar la secuencia
    PedidoID INT NOT NULL,
    Monto DECIMAL(10,2) NOT NULL CHECK (Monto >= 0),
    MetodoPago VARCHAR(50) CHECK (MetodoPago IN ('Tarjeta', 'Efectivo', 'Transferencia')),
    FechaPago DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID) ON DELETE CASCADE
);

SELECT *  FROM clientes 
SELECT *  FROM Productos
SELECT *  FROM Pedidos
SELECT *  FROM DetalleVenta 
SELECT *  FROM Pagos

-- TOTAL DE DATOS:
-- Tabla Clientes: 233
-- Tabla Productos: 183
-- Tabla Pedidos: 233
-- Tabla DetalleVenta: 236 
-- Tabla Pagos: 230

-- Tabla Cliente
INSERT INTO Clientes (Nombre, CorreoElectronico, Telefono) -- 233 Clientes Nuevos
VALUES 
('Juan Pérez', 'juan.perez1@email.com', '78945612'),
('María López', 'maria.lopez1@email.com', '76543218'),
('Carlos Ramírez', 'carlos.ramirez1@email.com', '71234567'),
('Ana Torres', 'ana.torres@email.com', '78451236'),
('Luis Gómez', 'luis.gomez@email.com', '79012345'),
('Sofía Méndez', 'sofia.mendez@email.com', '75841236'),
('Ricardo Díaz', 'ricardo.diaz@email.com', '72345678'),
('Laura Castillo', 'laura.castillo@email.com', '79874512'),
('Pedro Suárez', 'pedro.suarez@email.com', '76983214'),
('Andrea Vargas', 'andrea.vargas@email.com', '75849612'),
('Fernando Ríos', 'fernando.rios@email.com', '71236478'),
('Gabriela Ortiz', 'gabriela.ortiz@email.com', '76451238'),
('Manuel Herrera', 'manuel.herrera@email.com', '79345678'),
('Elena Paredes', 'elena.paredes@email.com', '78459631'),
('Cristian Chávez', 'cristian.chavez@email.com', '78912346'),
('Rosa Fernández', 'rosa.fernandez@email.com', '79874512'),
('Diego Castro', 'diego.castro@email.com', '79563214'),
('Patricia Molina', 'patricia.molina@email.com', '76543278'),
('Francisco León', 'francisco.leon@email.com', '71984567'),
('Diana Salazar', 'diana.salazar@email.com', '75846912'),
('José Méndez', 'jose.mendez@email.com', '79234567'),
('Verónica Guzmán', 'veronica.guzman@email.com', '76985412'),
('Antonio Ramírez', 'antonio.ramirez@email.com', '78456123'),
('Mariela Soto', 'mariela.soto@email.com', '75896412'),
('Esteban Lara', 'esteban.lara@email.com', '71345698'),
('Natalia Ruiz', 'natalia.ruiz@email.com', '76984532'),
('Hugo Espinoza', 'hugo.espinoza@email.com', '79861234'),
('Claudia Romero', 'claudia.romero@email.com', '75846219'),
('Sebastián Flores', 'sebastian.flores@email.com', '76984567'),
('Lucía Cárdenas', 'lucia.cardenas@email.com', '75981236'),
('Adrián Gil', 'adrian.gil@email.com', '78456321'),
('Camila Serrano', 'camila.serrano@email.com', '76549812'),
('José Muñoz', 'jose.munoz@email.com', '79234856'),
('Isabel Medina', 'isabel.medina@email.com', '75983124'),
('Miguel Vásquez', 'miguel.vasquez@email.com', '71456982'),
('Valeria Jiménez', 'valeria.jimenez@email.com', '76985431'),
('David Peña', 'david.pena@email.com', '79564321'),
('Daniela Sánchez', 'daniela.sanchez@email.com', '71894563'),
('Javier Pérez', 'javier.perez@email.com', '76549832'),
('Paola Flores', 'paola.flores@email.com', '78913254'),
('Alejandro Morales', 'alejandro.morales@email.com', '78459613'),
('Lucía Torres', 'lucia.torres@email.com', '75986431'),
('Santiago Reyes', 'santiago.reyes@email.com', '71458936'),
('Fernanda Álvarez', 'fernanda.alvarez@email.com', '76548912'),
('Roberto Vega', 'roberto.vega@email.com', '79234568'),
('Mariana Castro', 'mariana.castro@email.com', '75984312'),
('Iván Guerrero', 'ivan.guerrero@email.com', '71459326'),
('Daniela Espinoza', 'daniela.espinoza@email.com', '76984521'),
('Juan Carlos Gómez', 'juan.carlosgomez@email.com', '79564231'),
('Sofía Rojas', 'sofia.rojas@email.com', '71895463'),
('Andrés Ramos', 'andres.ramos@email.com', '76549841'),
('María Teresa López', 'maria.lopez2@email.com', '78913265'),
('Leonardo Silva', 'leonardo.silva@email.com', '78459624'),
('Claudia Martínez', 'claudia.martinez@email.com', '75986452'),
('Felipe Herrera', 'felipe.herrera@email.com', '71458947'),
('Laura Díaz', 'laura.diaz@email.com', '76548923'),
('Ricardo García', 'ricardo.garcia@email.com', '79234579'),
('Patricia Paredes', 'patricia.paredes@email.com', '75984323'),
('Hugo Moreno', 'hugo.moreno@email.com', '71459337'),
('Verónica Ortiz', 'veronica.ortiz@email.com', '76984532'),
('Esteban López', 'esteban.lopez@email.com', '79564242'),
('Gabriela Chávez', 'gabriela.chavez@email.com', '71895474'),
('Luis Alberto Soto', 'luis.soto@email.com', '76549852'),
('Elena Campos', 'elena.campos@email.com', '78913276'),
('Francisco Vargas', 'francisco.vargas@email.com', '78459635'),
('Cristina Mendoza', 'cristina.mendoza@email.com', '75986463'),
('Mario Jiménez', 'mario.jimenez@email.com', '71458958'),
('Natalia Fernández', 'natalia.fernandez@email.com', '76548934'),
('Ángel Castillo', 'angel.castillo@email.com', '79234581'),
('Diana Ruiz', 'diana.ruiz@email.com', '75984334'),
('Sergio Romero', 'sergio.romero@email.com', '71459348'),
('Tatiana Gutiérrez', 'tatiana.gutierrez@email.com', '76984543'),
('Jorge Molina', 'jorge.molina@email.com', '79564253'),
('Inés Tapia', 'ines.tapia@email.com', '71895485'),
('Lucas Mejía', 'lucas.mejia@email.com', '76549863'),
('Marta Ramírez', 'marta.ramirez@email.com', '78913287'),
('Pablo Cabrera', 'pablo.cabrera@email.com', '78459646'),
('Susana Jiménez', 'susana.jimenez@email.com', '75986474'),
('Alberto Miranda', 'alberto.miranda@email.com', '71458969'),
('Carolina Ríos', 'carolina.rios@email.com', '76548945'),
('Matías Medina', 'matias.medina@email.com', '79234592'),
('Luz Gómez', 'luz.gomez@email.com', '75984345'),
('Emilio Morales', 'emilio.morales@email.com', '71459359'),
('Silvia Navarro', 'silvia.navarro@email.com', '76984554'),
('Germán Ortega', 'german.ortega@email.com', '79564264'),
('Natalia López', 'natalia.lopez@email.com', '71895496'),
('Rodrigo Ramos', 'rodrigo.ramos@email.com', '76549874'),
('Raquel Castillo', 'raquel.castillo@email.com', '78913298'),
('Sebastián Villalba', 'sebastian.villalba@email.com', '78459657'),
('María Eugenia Torres', 'maria.torres@email.com', '75986485'),
('Enrique Guzmán', 'enrique.guzman@email.com', '71458970'),
('Teresa Villalobos', 'teresa.villalobos@email.com', '76548956'),
('Ramiro Núñez', 'ramiro.nunez@email.com', '79234603'),
('Valentina Soto', 'valentina.soto@email.com', '75984356'),
('Julio Rojas', 'julio.rojas@email.com', '71459360'),
('Alejandro Rojas', 'alejandro.rojas@email.com', '71234568'),
('Carmen Vega', 'carmen.vega@email.com', '79874513'),
('Jorge Morales', 'jorge.morales@email.com', '76983215'),
('Lucía Fernández', 'lucia.fernandez@email.com', '75849613'),
('Mario Sánchez', 'mario.sanchez@email.com', '71236479'),
('Natalia Castro', 'natalia.castro@email.com', '76451239'),
('Oscar Díaz', 'oscar.diaz@email.com', '79345679'),
('Patricia Ríos', 'patricia.rios@email.com', '78459632'),
('Roberto Chávez', 'roberto.chavez@email.com', '78912347'),
('Carlos Méndez', 'carlos.mendez@email.com', '71234569'),
('Laura Gómez', 'laura.gomez@email.com', '79874514'),
('Fernando Torres', 'fernando.torres@email.com', '76983216'),
('Sofía Ramírez', 'sofia.ramirez@email.com', '75849614'),
('Ricardo López', 'ricardo.lopez@email.com', '71236480'),
('Ana Martínez', 'ana.martinez@email.com', '76451240'),
('Javier Herrera', 'javier.herrera@email.com', '79345680'),
('Carmen Díaz', 'carmen.diaz_unique@email.com', '78459999'),
('Roberto Sánchez', 'roberto.sanchez_unique@email.com', '78912399'),
('Patricia Rojas', 'patricia.rojas_unique@email.com', '79874599'),
('Alejandro Castro', 'alejandro.castro_unique@email.com', '71234599'),
('Lucía Morales', 'lucia.morales_unique@email.com', '79874529'),
('Mario Fernández', 'mario.fernandez_unique@email.com', '76983999'),
('Natalia Vega', 'natalia.vega_unique@email.com', '75849699'),
('Sandra Paredes', 'sandra.paredes_unique@email.com', '76451299'),
('Jorge Ríos', 'jorge.rios_unique@email.com', '79345699'),
('María López', 'maria.lopez@email.com', '74125896'),
('Pedro Gómez', 'pedro.gomez@email.com', '75986412'),
('Andrea Ruiz', 'andrea.ruiz@email.com', '75896321'),
('Luis Martínez', 'luis.martinez@email.com', '72549681'),
('Sofía Benítez', 'sofia.benitez@email.com', '73698514'),
('Pablo Vargas', 'pablo.vargas@email.com', '75162389'),
('Daniela Orellana', 'daniela.orellana@email.com', '76985432'),
('Carlos Valdivia', 'carlos.valdivia@email.com', '79865423'),
('Camila Silva', 'camila.silva@email.com', '71584962'),
('Felipe Cruz', 'felipe.cruz@email.com', '72635984'),
('Gabriela Torres', 'gabriela.torres@email.com', '73254189'),
('Tomás Pereira', 'tomas.pereira@email.com', '74589613'),
('Laura Villarroel', 'laura.villarroel@email.com', '75836941'),
('Javier Prado', 'javier.prado@email.com', '75246981'),
('Antonia Guzmán', 'antonia.guzman@email.com', '76985342'),
('Sebastián Romero', 'sebastian.romero@email.com', '76259314'),
('Isabel Morales', 'isabel.morales@email.com', '71985463'),
('José Castro', 'jose.castro@email.com', '73586219'),
('Carolina Figueroa', 'carolina.figueroa@email.com', '74852139'),
('Matías Peña', 'matias.pena@email.com', '79254816'),
('Valentina Ramos', 'valentina.ramos@email.com', '75348216'),
('Francisco Pacheco', 'francisco.pacheco@email.com', '72968531'),
('Esteban Soto', 'esteban.soto@email.com', '76489123'),
('Natalia Villar', 'natalia.villar@email.com', '78496325'),
('Luciano Maldonado', 'luciano.maldonado@email.com', '73265487'),
('Beatriz Campos', 'beatriz.campos@email.com', '78456391'),
('Marcos Andrade', 'marcos.andrade@email.com', '75218943'),
('Paula Reyes', 'paula.reyes@email.com', '76548239'),
('Hugo Vega', 'hugo.vega@email.com', '73185642'),
('Angela Cárdenas', 'angela.cardenas@email.com', '72549163'),
('Camila Sanabria', 'camila.sanabria@email.com', '76306969'),
('María Alejandra', 'maria.alejandra@email.com', '74185296'),
('Carlos Eduardo', 'carlos.eduardo@email.com', '78965432'),
('Fernanda Isabel', 'fernanda.isabel@email.com', '71236598'),
('Luis Alberto', 'luis.alberto@email.com', '72698543'),
('Carmen Elena', 'carmen.elena@email.com', '75162394'),
('Juan Manuel', 'juan.manuel@email.com', '73829461'),
('Lucía Andrea', 'lucia.andrea@email.com', '75948621'),
('Oscar Rodrigo', 'oscar.rodrigo@email.com', '72931685'),
('Diana Gabriela', 'diana.gabriela@email.com', '74625931'),
('Felipe Daniel', 'felipe.daniel@email.com', '73456892'),
('Sofía Angélica', 'sofia.angelica@email.com', '75842631'),
('Ramiro Antonio', 'ramiro.antonio@email.com', '78954216'),
('Claudia Patricia', 'claudia.patricia@email.com', '72349568'),
('José Ignacio', 'jose.ignacio@email.com', '71986524'),
('Valentina Beatriz', 'valentina.beatriz@email.com', '75164983'),
('Roberto Javier', 'roberto.javier@email.com', '76584321'),
('Lorena Carolina', 'lorena.carolina@email.com', '74852369'),
('Diego Hernán', 'diego.hernan@email.com', '72136589'),
('Laura Cecilia', 'laura.cecilia@email.com', '75984216'),
('Martín Andrés', 'martin.andres@email.com', '74536928'),
('Ángela María', 'angela.maria@email.com', '76249831'),
('Fernando David', 'fernando.david@email.com', '73651298'),
('Mariana Susana', 'mariana.susana@email.com', '78493651'),
('Esteban Mateo', 'esteban.mateo@email.com', '75296418'),
('Gabriela Adriana', 'gabriela.adriana@email.com', '74812695'),
('Carlos Tomás', 'carlos.tomas@email.com', '71984356'),
('Mónica Alejandra', 'monica.alejandra@email.com', '75126398'),
('Luis Santiago', 'luis.santiago@email.com', '72894631'),
('Renata Victoria', 'renata.victoria@email.com', '74218539'),
('Sebastián Nicolás', 'sebastian.nicolas@email.com', '71829465'),
('Camila Estefanía', 'camila.estefania@email.com', '76428931'),
('Pablo Enrique', 'pablo.enrique@email.com', '73986541'),
('Vanesa Elizabeth', 'vanesa.elizabeth@email.com', '73215968'),
('Hugo Amado', 'hugo.amado@email.com', '75849612'),
('Patricia Lourdes', 'patricia.lourdes@email.com', '78549621'),
('Rodrigo Alonso', 'rodrigo.alonso@email.com', '72984651'),
('Andrea Luciana', 'andrea.luciana@email.com', '71459632'),
('Cristian Sebastián', 'cristian.sebastian@email.com', '75924816'),
('Elena Josefina', 'elena.josefina@email.com', '73429685'),
('Santiago Tomás', 'santiago.tomas@email.com', '78462931'),
('Lorena Sofía', 'lorena.sofia@email.com', '73241689'),
('Javier Alejandro', 'javier.alejandro@email.com', '74325961'),
('Claudia Mercedes', 'claudia.mercedes@email.com', '72698451'),
('Rosa Elena', 'rosa.elena@email.com', '71985426'),
('Luciano Antonio', 'luciano.antonio@email.com', '75214986'),
('Marcela Soledad', 'marcela.soledad@email.com', '75162384'),
('Gabriel Adrián', 'gabriel.adrian@email.com', '78426591'),
('Isabel Cristina', 'isabel.cristina@email.com', '72963158'),
('Felipe Mauricio', 'felipe.mauricio@email.com', '74512986'),
('Diana Rosario', 'diana.rosario@email.com', '73815924'),
('Diego Alejandro', 'diego.alejandro@email.com', '72486319'),
('María Victoria', 'maria.victoria@email.com', '74152396'),
('Martín Esteban', 'martin.esteban@email.com', '76249153'),
('Paula Beatriz', 'paula.beatriz@email.com', '78462395'),
('Tomás Rodrigo', 'tomas.rodrigo@email.com', '71986325'),
('Álvaro Sebastián', 'alvaro.sebastian@email.com', '72361489'),
('Fernanda Alejandra', 'fernanda.alejandra@email.com', '74695132'),
('Valeria Sofía', 'valeria.sofia@email.com', '72984621'),
('José Alfonso', 'jose.alfonso@email.com', '75812694'),
('Sofía Natalia', 'sofia.natalia@email.com', '76452918'),
('Mauricio David', 'mauricio.david@email.com', '79325146'),
('Laura Teresa', 'laura.teresa@email.com', '74189632'),
('Ramiro Nicolás', 'ramiro.nicolas@email.com', '75236941'),
('Andrea Susana', 'andrea.susana@email.com', '74963258'),
('Cristian Mateo', 'cristian.mateo@email.com', '75924863'),
('Elena Carolina', 'elena.carolina@email.com', '78542169'),
('Marcelo Hernán', 'marcelo.hernan@email.com', '73214986'),
('Carolina Inés', 'carolina.ines@email.com', '72356418'),
('Pedro Alejandro', 'pedro.alejandro@email.com', '78459632'),
('Camila Rosario', 'camila.rosario@email.com', '76249318'),
('Isabel Teresa', 'isabel.teresa@email.com', '74812369'),
('Jorge Manuel', 'jorge.manuel@email.com', '74236915'),
('Natalia Cristina', 'natalia.cristina@email.com', '73426519'),
('Pablo Nicolás', 'pablo.nicolas@email.com', '75312849'),
('Gabriela Lourdes', 'gabriela.lourdes@email.com', '78496532'),
('Héctor Ignacio', 'hector.ignacio@email.com', '74612398'),
('Vanesa José', 'vanesa.jose@email.com', '75942631'),
('Santiago Mauricio', 'santiago.mauricio@email.com', '72816549'),
('Ángela Rosario', 'angela.rosario@email.com', '74952316'),
('Luis Hernán', 'luis.hernan@email.com', '71584632'),
('María Cecilia', 'maria.cecilia@email.com', '75982341'),
('Ramiro Alfonso', 'ramiro.alfonso@email.com', '73246518');
SELECT * FROM Clientes

-- Tabla Productos
INSERT INTO Productos (NombreProducto, Descripcion, Precio, Stock) -- 183 Productos
VALUES 
('Laptop HP', 'Laptop 15 pulgadas', 1200.00, 10),
('Mouse Logitech', 'Mouse inalámbrico', 25.99, 50),
('Teclado Mecánico', 'Teclado RGB mecánico', 75.50, 30),
('Monitor Samsung', 'Monitor 24 pulgadas Full HD', 220.00, 15),
('Silla Gamer', 'Silla ergonómica', 180.00, 20),
('Impresora Epson', 'Impresora multifunción', 150.00, 12),
('Auriculares Sony', 'Auriculares Bluetooth', 89.99, 25),
('Router TP-Link', 'Router de alta velocidad', 45.00, 30),
('Disco SSD 1TB', 'Unidad de estado sólido', 110.00, 18),
('Memoria RAM 16GB', 'RAM DDR4', 60.00, 25),
('Cámara Web Logitech', 'Cámara Full HD', 70.00, 20),
('Smartphone Samsung', 'Samsung Galaxy A52', 350.00, 10),
('Tablet Lenovo', 'Tablet 10 pulgadas', 200.00, 15),
('Cargador Universal', 'Cargador USB-C', 15.00, 50),
('Fuente de Poder 600W', 'Fuente certificada', 80.00, 22),
('Microprocesador Ryzen 5', 'Procesador de 6 núcleos', 230.00, 15),
('Tarjeta Gráfica GTX 1660', '6GB VRAM', 350.00, 10),
('Placa Madre ASUS', 'Compatible con Ryzen', 180.00, 12),
('Disco Duro 2TB', 'HDD Seagate', 90.00, 20),
('Mousepad Gamer', 'Alfombrilla grande', 10.00, 40),
('Cable HDMI', 'Cable 2 metros', 8.00, 60),
('Hub USB', 'Concentrador USB', 20.00, 35),
('Teclado Inalámbrico', 'Con Bluetooth', 50.00, 25),
('Monitor LG', 'Monitor 27 pulgadas 4K', 450.00, 8),
('Parlantes Bluetooth', 'Parlantes estéreo', 55.00, 18),
('Cámara de Seguridad', 'Cámara IP Wi-Fi', 130.00, 10),
('Lámpara LED RGB', 'Lámpara inteligente', 25.00, 30),
('Micrófono USB', 'Micrófono para streaming', 70.00, 15),
('Disco Externo 2TB', 'Disco duro portátil', 120.00, 12),
('Ventilador para Laptop', 'Base refrigerante', 35.00, 25),
('Auriculares Bose', 'Auriculares con cancelación de ruido', 299.99, 15),
('Laptop Dell', 'Laptop 13 pulgadas', 1400.00, 8),
('Teclado Logitech', 'Teclado ergonómico', 55.00, 30),
('Monitor Acer', 'Monitor 27 pulgadas', 250.00, 10),
('Silla Oficina', 'Silla ajustable', 100.00, 25),
('Impresora HP', 'Impresora láser', 200.00, 10),
('Auriculares JBL', 'Auriculares deportivos', 49.99, 20),
('Router Netgear', 'Router Wi-Fi 6', 80.00, 12),
('Disco SSD 500GB', 'Unidad de estado sólido', 75.00, 20),
('Memoria RAM 8GB', 'RAM DDR4', 35.00, 40),
('Cámara Web Microsoft', 'Cámara HD', 60.00, 15),
('Smartphone iPhone 13', 'Apple iPhone 13', 900.00, 5),
('Tablet Samsung', 'Tablet 12 pulgadas', 450.00, 10),
('Cargador Rápido', 'Cargador USB-C rápido', 25.00, 50),
('Fuente de Poder 750W', 'Fuente de alimentación', 120.00, 18),
('Microprocesador Intel i7', 'Procesador de 8 núcleos', 400.00, 12),
('Tarjeta Gráfica RTX 3060', '12GB VRAM', 600.00, 8),
('Placa Madre MSI', 'Compatible con Intel', 200.00, 10),
('Disco Duro 1TB', 'HDD Western Digital', 65.00, 30),
('Mouse Gamer', 'Mouse con botones programables', 45.00, 20),
('Cable USB-C', 'Cable 1 metro', 10.00, 60),
('Hub USB-C', 'Concentrador USB-C', 30.00, 25),
('Teclado Retroiluminado', 'Teclado con luces LED', 60.00, 20),
('Monitor Philips', 'Monitor 32 pulgadas', 500.00, 6),
('Parlantes Logitech', 'Parlantes 2.1', 70.00, 15),
('Cámara de Acción', 'Cámara GoPro', 300.00, 8),
('Lámpara LED Inteligente', 'Lámpara con control por app', 35.00, 25),
('Micrófono Condensador', 'Micrófono para grabación', 120.00, 10),
('Disco Externo 1TB', 'Disco duro portátil', 80.00, 20),
('Ventilador de Escritorio', 'Ventilador USB', 20.00, 30),
('Audífonos Xiaomi', 'Audífonos inalámbricos', 40.00, 25),
('Laptop Lenovo', 'Laptop 14 pulgadas', 1300.00, 10),
('Teclado Razer', 'Teclado mecánico gaming', 150.00, 12),
('Monitor BenQ', 'Monitor 144Hz', 300.00, 9),
('Silla Ejecutiva', 'Silla de cuero', 220.00, 15),
('Impresora Canon', 'Impresora de inyección', 160.00, 10),
('Auriculares Beats', 'Auriculares con micrófono', 150.00, 18),
('Router Asus', 'Router gaming', 120.00, 12),
('Disco SSD 2TB', 'Unidad de estado sólido', 200.00, 10),
('Memoria RAM 32GB', 'RAM DDR4', 150.00, 8),
('Cámara Web Aukey', 'Cámara 4K', 100.00, 5),
('Smartphone OnePlus', 'OnePlus Nord', 400.00, 7),
('Tablet Huawei', 'Tablet 8 pulgadas', 180.00, 12),
('Cargador Inalámbrico', 'Cargador Qi', 30.00, 50),
('Fuente de Poder 500W', 'Fuente económica', 60.00, 20),
('Microprocesador Ryzen 7', 'Procesador de 8 núcleos', 350.00, 8),
('Tarjeta Gráfica RTX 3070', '8GB VRAM', 700.00, 5),
('Placa Madre Gigabyte', 'Compatible con AMD', 190.00, 10),
('Disco Duro 4TB', 'HDD Seagate', 130.00, 15),
('Mouse Inalámbrico', 'Mouse con Bluetooth', 30.00, 25),
('Cable VGA', 'Cable 3 metros', 12.00, 40),
('Hub USB 3.0', 'Concentrador USB', 25.00, 30),
('Teclado Multidispositivo', 'Teclado Bluetooth', 70.00, 15),
('Monitor AOC', 'Monitor 21 pulgadas', 150.00, 10),
('Parlantes Sony', 'Parlantes portátiles', 90.00, 12),
('Cámara Reflex', 'Cámara Canon', 600.00, 5),
('Lámpara de Escritorio', 'Lámpara con LED', 20.00, 50),
('Micrófono Lavalier', 'Micrófono de solapa', 50.00, 20),
('Disco Externo 500GB', 'Disco duro portátil', 60.00, 25),
('Ventilador USB', 'Ventilador pequeño', 15.00, 30),
('Audífonos Bluetooth', 'Audífonos deportivos', 35.00, 25),
('Laptop Apple', 'MacBook Pro', 2500.00, 5),
('Teclado Apple', 'Teclado inalámbrico', 100.00, 15),
('Smartwatch Xiaomi', 'Reloj inteligente con GPS', 120.00, 20),
('Tablet Apple iPad', 'Tablet de 10.2 pulgadas', 500.00, 10),
('Cámara Canon EOS', 'Cámara réflex digital', 800.00, 8),
('Altavoz Bluetooth JBL', 'Altavoz portátil', 90.00, 25),
('Proyector Epson', 'Proyector Full HD', 400.00, 12),
('Impresora 3D Creality', 'Impresora 3D de resina', 300.00, 5),
('Drone DJI Mavic', 'Drone con cámara 4K', 1000.00, 6),
('Consola PlayStation 5', 'Consola de videojuegos', 600.00, 7),
('Teclado Apple Magic', 'Teclado inalámbrico', 120.00, 15),
('Monitor Dell UltraSharp', 'Monitor 27 pulgadas 4K', 700.00, 10),
('Smartwatch Samsung', 'Reloj inteligente con GPS', 150.00, 15),
('Tablet Huawei MatePad', 'Tablet de 10.4 pulgadas', 300.00, 12),
('Cámara Nikon D3500', 'Cámara réflex digital', 700.00, 10),
('Altavoz Bluetooth Sony', 'Altavoz portátil', 100.00, 20),
('Proyector BenQ', 'Proyector Full HD', 450.00, 8),
('Impresora 3D Anycubic', 'Impresora 3D de resina', 350.00, 6),
('Drone DJI Phantom', 'Drone con cámara 4K', 1200.00, 5),
('Consola Xbox Series X', 'Consola de videojuegos', 550.00, 9),
('Teclado Microsoft Surface', 'Teclado inalámbrico', 130.00, 18),
('Monitor LG UltraGear', 'Monitor 27 pulgadas 4K', 750.00, 7),
('Smartwatch Fitbit', 'Reloj inteligente con GPS', 130.00, 14),
('Tablet Amazon Fire HD', 'Tablet de 10.1 pulgadas', 200.00, 11),
('Cámara Sony Alpha', 'Cámara réflex digital', 900.00, 9),
('Altavoz Bluetooth Bose', 'Altavoz portátil', 120.00, 22),
('Proyector Optoma', 'Proyector Full HD', 500.00, 7),
('Impresora 3D FlashForge', 'Impresora 3D de resina', 400.00, 5),
('Drone DJI Mini 2', 'Drone con cámara 4K', 800.00, 6),
('Consola Nintendo Switch', 'Consola de videojuegos', 350.00, 10),
('Teclado Logitech K380', 'Teclado inalámbrico', 60.00, 25),
('Monitor Samsung Odyssey', 'Monitor 27 pulgadas 4K', 800.00, 6),
('Smartwatch Garmin', 'Reloj inteligente con GPS', 200.00, 12),
('Tablet Lenovo Tab', 'Tablet de 10.3 pulgadas', 250.00, 13),
('Cámara Fujifilm X-T30', 'Cámara réflex digital', 1000.00, 8),
('Altavoz Bluetooth JBL Flip', 'Altavoz portátil', 110.00, 18),
('Proyector Acer', 'Proyector Full HD', 480.00, 9),
('Impresora 3D Prusa', 'Impresora 3D de resina', 500.00, 4),
('Drone DJI Air 2S', 'Drone con cámara 4K', 1100.00, 5),
('Consola PlayStation 4', 'Consola de videojuegos', 400.00, 8),
('Teclado Corsair K95', 'Teclado mecánico gaming', 200.00, 10),
('Monitor ASUS ROG', 'Monitor 27 pulgadas 4K', 900.00, 5),
('Smartwatch Apple', 'Reloj inteligente con GPS', 400.00, 10),
('Tablet Samsung Galaxy', 'Tablet de 10.4 pulgadas', 350.00, 15),
('Cámara Sony Alpha 7', 'Cámara réflex digital', 1500.00, 5),
('Altavoz Bluetooth JBL Charge', 'Altavoz portátil', 130.00, 20),
('Proyector LG', 'Proyector Full HD', 600.00, 8),
('Impresora 3D Ender', 'Impresora 3D de resina', 300.00, 7),
('Drone DJI Mavic Air', 'Drone con cámara 4K', 900.00, 6),
('Consola Nintendo Switch Lite', 'Consola de videojuegos', 250.00, 12),
('Teclado Logitech G Pro', 'Teclado mecánico gaming', 150.00, 18),
('Monitor ASUS TUF', 'Monitor 27 pulgadas 4K', 700.00, 10),
('Smartwatch Huawei', 'Reloj inteligente con GPS', 120.00, 15),
('Tablet Lenovo Yoga', 'Tablet de 11 pulgadas', 400.00, 10),
('Cámara Canon EOS R', 'Cámara réflex digital', 2000.00, 4),
('Altavoz Bluetooth Bose SoundLink', 'Altavoz portátil', 200.00, 12),
('Proyector Epson Home Cinema', 'Proyector Full HD', 800.00, 6),
('Impresora 3D Prusa Mini', 'Impresora 3D de resina', 400.00, 5),
('Drone DJI Mini SE', 'Drone con cámara 4K', 500.00, 8),
('Consola Xbox Series S', 'Consola de videojuegos', 350.00, 10),
('Teclado Corsair K70', 'Teclado mecánico gaming', 180.00, 15),
('Monitor Dell UltraSharp 32', 'Monitor 32 pulgadas 4K', 900.00, 7),
('Smartwatch Garmin Venu', 'Reloj inteligente con GPS', 300.00, 12),
('Tablet Microsoft Surface', 'Tablet de 12.3 pulgadas', 800.00, 8),
('Cámara Nikon Z6', 'Cámara réflex digital', 1800.00, 5),
('Altavoz Bluetooth Sony SRS-XB', 'Altavoz portátil', 150.00, 18),
('Proyector BenQ HT2050A', 'Proyector Full HD', 1000.00, 5),
('Impresora 3D Anycubic Photon', 'Impresora 3D de resina', 500.00, 4),
('Drone DJI FPV', 'Drone con cámara 4K', 1200.00, 5),
('Consola PlayStation 5 Digital', 'Consola de videojuegos', 450.00, 8),
('Teclado Razer Huntsman', 'Teclado mecánico gaming', 200.00, 12),
('Monitor LG UltraGear 34', 'Monitor 34 pulgadas 4K', 1200.00, 6),
('Smartwatch Fitbit Sense', 'Reloj inteligente con GPS', 250.00, 10),
('Tablet Amazon Fire HD 10', 'Tablet de 10.1 pulgadas', 150.00, 15),
('Cámara Fujifilm X-T4', 'Cámara réflex digital', 1700.00, 6),
('Altavoz Bluetooth JBL Flip 5', 'Altavoz portátil', 100.00, 20),
('Proyector Optoma UHD50X', 'Proyector Full HD', 1500.00, 4),
('Impresora 3D FlashForge Creator', 'Impresora 3D de resina', 600.00, 3),
('Drone DJI Mavic 2 Pro', 'Drone con cámara 4K', 1500.00, 4),
('Consola Nintendo Switch OLED', 'Consola de videojuegos', 400.00, 7),
('Teclado Apple Magic Keyboard', 'Teclado inalámbrico', 120.00, 15),
('Monitor Samsung Odyssey G9', 'Monitor 49 pulgadas 4K', 2000.00, 3),
('Smartwatch Samsung Galaxy Watch', 'Reloj inteligente con GPS', 280.00, 10),
('Tablet Lenovo Tab P11', 'Tablet de 11 pulgadas', 300.00, 12),
('Cámara Panasonic Lumix GH5', 'Cámara réflex digital', 1600.00, 5),
('Altavoz Bluetooth Ultimate Ears', 'Altavoz portátil', 180.00, 15),
('Proyector Acer H7850', 'Proyector Full HD', 1200.00, 5),
('Impresora 3D Creality Ender 3', 'Impresora 3D de resina', 250.00, 8),
('Drone DJI Mavic Mini', 'Drone con cámara 4K', 600.00, 7),
('Consola Xbox One X', 'Consola de videojuegos', 300.00, 10),
('Teclado Logitech MX Keys', 'Teclado inalámbrico', 130.00, 18),
('Monitor ASUS ROG Swift', 'Monitor 27 pulgadas 4K', 800.00, 9);

-- Tabla Pedidos
INSERT INTO Pedidos (ClienteID, Estado, Total) -- 185 Pedidos
VALUES 
(1, 'Pendiente', 150.50),
(2, 'Completado', 200.99),
(3, 'Pendiente', 340.00),
(4, 'Completado', 95.75),
(5, 'Pendiente', 180.50),
(6, 'Completado', 250.00),
(7, 'Pendiente', 120.30),
(8, 'Completado', 400.00),
(9, 'Pendiente', 78.90),
(10, 'Completado', 99.99),
(11, 'Pendiente', 199.99),
(12, 'Completado', 320.00),
(13, 'Pendiente', 410.50),
(14, 'Completado', 250.25),
(15, 'Pendiente', 60.00),
(16, 'Completado', 130.75),
(17, 'Pendiente', 275.00),
(18, 'Completado', 195.25),
(19, 'Pendiente', 185.99),
(20, 'Completado', 140.80),
(21, 'Pendiente', 380.00),
(22, 'Completado', 225.50),
(23, 'Pendiente', 310.75),
(24, 'Completado', 499.99),
(25, 'Pendiente', 135.00),
(26, 'Completado', 89.99),
(27, 'Pendiente', 290.45),
(28, 'Completado', 450.00),
(29, 'Pendiente', 150.00),
(30, 'Completado', 175.00),
(31, 'Pendiente', 225.00),
(32, 'Completado', 315.75),
(33, 'Pendiente', 145.30),
(34, 'Completado', 210.50),
(35, 'Pendiente', 280.00),
(36, 'Completado', 360.25),
(37, 'Pendiente', 190.99),
(38, 'Completado', 170.85),
(39, 'Pendiente', 430.00),
(40, 'Completado', 290.50),
(41, 'Pendiente', 340.75),
(42, 'Completado', 480.99),
(43, 'Pendiente', 165.00),
(44, 'Completado', 120.99),
(45, 'Pendiente', 310.45),
(46, 'Completado', 470.00),
(47, 'Pendiente', 220.00),
(48, 'Completado', 245.50),
(49, 'Pendiente', 375.75),
(50, 'Completado', 145.99),
(51, 'Pendiente', 215.50),
(52, 'Completado', 180.75),
(53, 'Pendiente', 250.25),
(54, 'Completado', 140.00),
(55, 'Pendiente', 195.30),
(56, 'Completado', 230.50),
(57, 'Pendiente', 260.00),
(58, 'Completado', 300.25),
(59, 'Pendiente', 240.99),
(60, 'Completado', 170.80),
(61, 'Pendiente', 390.00),
(62, 'Completado', 270.50),
(63, 'Pendiente', 310.75),
(64, 'Completado', 420.99),
(65, 'Pendiente', 135.00),
(66, 'Completado', 99.99),
(67, 'Pendiente', 285.45),
(68, 'Completado', 435.00),
(69, 'Pendiente', 160.00),
(70, 'Completado', 185.00),
(71, 'Pendiente', 225.00),
(72, 'Completado', 315.75),
(73, 'Pendiente', 145.30),
(74, 'Completado', 210.50),
(75, 'Pendiente', 280.00),
(76, 'Completado', 360.25),
(77, 'Pendiente', 190.99),
(78, 'Completado', 170.85),
(79, 'Pendiente', 430.00),
(80, 'Completado', 290.50),
(81, 'Pendiente', 340.75),
(82, 'Completado', 480.99),
(83, 'Pendiente', 165.00),
(84, 'Completado', 120.99),
(85, 'Pendiente', 310.45),
(86, 'Completado', 470.00),
(87, 'Pendiente', 220.00),
(88, 'Completado', 245.50),
(89, 'Pendiente', 375.75),
(90, 'Completado', 145.99),
(91, 'Pendiente', 215.50),
(92, 'Completado', 180.75),
(93, 'Pendiente', 250.25),
(94, 'Completado', 140.00),
(95, 'Pendiente', 195.30),
(96, 'Pendiente', 300.00),
(97, 'Completado', 450.00),
(98, 'Pendiente', 600.00),
(99, 'Completado', 250.00),
(100, 'Pendiente', 120.00),
(101, 'Completado', 800.00),
(102, 'Pendiente', 350.00),
(103, 'Completado', 500.00),
(104, 'Pendiente', 200.00),
(105, 'Completado', 150.00),
(106, 'Pendiente', 350.00),
(107, 'Completado', 500.00),
(108, 'Pendiente', 700.00),
(109, 'Completado', 300.00),
(110, 'Pendiente', 150.00),
(111, 'Completado', 900.00),
(112, 'Pendiente', 400.00),
(113, 'Completado', 600.00),
(114, 'Pendiente', 250.00),
(115, 'Completado', 200.00),
(116, 'Pendiente', 450.00),
(117, 'Completado', 550.00),
(118, 'Pendiente', 800.00),
(119, 'Completado', 350.00),
(120, 'Pendiente', 200.00),
(121, 'Completado', 700.00),
(122, 'Pendiente', 300.00),
(123, 'Completado', 500.00),
(124, 'Pendiente', 150.00),
(125, 'Completado', 400.00),
(126, 'Pendiente', 600.00),
(127, 'Completado', 250.00),
(128, 'Pendiente', 200.00),
(129, 'Completado', 450.00),
(130, 'Pendiente', 550.00),
(131, 'Completado', 800.00),
(132, 'Pendiente', 350.00),
(133, 'Completado', 200.00),
(134, 'Pendiente', 700.00),
(135, 'Completado', 300.00),
(136, 'Pendiente', 400.00),
(137, 'Completado', 550.00),
(138, 'Pendiente', 800.00),
(139, 'Completado', 350.00),
(140, 'Pendiente', 200.00),
(141, 'Completado', 900.00),
(142, 'Pendiente', 450.00),
(143, 'Completado', 600.00),
(144, 'Pendiente', 300.00),
(145, 'Completado', 150.00),
(146, 'Pendiente', 500.00),
(147, 'Completado', 700.00),
(148, 'Pendiente', 250.00),
(149, 'Completado', 400.00),
(150, 'Pendiente', 180.00),
(151, 'Completado', 750.00),
(152, 'Pendiente', 320.00),
(153, 'Completado', 480.00),
(154, 'Pendiente', 210.00),
(155, 'Completado', 360.00),
(156, 'Pendiente', 190.00),
(157, 'Completado', 170.00),
(158, 'Pendiente', 430.00),
(159, 'Completado', 290.00),
(160, 'Pendiente', 340.00),
(161, 'Completado', 480.00),
(162, 'Pendiente', 165.00),
(163, 'Completado', 120.00),
(164, 'Pendiente', 310.00),
(165, 'Completado', 470.00),
(166, 'Pendiente', 220.00),
(167, 'Completado', 245.00),
(168, 'Pendiente', 375.00),
(169, 'Completado', 145.00),
(170, 'Pendiente', 215.00),
(171, 'Completado', 180.00),
(172, 'Pendiente', 250.00),
(173, 'Completado', 140.00),
(174, 'Pendiente', 195.00),
(175, 'Completado', 230.00),
(176, 'Pendiente', 260.00),
(177, 'Completado', 300.00),
(178, 'Pendiente', 240.00),
(179, 'Completado', 170.00),
(180, 'Pendiente', 390.00),
(181, 'Completado', 270.00),
(182, 'Pendiente', 310.00),
(183, 'Completado', 420.00),
(184, 'Pendiente', 135.00),
(185, 'Completado', 99.00);
-- (50 pedidos adicionales)
INSERT INTO Pedidos (ClienteID, Estado, Total) 
VALUES 
(186, 'Pendiente', 300.00),
(187, 'Completado', 450.00),
(188, 'Pendiente', 600.00),
(189, 'Completado', 250.00),
(190, 'Pendiente', 120.00),
(191, 'Completado', 800.00),
(192, 'Pendiente', 350.00),
(193, 'Completado', 500.00),
(194, 'Pendiente', 200.00),
(195, 'Completado', 150.00),
(196, 'Pendiente', 350.00),
(197, 'Completado', 500.00),
(198, 'Pendiente', 700.00),
(199, 'Completado', 300.00),
(200, 'Pendiente', 150.00),
(201, 'Completado', 900.00),
(202, 'Pendiente', 400.00),
(203, 'Completado', 600.00),
(204, 'Pendiente', 250.00),
(205, 'Completado', 200.00),
(206, 'Pendiente', 450.00),
(207, 'Completado', 550.00),
(208, 'Pendiente', 800.00),
(209, 'Completado', 350.00),
(210, 'Pendiente', 200.00),
(211, 'Completado', 700.00),
(212, 'Pendiente', 300.00),
(213, 'Completado', 500.00),
(214, 'Pendiente', 150.00),
(215, 'Completado', 400.00),
(216, 'Pendiente', 600.00),
(217, 'Completado', 250.00),
(218, 'Pendiente', 200.00),
(219, 'Completado', 450.00),
(220, 'Pendiente', 550.00),
(221, 'Completado', 800.00),
(222, 'Pendiente', 350.00),
(223, 'Completado', 200.00),
(224, 'Pendiente', 700.00),
(225, 'Completado', 300.00),
(226, 'Pendiente', 400.00),
(227, 'Completado', 550.00),
(228, 'Pendiente', 800.00),
(229, 'Completado', 350.00),
(230, 'Pendiente', 200.00),
(231, 'Completado', 900.00),
(232, 'Pendiente', 450.00),
(233, 'Completado', 600.00);

-- Tabla DetalleVenta
INSERT INTO DetalleVenta (PedidoID, ProductoID, Cantidad, PrecioUnitario) -- 186 Datos
VALUES
-- Datos existentes
(1, 1, 1, 1200.50), -- Laptop en el pedido 1
(1, 2, 1, 25.99), -- Mouse en el pedido 1
(2, 3, 1, 79.99), -- Teclado en el pedido 2
(3, 2, 2, 25.99), -- 2 Mouse en el pedido 3
-- Nuevos datos generados
(4, 4, 1, 150.00), -- Monitor en el pedido 4
(4, 2, 1, 25.99), -- Mouse en el pedido 4
(5, 1, 1, 1200.50), -- Laptop en el pedido 5
(6, 3, 2, 79.99), -- 2 Teclados en el pedido 6
(7, 4, 1, 150.00), -- Monitor en el pedido 7
(7, 2, 1, 25.99), -- Mouse en el pedido 7
(8, 1, 1, 1200.50), -- Laptop en el pedido 8
(9, 4, 3, 150.00), -- 3 Monitores en el pedido 9
(10, 3, 1, 79.99), -- Teclado en el pedido 10
(11, 2, 2, 25.99), -- 2 Mouse en el pedido 11
(12, 4, 1, 150.00), -- Monitor en el pedido 12
(13, 1, 1, 1200.50), -- Laptop en el pedido 13
(14, 3, 1, 79.99), -- Teclado en el pedido 14
(15, 4, 2, 150.00), -- 2 Monitores en el pedido 15
(16, 2, 1, 25.99), -- Mouse en el pedido 16
(17, 1, 2, 1200.50), -- 2 Laptops en el pedido 17
(18, 3, 3, 79.99), -- 3 Teclados en el pedido 18
(19, 4, 1, 150.00), -- Monitor en el pedido 19
(20, 2, 1, 25.99), -- Mouse en el pedido 20
(21, 1, 1, 1200.50), -- Laptop en el pedido 21
(22, 3, 2, 79.99), -- 2 Teclados en el pedido 22
(23, 4, 3, 150.00), -- 3 Monitores en el pedido 23
(24, 2, 1, 25.99), -- Mouse en el pedido 24
(25, 1, 2, 1200.50), -- 2 Laptops en el pedido 25
(26, 3, 1, 79.99), -- Teclado en el pedido 26
(27, 4, 2, 150.00), -- 2 Monitores en el pedido 27
(28, 2, 1, 25.99), -- Mouse en el pedido 28
(29, 1, 1, 1200.50), -- Laptop en el pedido 29
(30, 3, 1, 79.99), -- Teclado en el pedido 30
-- Continuación de los datos
(31, 4, 1, 150.00), -- Monitor en el pedido 31
(32, 2, 3, 25.99), -- 3 Mouse en el pedido 32
(33, 1, 1, 1200.50), -- Laptop en el pedido 33
(34, 3, 2, 79.99), -- 2 Teclados en el pedido 34
(35, 4, 2, 150.00), -- 2 Monitores en el pedido 35
(36, 2, 1, 25.99), -- Mouse en el pedido 36
(37, 1, 1, 1200.50), -- Laptop en el pedido 37
(38, 3, 3, 79.99), -- 3 Teclados en el pedido 38
(39, 4, 1, 150.00), -- Monitor en el pedido 39
(40, 2, 1, 25.99), -- Mouse en el pedido 40
(41, 1, 2, 1200.50), -- 2 Laptops en el pedido 41
(42, 3, 1, 79.99), -- Teclado en el pedido 42
(43, 4, 2, 150.00), -- 2 Monitores en el pedido 43
(44, 2, 1, 25.99), -- Mouse en el pedido 44
(45, 1, 1, 1200.50), -- Laptop en el pedido 45
(46, 3, 2, 79.99), -- 2 Teclados en el pedido 46
(47, 4, 3, 150.00), -- 3 Monitores en el pedido 47
(48, 2, 1, 25.99), -- Mouse en el pedido 48
(49, 1, 2, 1200.50), -- 2 Laptops en el pedido 49
(50, 3, 1, 79.99), -- Teclado en el pedido 50
(51, 4, 1, 150.00), -- Monitor en el pedido 51
(52, 2, 2, 25.99), -- 2 Mouse en el pedido 52
(53, 1, 1, 1200.50), -- Laptop en el pedido 53
(54, 3, 1, 79.99), -- Teclado en el pedido 54
(55, 4, 3, 150.00), -- 3 Monitores en el pedido 55
(56, 2, 1, 25.99), -- Mouse en el pedido 56
(57, 1, 2, 1200.50), -- 2 Laptops en el pedido 57
(58, 3, 2, 79.99), -- 2 Teclados en el pedido 58
(59, 4, 1, 150.00), -- Monitor en el pedido 59
(60, 2, 1, 25.99), -- Mouse en el pedido 60
(61, 1, 1, 1200.50), -- Laptop en el pedido 61
(62, 3, 2, 79.99), -- 2 Teclados en el pedido 62
(63, 4, 3, 150.00), -- 3 Monitores en el pedido 63
(64, 2, 1, 25.99), -- Mouse en el pedido 64
(65, 1, 2, 1200.50), -- 2 Laptops en el pedido 65
(66, 3, 1, 79.99), -- Teclado en el pedido 66
(67, 4, 2, 150.00), -- 2 Monitores en el pedido 67
(68, 2, 3, 25.99), -- 3 Mouse en el pedido 68
(69, 1, 1, 1200.50), -- Laptop en el pedido 69
(70, 3, 2, 79.99), -- 2 Teclados en el pedido 70
(71, 4, 1, 150.00), -- Monitor en el pedido 71
(72, 2, 2, 25.99), -- 2 Mouse en el pedido 72
(73, 1, 1, 1200.50), -- Laptop en el pedido 73
(74, 3, 1, 79.99), -- Teclado en el pedido 74
(75, 4, 3, 150.00), -- 3 Monitores en el pedido 75
(76, 2, 1, 25.99), -- Mouse en el pedido 76
(77, 1, 2, 1200.50), -- 2 Laptops en el pedido 77
(78, 3, 1, 79.99), -- Teclado en el pedido 78
(79, 4, 2, 150.00), -- 2 Monitores en el pedido 79
(80, 2, 3, 25.99), -- 3 Mouse en el pedido 80
(81, 1, 1, 1200.50), -- Laptop en el pedido 81
(82, 3, 2, 79.99), -- 2 Teclados en el pedido 82
(83, 4, 1, 150.00), -- Monitor en el pedido 83
(84, 2, 1, 25.99), -- Mouse en el pedido 84
(85, 1, 2, 1200.50), -- 2 Laptops en el pedido 85
(86, 3, 1, 79.99), -- Teclado en el pedido 86
(87, 4, 2, 150.00), -- 2 Monitores en el pedido 87
(88, 2, 3, 25.99), -- 3 Mouse en el pedido 88
(89, 1, 1, 1200.50), -- Laptop en el pedido 89
(90, 3, 2, 79.99), -- 2 Teclados en el pedido 90
(91, 4, 1, 150.00), -- Monitor en el pedido 91
(92, 2, 2, 25.99), -- 2 Mouse en el pedido 92
(93, 1, 1, 1200.50), -- Laptop en el pedido 93
(94, 3, 1, 79.99), -- Teclado en el pedido 94
(95, 4, 3, 150.00), -- 3 Monitores en el pedido 95
(96, 101, 1, 120.00), -- Smartwatch en el pedido 96
(96, 102, 1, 500.00), -- Tablet en el pedido 96
(97, 103, 1, 800.00), -- Cámara en el pedido 97
(98, 104, 2, 90.00), -- 2 Altavoces en el pedido 98
(99, 105, 1, 400.00), -- Proyector en el pedido 99
(100, 106, 1, 300.00), -- Impresora 3D en el pedido 100
(101, 107, 1, 1000.00), -- Drone en el pedido 101
(102, 108, 1, 600.00), -- Consola en el pedido 102
(103, 109, 1, 120.00), -- Teclado en el pedido 103
(104, 110, 1, 700.00), -- Monitor en el pedido 104
(106, 111, 1, 150.00), -- Smartwatch en el pedido 106
(106, 112, 1, 300.00), -- Tablet en el pedido 106
(107, 113, 1, 700.00), -- Cámara en el pedido 107
(108, 114, 2, 100.00), -- 2 Altavoces en el pedido 108
(109, 115, 1, 450.00), -- Proyector en el pedido 109
(110, 116, 1, 350.00), -- Impresora 3D en el pedido 110
(111, 117, 1, 1200.00), -- Drone en el pedido 111
(112, 118, 1, 550.00), -- Consola en el pedido 112
(113, 119, 1, 130.00), -- Teclado en el pedido 113
(114, 120, 1, 750.00), -- Monitor en el pedido 114
(115, 121, 1, 130.00), -- Smartwatch en el pedido 115
(115, 122, 1, 200.00), -- Tablet en el pedido 115
(116, 123, 1, 900.00), -- Cámara en el pedido 116
(117, 124, 2, 120.00), -- 2 Altavoces en el pedido 117
(118, 125, 1, 500.00), -- Proyector en el pedido 118
(119, 126, 1, 400.00), -- Impresora 3D en el pedido 119
(120, 127, 1, 800.00), -- Drone en el pedido 120
(121, 128, 1, 350.00), -- Consola en el pedido 121
(122, 129, 1, 60.00), -- Teclado en el pedido 122
(123, 130, 1, 800.00), -- Monitor en el pedido 123
(124, 131, 1, 200.00), -- Smartwatch en el pedido 124
(124, 132, 1, 250.00), -- Tablet en el pedido 124
(125, 133, 1, 1000.00), -- Cámara en el pedido 125
(126, 134, 2, 110.00), -- 2 Altavoces en el pedido 126
(127, 135, 1, 480.00), -- Proyector en el pedido 127
(128, 136, 1, 500.00), -- Impresora 3D en el pedido 128
(129, 137, 1, 1100.00), -- Drone en el pedido 129
(130, 138, 1, 400.00), -- Consola en el pedido 130
(136, 141, 1, 400.00), -- Smartwatch en el pedido 136
(136, 142, 1, 350.00), -- Tablet en el pedido 136
(137, 143, 1, 1500.00), -- Cámara en el pedido 137
(138, 144, 2, 130.00), -- 2 Altavoces en el pedido 138
(139, 145, 1, 600.00), -- Proyector en el pedido 139
(140, 146, 1, 300.00), -- Impresora 3D en el pedido 140
(141, 147, 1, 900.00), -- Drone en el pedido 141
(142, 148, 1, 250.00), -- Consola en el pedido 142
(143, 149, 1, 150.00), -- Teclado en el pedido 143
(144, 150, 1, 700.00), -- Monitor en el pedido 144
(145, 151, 1, 120.00), -- Smartwatch en el pedido 145
(145, 152, 1, 400.00), -- Tablet en el pedido 145
(146, 153, 1, 2000.00), -- Cámara en el pedido 146
(147, 154, 2, 200.00), -- 2 Altavoces en el pedido 147
(148, 155, 1, 800.00), -- Proyector en el pedido 148
(149, 156, 1, 400.00), -- Impresora 3D en el pedido 149
(150, 157, 1, 500.00), -- Drone en el pedido 150
(151, 158, 1, 350.00), -- Consola en el pedido 151
(152, 159, 1, 180.00), -- Teclado en el pedido 152
(153, 160, 1, 900.00), -- Monitor en el pedido 153
(154, 161, 1, 300.00), -- Smartwatch en el pedido 154
(154, 162, 1, 800.00), -- Tablet en el pedido 154
(155, 163, 1, 1800.00), -- Cámara en el pedido 155
(156, 164, 2, 150.00), -- 2 Altavoces en el pedido 156
(157, 165, 1, 1000.00), -- Proyector en el pedido 157
(158, 166, 1, 500.00), -- Impresora 3D en el pedido 158
(159, 167, 1, 1200.00), -- Drone en el pedido 159
(160, 168, 1, 450.00), -- Consola en el pedido 160
(161, 169, 1, 200.00), -- Teclado en el pedido 161
(162, 170, 1, 1200.00), -- Monitor en el pedido 162
(163, 171, 1, 250.00), -- Smartwatch en el pedido 163
(163, 172, 1, 150.00), -- Tablet en el pedido 163
(164, 173, 1, 1700.00), -- Cámara en el pedido 164
(165, 174, 2, 100.00), -- 2 Altavoces en el pedido 165
(166, 175, 1, 1500.00), -- Proyector en el pedido 166
(167, 176, 1, 600.00), -- Impresora 3D en el pedido 167
(168, 177, 1, 1500.00), -- Drone en el pedido 168
(169, 178, 1, 400.00), -- Consola en el pedido 169
(170, 179, 1, 120.00), -- Teclado en el pedido 170
(171, 180, 1, 2000.00), -- Monitor en el pedido 171
(172, 181, 1, 280.00), -- Smartwatch en el pedido 172
(172, 182, 1, 300.00), -- Tablet en el pedido 172
(173, 183, 1, 1600.00), -- Cámara en el pedido 173
(174, 183, 2, 180.00), -- 2 Altavoces en el pedido 174
(175, 183, 1, 1200.00), -- Proyector en el pedido 175
(176, 183, 1, 1200.00), -- Impresora 3D en el pedido 176
(177, 183, 1, 1200.00), -- Drone en el pedido 177
(178, 183, 1, 1200.00), -- Consola en el pedido 178
(179, 183, 1, 1200.00), -- Teclado en el pedido 179
(180, 183, 1, 1200.00);
-- (50 detalles adicionales)
INSERT INTO DetalleVenta (PedidoID, ProductoID, Cantidad, PrecioUnitario) 
VALUES 
(186, 101, 1, 120.00),
(186, 102, 1, 500.00),
(187, 103, 1, 800.00),
(188, 104, 2, 90.00),
(189, 105, 1, 400.00),
(190, 106, 1, 300.00),
(191, 107, 1, 1000.00),
(192, 108, 1, 600.00),
(193, 109, 1, 120.00),
(194, 110, 1, 700.00),
(195, 111, 1, 150.00),
(195, 112, 1, 300.00),
(196, 113, 1, 700.00),
(197, 114, 2, 100.00),
(198, 115, 1, 450.00),
(199, 116, 1, 350.00),
(200, 117, 1, 1200.00),
(201, 118, 1, 550.00),
(202, 119, 1, 130.00),
(203, 120, 1, 750.00),
(204, 121, 1, 130.00),
(204, 122, 1, 200.00),
(205, 123, 1, 900.00),
(206, 124, 2, 120.00),
(207, 125, 1, 500.00),
(208, 126, 1, 400.00),
(209, 127, 1, 800.00),
(210, 128, 1, 350.00),
(211, 129, 1, 60.00),
(212, 130, 1, 800.00),
(213, 131, 1, 200.00),
(213, 132, 1, 250.00),
(214, 133, 1, 1000.00),
(215, 134, 2, 110.00),
(216, 135, 1, 480.00),
(217, 136, 1, 500.00),
(218, 137, 1, 1100.00),
(219, 138, 1, 400.00),
(220, 139, 1, 120.00),
(221, 140, 1, 750.00),
(222, 141, 1, 400.00),
(222, 142, 1, 350.00),
(223, 143, 1, 1500.00),
(224, 144, 2, 130.00),
(225, 145, 1, 600.00),
(226, 146, 1, 300.00),
(227, 147, 1, 900.00),
(228, 148, 1, 250.00),
(229, 149, 1, 150.00),
(230, 150, 1, 700.00);
SELECT * FROM DetalleVenta

-- Tabla Pagos
INSERT INTO Pagos (PedidoID, Monto, MetodoPago)
VALUES
(1, 1226.49, 'Tarjeta'),
(2, 79.99, 'Efectivo'),
(3, 25.99, 'Efectivo'),
(4, 300.00, 'Efectivo'), -- Pago del pedido 4
(5, 1226.49, 'Tarjeta'), -- Pago del pedido 5
(6, 159.98, 'Transferencia'), -- Pago del pedido 6
(7, 300.00, 'Efectivo'), -- Pago del pedido 7
(8, 1226.49, 'Tarjeta'), -- Pago del pedido 8
(9, 450.00, 'Transferencia'), -- Pago del pedido 9
(10, 79.99, 'Efectivo'), -- Pago del pedido 10
(11, 51.98, 'Tarjeta'), -- Pago del pedido 11
(12, 150.00, 'Transferencia'), -- Pago del pedido 12
(13, 1226.49, 'Tarjeta'), -- Pago del pedido 13
(14, 79.99, 'Efectivo'), -- Pago del pedido 14
(15, 300.00, 'Transferencia'), -- Pago del pedido 15
(16, 25.99, 'Tarjeta'), -- Pago del pedido 16
(17, 2452.98, 'Efectivo'), -- Pago del pedido 17
(18, 239.97, 'Transferencia'), -- Pago del pedido 18
(19, 150.00, 'Efectivo'), -- Pago del pedido 19
(20, 25.99, 'Tarjeta'), -- Pago del pedido 20
(21, 1226.49, 'Transferencia'), -- Pago del pedido 21
(22, 159.98, 'Efectivo'), -- Pago del pedido 22
(23, 450.00, 'Tarjeta'), -- Pago del pedido 23
(24, 25.99, 'Transferencia'), -- Pago del pedido 24
(25, 2452.98, 'Tarjeta'), -- Pago del pedido 25
(26, 79.99, 'Efectivo'), -- Pago del pedido 26
(27, 300.00, 'Transferencia'), -- Pago del pedido 27
(28, 25.99, 'Efectivo'), -- Pago del pedido 28
(29, 1226.49, 'Tarjeta'), -- Pago del pedido 29
(30, 79.99, 'Transferencia'), -- Pago del pedido 30
(31, 300.00, 'Efectivo'), -- Pago del pedido 31
(32, 25.99, 'Tarjeta'), -- Pago del pedido 32
(33, 450.00, 'Transferencia'), -- Pago del pedido 33
(34, 159.98, 'Efectivo'), -- Pago del pedido 34
(35, 1226.49, 'Tarjeta'), -- Pago del pedido 35
(36, 150.00, 'Transferencia'), -- Pago del pedido 36
(37, 51.98, 'Tarjeta'), -- Pago del pedido 37
(38, 159.98, 'Efectivo'), -- Pago del pedido 38
(39, 1226.49, 'Transferencia'), -- Pago del pedido 39
(40, 450.00, 'Efectivo'), -- Pago del pedido 40
(41, 25.99, 'Tarjeta'), -- Pago del pedido 41
(42, 300.00, 'Transferencia'), -- Pago del pedido 42
(43, 159.98, 'Efectivo'), -- Pago del pedido 43
(44, 450.00, 'Transferencia'), -- Pago del pedido 44
(45, 1226.49, 'Tarjeta'), -- Pago del pedido 45
(46, 79.99, 'Efectivo'), -- Pago del pedido 46
(47, 159.98, 'Transferencia'), -- Pago del pedido 47
(48, 150.00, 'Efectivo'), -- Pago del pedido 48
(49, 2452.98, 'Tarjeta'), -- Pago del pedido 49
(50, 51.98, 'Transferencia'), -- Pago del pedido 50
(51, 25.99, 'Efectivo'), -- Pago del pedido 51
(52, 300.00, 'Tarjeta'), -- Pago del pedido 52
(53, 450.00, 'Efectivo'), -- Pago del pedido 53
(54, 79.99, 'Transferencia'), -- Pago del pedido 54
(55, 1226.49, 'Tarjeta'), -- Pago del pedido 55
(56, 25.99, 'Efectivo'), -- Pago del pedido 56
(57, 159.98, 'Transferencia'), -- Pago del pedido 57
(58, 300.00, 'Efectivo'), -- Pago del pedido 58
(59, 450.00, 'Tarjeta'), -- Pago del pedido 59
(60, 79.99, 'Transferencia'), -- Pago del pedido 60
(61, 150.00, 'Efectivo'), -- Pago del pedido 61
(62, 2452.98, 'Transferencia'), -- Pago del pedido 62
(63, 25.99, 'Tarjeta'), -- Pago del pedido 63
(64, 159.98, 'Transferencia'), -- Pago del pedido 64
(65, 1226.49, 'Tarjeta'), -- Pago del pedido 65
(66, 79.99, 'Efectivo'), -- Pago del pedido 66
(67, 300.00, 'Efectivo'), -- Pago del pedido 67
(68, 25.99, 'Tarjeta'), -- Pago del pedido 68
(69, 450.00, 'Transferencia'), -- Pago del pedido 69
(70, 51.98, 'Efectivo'), -- Pago del pedido 70
(71, 150.00, 'Tarjeta'), -- Pago del pedido 71
(72, 159.98, 'Transferencia'), -- Pago del pedido 72
(73, 1226.49, 'Efectivo'), -- Pago del pedido 73
(74, 2452.98, 'Tarjeta'), -- Pago del pedido 74
(75, 79.99, 'Transferencia'), -- Pago del pedido 75
(76, 25.99, 'Efectivo'), -- Pago del pedido 76
(77, 300.00, 'Tarjeta'), -- Pago del pedido 77
(78, 450.00, 'Efectivo'), -- Pago del pedido 78
(79, 159.98, 'Transferencia'), -- Pago del pedido 79
(80, 150.00, 'Tarjeta'), -- Pago del pedido 80
(81, 1226.49, 'Efectivo'), -- Pago del pedido 81
(82, 25.99, 'Transferencia'), -- Pago del pedido 82
(83, 450.00, 'Efectivo'), -- Pago del pedido 8
(84, 159.98, 'Tarjeta'), -- Pago del pedido 84
(85, 150.00, 'Transferencia'), -- Pago del pedido 85
(86, 79.99, 'Efectivo'), -- Pago del pedido 86
(87, 300.00, 'Efectivo'), -- Pago del pedido 87
(88, 1226.49, 'Tarjeta'), -- Pago del pedido 88
(89, 51.98, 'Transferencia'), -- Pago del pedido 89
(90, 25.99, 'Efectivo'), -- Pago del pedido 90
(91, 450.00, 'Tarjeta'), -- Pago del pedido 91
(92, 2452.98, 'Efectivo'), -- Pago del pedido 92
(93, 159.98, 'Transferencia'), -- Pago del pedido 93
(94, 150.00, 'Tarjeta'), -- Pago del pedido 94
(95, 79.99, 'Efectivo'), -- Pago del pedido 95
(96, 620.00, 'Tarjeta'), -- Pago del pedido 96
(97, 800.00, 'Transferencia'), -- Pago del pedido 97
(98, 180.00, 'Efectivo'), -- Pago del pedido 98
(99, 400.00, 'Tarjeta'), -- Pago del pedido 99
(100, 300.00, 'Transferencia'), -- Pago del pedido 100
(101, 1000.00, 'Efectivo'), -- Pago del pedido 101
(102, 600.00, 'Tarjeta'), -- Pago del pedido 102
(103, 120.00, 'Transferencia'), -- Pago del pedido 103
(104, 700.00, 'Efectivo'), -- Pago del pedido 104
(105, 150.00, 'Tarjeta'), -- Pago del pedido 105
(106, 450.00, 'Tarjeta'), -- Pago del pedido 106
(107, 700.00, 'Transferencia'), -- Pago del pedido 107
(108, 200.00, 'Efectivo'), -- Pago del pedido 108
(109, 450.00, 'Tarjeta'), -- Pago del pedido 109
(110, 350.00, 'Transferencia'), -- Pago del pedido 110
(111, 1200.00, 'Efectivo'), -- Pago del pedido 111
(112, 550.00, 'Tarjeta'), -- Pago del pedido 112
(113, 130.00, 'Transferencia'), -- Pago del pedido 113
(114, 750.00, 'Efectivo'), -- Pago del pedido 114
(115, 330.00, 'Tarjeta'), -- Pago del pedido 115
(116, 900.00, 'Transferencia'), -- Pago del pedido 116
(117, 240.00, 'Efectivo'), -- Pago del pedido 117
(118, 500.00, 'Tarjeta'), -- Pago del pedido 118
(119, 400.00, 'Transferencia'), -- Pago del pedido 119
(120, 800.00, 'Efectivo'), -- Pago del pedido 120
(121, 350.00, 'Tarjeta'), -- Pago del pedido 121
(122, 60.00, 'Transferencia'), -- Pago del pedido 122
(123, 800.00, 'Efectivo'), -- Pago del pedido 123
(124, 450.00, 'Tarjeta'), -- Pago del pedido 124
(125, 1000.00, 'Transferencia'), -- Pago del pedido 125
(126, 220.00, 'Efectivo'), -- Pago del pedido 126
(127, 480.00, 'Tarjeta'), -- Pago del pedido 127
(128, 500.00, 'Transferencia'), -- Pago del pedido 128
(129, 1100.00, 'Efectivo'), -- Pago del pedido 129
(130, 400.00, 'Tarjeta'), -- Pago del pedido 130
(131, 800.00, 'Tarjeta'),
(132, 350.00, 'Efectivo'),
(133, 200.00, 'Transferencia'),
(134, 700.00, 'Tarjeta'),
(135, 300.00, 'Efectivo'),
(136, 750.00, 'Tarjeta'), -- Pago del pedido 136
(137, 1500.00, 'Transferencia'), -- Pago del pedido 137
(138, 260.00, 'Efectivo'), -- Pago del pedido 138
(139, 600.00, 'Tarjeta'), -- Pago del pedido 139
(140, 300.00, 'Transferencia'), -- Pago del pedido 140
(141, 900.00, 'Efectivo'), -- Pago del pedido 141
(142, 250.00, 'Tarjeta'), -- Pago del pedido 142
(143, 150.00, 'Transferencia'), -- Pago del pedido 143
(144, 700.00, 'Efectivo'), -- Pago del pedido 144
(145, 520.00, 'Tarjeta'), -- Pago del pedido 145
(146, 2000.00, 'Transferencia'), -- Pago del pedido 146
(147, 400.00, 'Efectivo'), -- Pago del pedido 147
(148, 800.00, 'Tarjeta'), -- Pago del pedido 148
(149, 400.00, 'Transferencia'), -- Pago del pedido 149
(150, 500.00, 'Efectivo'), -- Pago del pedido 150
(151, 350.00, 'Tarjeta'), -- Pago del pedido 151
(152, 180.00, 'Transferencia'), -- Pago del pedido 152
(153, 900.00, 'Efectivo'), -- Pago del pedido 153
(154, 1100.00, 'Tarjeta'), -- Pago del pedido 154
(155, 1800.00, 'Transferencia'), -- Pago del pedido 155
(156, 300.00, 'Efectivo'), -- Pago del pedido 156
(157, 1000.00, 'Tarjeta'), -- Pago del pedido 157
(158, 500.00, 'Transferencia'), -- Pago del pedido 158
(159, 1200.00, 'Efectivo'), -- Pago del pedido 159
(160, 450.00, 'Tarjeta'), -- Pago del pedido 160
(161, 200.00, 'Transferencia'), -- Pago del pedido 161
(162, 1200.00, 'Efectivo'), -- Pago del pedido 162
(163, 400.00, 'Tarjeta'), -- Pago del pedido 163
(164, 1700.00, 'Transferencia'), -- Pago del pedido 164
(165, 200.00, 'Efectivo'), -- Pago del pedido 165
(166, 1500.00, 'Tarjeta'), -- Pago del pedido 166
(167, 600.00, 'Transferencia'), -- Pago del pedido 167
(168, 1500.00, 'Efectivo'), -- Pago del pedido 168
(169, 400.00, 'Tarjeta'), -- Pago del pedido 169
(170, 120.00, 'Transferencia'), -- Pago del pedido 170
(171, 2000.00, 'Efectivo'), -- Pago del pedido 171
(172, 580.00, 'Tarjeta'), -- Pago del pedido 172
(173, 1600.00, 'Transferencia'), -- Pago del pedido 173
(174, 360.00, 'Efectivo'), -- Pago del pedido 174
(175, 1200.00, 'Tarjeta'), -- Pago del pedido 175
(176, 1200.00, 'Transferencia'), -- Pago del pedido 176
(177, 1200.00, 'Efectivo'), -- Pago del pedido 177
(178, 1200.00, 'Tarjeta'), -- Pago del pedido 178
(179, 1200.00, 'Transferencia'), -- Pago del pedido 179
(180, 1200.00, 'Efectivo'); -- Pago del pedido 180
SELECT * FROM Pagos

INSERT INTO Pagos (PedidoID, Monto, MetodoPago) 
VALUES 
(181, 450.00, 'Tarjeta'), -- Pago del pedido 181
(182, 320.00, 'Transferencia'), -- Pago del pedido 182
(183, 280.00, 'Efectivo'), -- Pago del pedido 183
(184, 600.00, 'Tarjeta'), -- Pago del pedido 184
(185, 150.00, 'Transferencia'), -- Pago del pedido 185
-- (50 pagos adicionales)
(186, 620.00, 'Tarjeta'),
(187, 800.00, 'Transferencia'),
(188, 180.00, 'Efectivo'),
(189, 400.00, 'Tarjeta'),
(190, 300.00, 'Transferencia'),
(191, 1000.00, 'Efectivo'),
(192, 600.00, 'Tarjeta'),
(193, 120.00, 'Transferencia'),
(194, 700.00, 'Efectivo'),
(195, 450.00, 'Tarjeta'),
(196, 700.00, 'Transferencia'),
(197, 200.00, 'Efectivo'),
(198, 450.00, 'Tarjeta'),
(199, 350.00, 'Transferencia'),
(200, 1200.00, 'Efectivo'),
(201, 550.00, 'Tarjeta'),
(202, 130.00, 'Transferencia'),
(203, 750.00, 'Efectivo'),
(204, 330.00, 'Tarjeta'),
(205, 900.00, 'Transferencia'),
(206, 240.00, 'Efectivo'),
(207, 500.00, 'Tarjeta'),
(208, 400.00, 'Transferencia'),
(209, 800.00, 'Efectivo'),
(210, 350.00, 'Tarjeta'),
(211, 60.00, 'Transferencia'),
(212, 800.00, 'Efectivo'),
(213, 450.00, 'Tarjeta'),
(214, 1000.00, 'Transferencia'),
(215, 220.00, 'Efectivo'),
(216, 480.00, 'Tarjeta'),
(217, 500.00, 'Transferencia'),
(218, 1100.00, 'Efectivo'),
(219, 400.00, 'Tarjeta'),
(220, 120.00, 'Transferencia'),
(221, 750.00, 'Efectivo'),
(222, 750.00, 'Tarjeta'),
(223, 1500.00, 'Transferencia'),
(224, 260.00, 'Efectivo'),
(225, 600.00, 'Tarjeta'),
(226, 300.00, 'Transferencia'),
(227, 900.00, 'Efectivo'),
(228, 250.00, 'Tarjeta'),
(229, 150.00, 'Transferencia'),
(230, 700.00, 'Efectivo');