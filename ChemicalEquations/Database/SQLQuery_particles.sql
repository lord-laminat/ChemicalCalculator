DROP TABLE [dbo].[particles];

CREATE TABLE [dbo].[particles]
(
	[Id] INT NOT NULL  IDENTITY(1, 1) PRIMARY KEY, 
    [symbol] NCHAR(16) NOT NULL, 
    [charge] INT NOT NULL, 
    [cation_id] INT, 
    [anion_id] INT,
    [is_soluble] BIT NOT NULL,
);


INSERT INTO [dbo].[particles] (symbol, charge, cation_id, anion_id, is_soluble)
VALUES
-- Особые в-ва
('(H)(OH)',   0, NULL, NULL, 0),
('CO2',   0, NULL, NULL, 0),
('SO2',   0, NULL, NULL, 0),
('NH3',   0, NULL, NULL, 0),

-- Щелочные металлы (растворимы почти всегда)
('(Li)',   1, NULL, NULL, 0),
('(Na)',   1, NULL, NULL, 0),
('(K)',    1, NULL, NULL, 0),

-- Щелочноземельные и переходные металлы
('(Mg)',   2, NULL, NULL, 0),
('(Ca)',   2, NULL, NULL, 0),
('(Sr)',   2, NULL, NULL, 0),
('(Ba)',   2, NULL, NULL, 0),
('(Al)',   3, NULL, NULL, 0),
('(Fe)',   2, NULL, NULL, 0),
('(Fe)',   3, NULL, NULL, 0),
('(Cu)',   1, NULL, NULL, 0),
('(Cu)',   2, NULL, NULL, 0),
('(Zn)',   2, NULL, NULL, 0),
('(Pb)',   2, NULL, NULL, 0),

-- Специфические катионы
('(Ag)',   1, NULL, NULL, 0),
('(NH4)',  1, NULL, NULL, 0),
('(H)',    1, NULL, NULL, 0),
('(Hg)',   1, NULL, NULL, 0),
('(Hg)',   2, NULL, NULL, 0),
('(Sn)',   2, NULL, NULL, 0),
('(Sn)',   4, NULL, NULL, 0),
('(Co)',   2, NULL, NULL, 0),
('(Ni)',   2, NULL, NULL, 0),

-- Редкие катионы
('(Cr)',   2, NULL, NULL, 0),
('(Cr)',   3, NULL, NULL, 0),
('(Mn)',   2, NULL, NULL, 0),
('(Mn)',   4, NULL, NULL, 0),
('(Au)',   1, NULL, NULL, 0),
('(Au)',   3, NULL, NULL, 0),

