﻿DROP TABLE [dbo].[ions];

CREATE TABLE [dbo].[ions]
(
	[id] INT IDENTITY(1, 1) PRIMARY KEY, 
    [symbol] NCHAR(10) NOT NULL, 
    [charge] INT NOT NULL
);

INSERT INTO [dbo].[ions] (symbol, charge)
VALUES
-- Простые ионы
('H', 1),
('Li', 1),
('Na', 1),
('K', 1),
('Rb', 1),
('Cs', 1),
('Fr', 1),
('Be', 2),
('Mg', 2),
('Ca', 2),
('Sr', 2),
('Ba', 2),
('Ra', 2),
('Al', 3),
('Sc', 3),
('Y', 3),
('La', 3),
('Ac', 3),
('Ti', 4),
('Zr', 4),
('Hf', 4),
('Th', 4),
('V', 5),
('Nb', 5),
('Ta', 5),
('Cr', 3),
('Cr', 6),
('Mo', 6),
('W', 6),
('Mn', 2),
('Mn', 4),
('Mn', 7),
('Fe', 2),
('Fe', 3),
('Co', 2),
('Co', 3),
('Ni', 2),
('Cu', 1),
('Cu', 2),
('Ag', 1),
('Au', 3),
('Zn', 2),
('Cd', 2),
('Hg', 1),
('Hg', 2),
('Ga', 3),
('In', 3),
('Tl', 1),
('Tl', 3),
('Sn', 2),
('Sn', 4),
('Pb', 2),
('Pb', 4),
('Bi', 3),
('Bi', 5),

-- Оксид-ионы и гидроксиды
('O', -2),
('OH', -1),
('O2', -2),

-- Галогениды
('F', -1),
('Cl', -1),
('Br', -1),
('I', -1),
('At', -1),

-- Халькогениды
('S', -2),
('Se', -2),
('Te', -2),
('Po', -2),

-- Азотная группа
('N', -3),
('P', -3),
('As', -3),
('Sb', -3),
('Bi', -3),

-- Кислотные остатки
('NO2', -1),
('NO3', -1),
('SO3', -2),
('SO4', -2),
('S2O3', -2),
('CO3', -2),
('SiO3', -2),
('PO3', -3),
('PO4', -3),
('MnO4', -1),
('MnO4', -2),
('CrO4', -2),
('Cr2O7', -2),
('C2O4', -2),
('CH3COO', -1),
('CN', -1),
('SCN', -1),
('HSO4', -1),  -- гидросульфат (кислая соль серной кислоты)
('HSO3', -1),  -- гидросульфит (кислая соль сернистой кислоты)
('HPO4', -2),  -- гидрофосфат (кислая соль фосфорной кислоты)
('H2PO4', -1), -- дигидрофосфат (кислая соль фосфорной кислоты)
('HC2O4', -1), -- гидрооксалат (кислая соль щавелевой кислоты)
('Cr2O7', -2), -- дихромат (из дихромовой кислоты)
('SiO4', -4),  -- ортосиликат (из ортокремниевой кислоты)
('S2O3', -2),  -- тиосульфат (из тиосерной кислоты)
('C4H4O6', -2), -- тартрат (из винной кислоты)
('C6H5O7', -3), -- цитрат (из лимонной кислоты)
('CH3COO', -1), -- ацетат (из уксусной кислоты, упомянут в [webpage 2])
('MnO4', -1),  -- перманганат (из марганцовой кислоты)
('ClO', -1),   -- гипохлорит (из хлорноватистой кислоты)
('ClO2', -1),  -- хлорит (из хлористой кислоты)
('ClO3', -1),  -- хлорат (из хлорноватой кислоты)
('ClO4', -1),  -- перхлорат (из хлорной кислоты)
('BrO3', -1),  -- бромат (из бромноватой кислоты)
('IO3', -1),   -- иодат (из йодноватой кислоты)

-- Комплексные ионы
('NH4', 1),
('H3O', 1),
('Hg2', 2);


SELECT * FROM [dbo].[ions];