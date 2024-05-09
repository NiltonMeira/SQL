--SELECT	
--	 E.Descricao,
--	 S.Nome,
--	 S.Capacidade

--FROM Evento E
--LEFT JOIN Sala S
--on E.IDSala = S.IDSala

--SELECT GETDATE() as Data

--SELECT CONVERT(VARCHAR(10), GETDATE(), 103)AS DATA

--SELECT 
--	E.IDEvento,
--	E.Descricao as DescriçãoEvento,
--	CONVERT(VARCHAR(10), E.DtHrInicio, 103) as DataInicio,
--	CONVERT(VARCHAR(8), E.DtHrInicio, 108) as HoraInicio,
--	CONVERT(VARCHAR(10), E.DtHrFim, 103) as DataInicio,
--	CONVERT(VARCHAR(8), E.DtHrFim, 108) as HoraInicio
--FROM Evento as E
--LEFT JOIN Sala as S
--ON E.IDSala = S.IDSala
--WHERE GETDATE() BETWEEN E.DtHrInicio AND E.DtHrFim

--UPDATE Evento
--SET
--	DtHrInicio = '2024-02-02 13:00',
--	DtHrFim =  '2024-02-02 17:00'
--where IDEvento = '09ZPN89RXV5B'

--SELECT TOP 3
--Nome, IDSala, Capacidade from Sala 
--Order By Capacidade desc

--SELECT 
--	Pessoa.Nome as 'Participante Responsavel',
--	Evento.Descricao as 'Descrição do Evento',
--	CONVERT(VARCHAR(10), Evento.DtHrInicio, 103) as Data,
--	S.Nome	

--FROM EventoPessoa as E
--INNER JOIN Evento
--ON E.IDEvento = Evento.IDEvento

--INNER JOIN Pessoa
--ON E.IDPessoa = Pessoa.IDPessoa

--INNER JOIN Sala as S 
--On Evento.IDSala = S.IDSala
--WHERE E.PapelEvento = 'Responsavel'

--SELECT 
--S.Nome


--SELECT 
--	P.Nome,
--	COUNT(EP.IDEvento) as "Quantidade de Eventos"

--FROM Pessoa AS P
--LEFT JOIN EventoPessoa AS EP
--ON P.IDPessoa = EP.IDPessoa
--Group by P.Nome
--ORDER BY [Quantidade de Eventos] desc

--SELECT 
--	S.Nome as Salas, 
--	E.Descricao as Eventos,
--	S.Capacidade as Capacidade,
--	COUNT(EP.IDPessoa) AS 'Quantidade de participantes',
	
		
--	CASE 
--		WHEN COUNT(EP.IDPessoa) > S.Capacidade THEN 'Ultrapassou o limite'
--		ELSE 'Limite OK'
--	END AS 'Avaliação da capacidade'



--FROM Evento AS E
--INNER JOIN Sala AS S
--ON s.IDSala = E.IDSala

--INNER JOIN EventoPessoa as EP
--ON E.IDEvento = EP.IDEvento
--GROUP BY e.Descricao, s.Nome, s.Capacidade

ALTER FUNCTION FnOldEvent (@eventoProcurado VARCHAR(255))
		RETURNS TABLE AS 
		RETURN (
			SELECT TOP 1
				E.Descricao AS Evento,
				S.Nome as Sala,
				CONVERT(VARCHAR(10), E.DtHrInicio, 103) AS Data,
				CONVERT(VARCHAR(5), E.DtHrInicio, 108) AS HorárioInicio,
				COUNT(EP.IDEventoPessoa) AS Presentes
			
			FROM Evento as E

			INNER JOIN Sala as S
			ON E.IDSala = S.IDSala

			INNER JOIN EventoPessoa as EP 
			ON EP.IDEvento = E.IDEvento

			WHERE EP.Presenca = 1 AND E.Descricao LIKE @eventoProcurado + '%'
			GROUP BY E.DtHrFim, EP.Presenca, E.IDEvento, S.Nome, S.Capacidade, E.Descricao, E.DtHrInicio
			ORDER BY CONVERT(VARCHAR(10), E.DtHrInicio, 103)		
		)


SELECT * FROM FnOldEvent('Aula')