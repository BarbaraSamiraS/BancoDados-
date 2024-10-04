-- Barbara Samira Santiesteban Saravia
-- Rebeca Elaine Pimentel da Silva

USE db_escolaIdiomas

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Exercic�os com SubQuerys Escola de Idiomas

-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1- Criar uma consulta que retorne o nome e o pre�o dos cursos que custem abaixo do valor m�dio .
-- o Valor m�dio seria de: 444 e uns quebrados.

	SELECT nomeCurso AS 'Nome do Curso', valorCurso AS 'Valor do Curso' FROM tblCurso
		WHERE valorCurso < (SELECT AVG(valorCurso) FROM tblCurso)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 2- Criar uma consulta que retorne o nome e o rg do aluno mais novo.

	SELECT nomeAluno AS 'Nome do Aluno mais novo', rgAluno AS 'RG do Aluno' FROM tblAluno
		WHERE dataNascAluno = (SELECT MAX(dataNascAluno) FROM tblAluno)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 3- Criar uma consulta que retorne o nome do aluno mais velho.

	SELECT nomeAluno AS 'Nome do Aluno mais velho' FROM tblAluno
		WHERE dataNascAluno = (SELECT MIN(dataNascAluno) FROM tblAluno)

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 4- Criar uma consulta que retorne o nome e o valor do curso mais caro

	SELECT nomeCurso AS 'Nome do Curso', valorCurso AS 'Valor do Curso' FROM tblCurso.
		WHERE valorCurso = (SELECT MAX(valorCurso) FROM tblCurso)

---------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 5- Criar uma consulta que retorne o nome do aluno e o nome do curso, do aluno que fez a �ltima matr�cula.

	SELECT nomeAluno AS 'Nome do Aluno', nomeCurso AS 'Nome do Curso' FROM tblAluno
		INNER JOIN tblMatricula ON tblMatricula.idAluno = tblAluno.idAluno
			INNER JOIN tblTurma ON tblMatricula.idTurma = tblTurma.idTurma
				INNER JOIN tblCurso ON tblTurma.idCurso = tblCurso.idCurso
					WHERE dataMatricula = (SELECT MAX(dataMatricula) FROM tblMatricula)

			----------------------------------------------------------------------------------------------------------------------------------------------------

-- 6- Criar uma consulta que retorne o nome do primeiro aluno a ser matriculado na escola de Idiomas. 

	SELECT nomeAluno AS 'Nome do Aluno' FROM tblAluno
		INNER JOIN tblMatricula ON tblMatricula.idAluno = tblAluno.idAluno
			WHERE dataMatricula = (SELECT MIN(dataMatricula) FROM tblMatricula)

	-------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 7- Criar uma consulta que retorne o nome, rg e data de nascimento de todos os alunos que estejam matriculados no curso de ingl�s.

	SELECT tblAluno.nomeAluno AS 'Nome do Aluno', tblAluno.rgAluno AS 'RG do Aluno', tblAluno.dataNascAluno AS 'Data de Nascimento do Aluno'  FROM tblAluno
			INNER JOIN tblMatricula ON tblAluno.idAluno = tblMatricula.idAluno
				INNER JOIN tblTurma ON tblMatricula.idTurma = tblTurma.idTurma
					INNER JOIN tblCurso ON tblTurma.idCurso = tblCurso.idCurso
						WHERE tblCurso.nomeCurso = 'Ingl�s'

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- SELECTs para visualizar todas as tabelas com todos os valores.

SELECT * FROM tblAluno
SELECT * FROM tblTurma
SELECT * FROM tblCurso
SELECT * FROM tblMatricula