-- Базовые анионы
('(F)',      -1, NULL, NULL, 0),   -- Фторид
('(Cl)',     -1, NULL, NULL, 0),   -- Хлорид
('(Br)',     -1, NULL, NULL, 0),   -- Бромид
('(I)',      -1, NULL, NULL, 0),   -- Иодид
('(OH)',     -1, NULL, NULL, 0),   -- Гидроксид
('(NO3)',    -1, NULL, NULL, 0),   -- Нитрат
('(CH3COO)', -1, NULL, NULL, 0),   -- Ацетат
('(SO4)',    -2, NULL, NULL, 0),   -- Сульфат
('(SO3)',    -2, NULL, NULL, 0),   -- Сульфит
('(S)',      -2, NULL, NULL, 0),   -- Сульфид
('(CO3)',    -2, NULL, NULL, 0),   -- Карбонат
('(PO4)',    -3, NULL, NULL, 0);   -- Фосфат

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Кислоты (charge = 0)
('(H)(Cl)',      0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(H)(SO4)',     -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 1),
('(H)2(SO3)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)(OH)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = 'SO2'), 1),
('(H)(NO3)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(H)(PO4)',     -2, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(PO4)'), 1),
('(H)(CO3)',     -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 1),
('(H)2(CO3)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)(OH)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = 'CO2'), 1);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Основания
('(Na)(OH)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 1),
('(K)(OH)',      0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 1),
('(Li)(OH)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Li)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 1),
('(Ag)(OH)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 0),
('(Ca)(OH)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 1),
('(Mg)(OH)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 0),
('(Ba)(OH)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 1),
('(Al)(OH)',     2, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 0),
('(NH4)(OH)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)(OH)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = 'NH3'), 1);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Хлориды
('(Na)(Cl)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),   -- NaCl (растворим)
('(K)(Cl)',      0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),      (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),   -- KCl (растворим)
('(Ag)(Cl)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 0),   -- AgCl (нерастворим)
('(NH4)(Cl)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NH4)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(Li)(Cl)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Li)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(Ca)(Cl)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),   -- CaCl+ (растворим)
('(Al)(Cl)',     2, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),   -- AlCl+2 (растворим)
('(Mg)(Cl)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(Ba)(Cl)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(Zn)(Cl)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Бромиды
('(Na)(Br)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),   -- NaCl (растворим)
('(K)(Br)',      0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),      (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),   -- KCl (растворим)
('(Ag)(Br)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 0),   -- AgCl (нерастворим)
('(NH4)(Br)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NH4)'),    (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),
('(Li)(Br)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Li)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),
('(Ca)(Br)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),   -- CaCl+ (растворим)
('(Al)(Br)',     2, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),   -- AlCl+2 (растворим)
('(Mg)(Br)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),
('(Ba)(Br)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1),
('(Zn)(Br)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Br)'), 1);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Иодиды
('(Na)(I)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),   -- NaCl (растворим)
('(K)(I)',      0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),      (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),   -- KCl (растворим)
('(Ag)(I)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 0),   -- AgCl (нерастворим)
('(NH4)(I)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NH4)'),    (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),
('(Li)(I)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Li)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),
('(Ca)(I)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),   -- CaCl+ (растворим)
('(Al)(I)',     2, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),   -- AlCl+2 (растворим)
('(Mg)(I)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),
('(Ba)(I)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1),
('(Zn)(I)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(I)'), 1);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Соли уксусной кислоты
('(Na)(CH3COO)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),   -- NaCl (растворим)
('(K)(CH3COO)',      0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),      (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),   -- KCl (растворим)
('(Ag)(CH3COO)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),   -- AgCl (нерастворим)
('(NH4)(CH3COO)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NH4)'),    (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),
('(Li)(CH3COO)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Li)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),
('(Ca)(CH3COO)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),   -- CaCl+ (растворим)
('(Al)(CH3COO)',     2, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),   -- AlCl+2 (растворим)
('(Mg)(CH3COO)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),
('(Ba)(CH3COO)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1),
('(Zn)(CH3COO)',     1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CH3COO)'), 1);


INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Сульфаты
('(Na)(SO4)',     -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 1),
('(K)(SO4)',     -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 1),
('(Ag)(SO4)',     -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 1),
('(Ca)(SO4)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 1),
('(Mg)(SO4)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 1),
('(Ba)(SO4)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 0),
('(Zn)(SO4)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 1),
('(Pb)(SO4)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Pb)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(SO4)'), 0);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Карбонаты
('(Na)(CO3)',     -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 1),
('(K)(CO3)',     -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 1),
('(Ca)(CO3)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 0),
('(Mg)(CO3)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 0),
('(Ba)(CO3)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 0),
('(Zn)(CO3)',     0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 0),
('(H)2(SO4)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)(SO4)'), 1),
('(Al)(NO3)',     2, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Pb)(CO3)',    0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Pb)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(CO3)'), 0);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- Нитраты
('(H)2(PO4)', -1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)(PO4)'), 1),
('(Na)(NO3)',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(K)(NO3)',   0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),      (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Ag)(NO3)',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Ca)(NO3)',  1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Mg)(NO3)',  1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Ba)(NO3)',  1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Zn)(NO3)',  1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Al)(Cl)2',  1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)(Cl)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),   -- AlCl2+ (растворим)
('(Al)(NO3)2', 1, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)(NO3)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(NH4)(NO3)', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NH4)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Li)(NO3)',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Li)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Pb)(NO3)',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Pb)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1);

INSERT INTO [dbo].[particles] ([symbol], [charge], [cation_id], [anion_id], [is_soluble])
VALUES
-- bug fix
('(H)3(PO4)',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(H)2(PO4)'), 1),
('(Ca)(OH)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)(OH)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 1),
('(Ba)(OH)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)(OH)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 1),
('(Mg)(OH)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)(OH)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 0),
('(Al)(OH)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)(OH)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 0),
('(Al)(OH)3',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)(OH)2'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(OH)'), 0),
('(Ca)(Cl)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)(Cl)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),   -- CaCl₂ (растворим)
('(Al)(Cl)3',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)(Cl)2'),(SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),   -- AlCl3 (растворим)
('(Mg)(Cl)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)(Cl)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(Ba)(Cl)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)(Cl)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(Zn)(Cl)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)(Cl)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 1),
('(Pb)(Cl)2',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Pb)(Cl)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Cl)'), 0),
('(Na)2(SO4)', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)(SO4)'), 1),
('(K)2(SO4)',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)(SO4)'), 1),
('(Ag)2(SO4)', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)(SO4)'), 0),
('(Na)2(CO3)', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Na)(CO3)'), 1),
('(K)2(CO3)',  0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(K)(CO3)'), 1),
('(Ag)2(CO3)', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)'),     (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ag)(CO3)'), 0),
('(Ca)(NO3)2', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ca)(NO3)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Al)(NO3)3', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Al)(NO3)2'),(SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Mg)(NO3)2', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Mg)(NO3)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Ba)(NO3)2', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Ba)(NO3)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Zn)(NO3)2', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Zn)(NO3)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1),
('(Pb)(NO3)2', 0, (SELECT Id FROM [dbo].[particles] WHERE symbol = '(Pb)(NO3)'), (SELECT Id FROM [dbo].[particles] WHERE symbol = '(NO3)'), 1);


SELECT * FROM [dbo].[particles];