DROP TABLE particles;


CREATE TABLE [dbo].[particles]
(
	[Id] INT NOT NULL  IDENTITY(1, 1) PRIMARY KEY, 
    [symbol] NCHAR(16) NOT NULL, 
    [charge] INT NOT NULL, 
    [cation_id] INT NOT NULL, 
    [anionID] INT NOT NULL
);


INSERT INTO particles (symbol, charge, cation_id, anionID)
VALUES
-- Щелочные металлы (растворимы почти всегда)
('(Li)',   1, NULL, NULL, 0),
('(Na)',   1, NULL, NULL, 0),
('(K)',    1, NULL, NULL, 0),
('(Rb)',   1, NULL, NULL, 0),
('(Cs)',   1, NULL, NULL, 0),

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
('(Ni)',   2, NULL, NULL, 0);