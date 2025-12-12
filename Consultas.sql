SELECT a.CPF, a.Nome, SUM(p.Valor) AS TotalPago
FROM Aluno a
LEFT JOIN Pagamento p ON p.CPF_Aluno_FK = a.CPF
GROUP BY a.CPF, a.Nome
ORDER BY TotalPago DESC;

SELECT i.Cod_Registro, i.Nome, AVG(av.Nota) AS MediaAvaliacoes
FROM Instrutor i
LEFT JOIN Avaliacao av ON av.Cod_Instrutor_FK = i.Cod_Registro
GROUP BY i.Cod_Registro, i.Nome
ORDER BY MediaAvaliacoes DESC;

SELECT a.CPF, a.Nome, COUNT(au.ID_Aula) AS TotalAulas
FROM Aluno a
JOIN Aula au ON au.CPF_Aluno_FK = a.CPF
GROUP BY a.CPF, a.Nome
HAVING COUNT(au.ID_Aula) > 10
ORDER BY TotalAulas DESC;

SELECT i.Cod_Registro, i.Nome
FROM Instrutor i
WHERE NOT EXISTS (
    SELECT 1 
    FROM Avaliacao av 
    WHERE av.Cod_Instrutor_FK = i.Cod_Registro
);

SELECT *
FROM Aula
WHERE Duracao > (
    SELECT AVG(Duracao) FROM Aula
);

SELECT a.CPF, a.Nome
FROM Aluno a
LEFT JOIN Pagamento p ON p.CPF_Aluno_FK = a.CPF
WHERE p.ID_Pagamento IS NULL;

SELECT i.Nome, av.Nota
FROM Instrutor i
JOIN Avaliacao av ON av.Cod_Instrutor_FK = i.Cod_Registro
WHERE av.Nota >= ALL (
    SELECT Nota FROM Avaliacao
);

SELECT a.CPF, a.Nome
FROM Aluno a
WHERE a.CPF IN (
    SELECT CPF_Aluno_FK
    FROM Avaliacao
);

SELECT i.Cod_Registro, i.Nome, COUNT(au.ID_Aula) AS TotalAulas
FROM Instrutor i
LEFT JOIN Aula au ON au.Cod_Instrutor_FK = i.Cod_Registro
GROUP BY i.Cod_Registro, i.Nome
ORDER BY TotalAulas DESC;

SELECT 
    au.ID_Aula,
    au.Data_Aula,
    a.Nome AS NomeAluno,
    i.Nome AS NomeInstrutor,
    au.Tipo_Aula
FROM Aula au
INNER JOIN Aluno a ON au.CPF_Aluno_FK = a.CPF
INNER JOIN Instrutor i ON au.Cod_Instrutor_FK = i.Cod_Registro
ORDER BY au.Data_Aula DESC;
