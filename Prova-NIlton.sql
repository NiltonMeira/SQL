-- Quest�o 3 ----------------------------------------------------------------------------

CREATE DATABASE MUNDO -- Cria��o do database

USE MUNDO
GO

CREATE TABLE PAIS--Cria��o das tabelas
( 
	Pais VARCHAR(35) NOT NULL PRIMARY KEY,
	Continente VARCHAR(35) NOT NULL,
	Popula��o FLOAT NOT NULL,
	PIB FLOAT NOT NULL,
	Expect_Vida FLOAT NOT NULL
)
GO

CREATE TABLE CIDADE
(
	Cidade VARCHAR(35) NOT NULL PRIMARY KEY,
	Pais VARCHAR(35) FOREIGN KEY REFERENCES PAIS(Pais),
	Popula��o FLOAT NOT NULL,
	Capital BIT NOT NULL
)
GO

CREATE TABLE RIO
(
	Rio VARCHAR(35) NOT NULL PRIMARY KEY,
	Nascente VARCHAR(35) FOREIGN KEY REFERENCES PAIS(Pais),
	Pais VARCHAR(35) FOREIGN KEY REFERENCES PAIS(Pais),
	Comprimento FLOAT NOT NULL
)
GO

INSERT INTO PAIS VALUES ('Canada', 'America do Norte', 38.25, 1.9, 82) -- Inser��o de dados
INSERT INTO PAIS VALUES ('Mexico', 'America do Norte', 126.7, 1.65, 75)
INSERT INTO PAIS VALUES ('Brasil', 'America do Sul', 214.3, 1.608, 75.5)
INSERT INTO PAIS VALUES ('USA', 'America do Norte', 331.9, 21.43, 76.1)
INSERT INTO PAIS VALUES ('China', 'Asia', 1444.2, 14.34, 83)
INSERT INTO PAIS VALUES ('Alemanha', 'Europa', 83.2, 4.1, 78.1)

-- SELECT * FROM PAIS

INSERT INTO CIDADE VALUES ('Washington', 'USA', 3.3, 1)
INSERT INTO CIDADE VALUES ('Monterrey', 'Mexico', 2.0, 0)
INSERT INTO CIDADE VALUES ('Brasilia', 'Brasil', 1.5, 1)
INSERT INTO CIDADE VALUES ('S�o Paulo', 'Brasil', 15.0,0)
INSERT INTO CIDADE VALUES ('Ottawa', 'Canada', 0.8, 1)
INSERT INTO CIDADE VALUES ('Cid. Mexico', 'Mexico', 14.1, 1)
INSERT INTO CIDADE VALUES ('Pequim', 'China', 21.5, 1)

-- SELECT *FROM CIDADE

INSERT INTO RIO VALUES ('St. Lawrence', 'USA', 'USA', 3.3)
INSERT INTO RIO VALUES ('Grande', 'USA', 'Mexico', 2.0)
INSERT INTO RIO VALUES ('Parana', 'Brasil', 'Brasil',1.5)
INSERT INTO RIO VALUES ('Mississipi', 'USA', 'USA', 15.0)

-- SELECT * FROM RIO

-- Quest�o 4 ----------------------------------------------------------------------------

Select 
	P.Continente,
	AVG(P.PIB) AS PIB

FROM PAIS P
GROUP BY P.Continente

-- Quest�o 5 ----------------------------------------------------------------------------

SELECT TOP 1
	P.Continente,
	R.Comprimento

FROM RIO R 
INNER JOIN PAIS P
ON R.Pais = P.Pais

ORDER BY R.Comprimento DESC

-- Quest�o 6 ----------------------------------------------------------------------------

CREATE TRIGGER exclus�o ON PAIS
INSTEAD OF DELETE
AS 
BEGIN 
	DECLARE @pais_excluido VARCHAR(35)
	SELECT @pais_excluido = Pais FROM deleted
	DELETE FROM CIDADE WHERE Pais = @pais_excluido
	DELETE FROM RIO WHERE Pais = @pais_excluido
	DELETE FROM PAIS WHERE Pais = @pais_excluido	
END 

-- Quest�o 7 ----------------------------------------------------------------------------

CREATE FUNCTION SearchPais (@Nome VARCHAR(35))
RETURNS TABLE AS 
RETURN (SELECT * FROM PAIS WHERE Pais LIKE @Nome+'%')

SELECT * FROM SearchPais('Mexi')

-- Quest�o 8 ----------------------------------------------------------------------------

ALTER TABLE PAIS  
ADD pib_per_capta FLOAT

UPDATE PAIS
SET pib_per_capta = PIB/Popula��o

-- Quest�o 9 ----------------------------------------------------------------------------

SELECT 
	P.Pais,
	p.Popula��o,
	(SELECT 
	Case WHEN p.Popula��o >= SUM(Popula��o) / COUNT(Pais)
	THEN 'Acima da m�dia'
	else 'Abaixo da m�dia'	
	END 

	FROM PAIS 
	)	

FROM PAIS P
GROUP BY P.Pais, P.Popula��o


SELECT 
	C.Cidade,
	C.Popula��o,
	(SELECT 
	Case WHEN c.Popula��o >= SUM(Popula��o) / COUNT(Cidade)
	THEN 'Acima da m�dia'
	else 'Abaixo da m�dia'	
	END 

	FROM CIDADE 
	)	

FROM CIDADE C
GROUP BY C.Cidade, C.Popula��o

