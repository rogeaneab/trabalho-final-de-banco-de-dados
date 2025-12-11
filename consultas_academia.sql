SELECT 
    i.Cod_Registro,
    i.Nome AS Nome_Instrutor,
    COUNT(aul.Data) AS Total_Aulas
FROM Instrutor i
INNER JOIN Aula aul ON i.Cod_Registro = aul.Cod_Instrutor_FK
GROUP BY i.Cod_Registro, i.Nome
HAVING COUNT(aul.Data) > 10
ORDER BY Total_Aulas DESC;

SELECT 
    a1.CPF,
    a1.Nome AS Nome_Aluno,
    a1.Cidade,
    COUNT(au1.Data) AS Total_Aulas
FROM Aluno a1
INNER JOIN Aula au1 ON a1.CPF = au1.CPF_Aluno_FK
GROUP BY a1.CPF, a1.Nome, a1.Cidade
HAVING COUNT(au1.Data) >= ALL (
    SELECT COUNT(au2.Data)
    FROM Aluno a2
    INNER JOIN Aula au2 ON a2.CPF = au2.CPF_Aluno_FK
    WHERE a2.Cidade = a1.Cidade
    GROUP BY a2.CPF
)
ORDER BY a1.Cidade, Total_Aulas DESC;

SELECT 
    a.CPF,
    a.Nome AS Nome_Aluno,
    a.Cidade,
    COUNT(au.Data) AS Total_Aulas
FROM Aluno a
INNER JOIN Aula au ON a.CPF = au.CPF_Aluno_FK
WHERE EXISTS (
    SELECT 1 
    FROM Aula au2 
    WHERE au2.CPF_Aluno_FK = a.CPF
)
AND NOT EXISTS (
    SELECT 1 
    FROM Avaliacao_Fisica av 
    WHERE av.CPF_Aluno_FK = a.CPF
)
GROUP BY a.CPF, a.Nome, a.Cidade
ORDER BY Total_Aulas DESC;

SELECT 
    a.CPF,
    a.Nome,
    a.Cidade
FROM Aluno a
WHERE NOT EXISTS (
    SELECT 1 
    FROM Avaliacao_Fisica av 
    WHERE av.CPF_Aluno_FK = a.CPF
)
ORDER BY a.Nome;

SELECT 
    i.Cod_Registro,
    i.Nome AS Nome_Instrutor,
    COUNT(aul.Data) AS Total_Aulas,
    AVG(DATE_PART('day', CURRENT_DATE - i.Carga_Horaria)) AS Dias_Trabalhados
FROM Instrutor i
LEFT JOIN Aula aul ON i.Cod_Registro = aul.Cod_Instrutor_FK
GROUP BY i.Cod_Registro, i.Nome
ORDER BY Total_Aulas DESC;

SELECT DISTINCT
    a.CPF,
    a.Nome AS Nome_Aluno,
    a.Cidade
FROM Aluno a
WHERE a.Cidade IN ('Fortaleza', 'Caucaia', 'Maracanaú')
ORDER BY a.Nome;

SELECT 
    a.CPF,
    a.Nome AS Nome_Aluno,
    STRING_AGG(DISTINCT t.Numero_telefone, ', ') AS Telefones,
    COUNT(DISTINCT au.ID_Aula) AS Total_Aulas
FROM Aluno a
LEFT JOIN Telefone_Aluno t ON a.CPF = t.CPF_Aluno_FK
LEFT JOIN Aula au ON a.CPF = au.CPF_Aluno_FK
GROUP BY a.CPF, a.Nome
ORDER BY a.Nome;

SELECT DISTINCT
    i.Cod_Registro,
    i.Nome AS Nome_Instrutor,
    a.Cidade,
    COUNT(au.Data) AS Aulas_Na_Cidade
FROM Instrutor i
INNER JOIN Aula au ON i.Cod_Registro = au.Cod_Instrutor_FK
INNER JOIN Aluno a ON au.CPF_Aluno_FK = a.CPF
WHERE a.Cidade IN ('Crateus')
GROUP BY i.Cod_Registro, i.Nome, a.Cidade
ORDER BY i.Nome, a.Cidade;

SELECT 
    a.CPF,
    a.Nome AS Nome_Aluno,
    a.Cidade,
    p.Nome AS Plano,
    i.Nome AS Instrutor
FROM Aluno a
LEFT JOIN Plano p ON a.ID_Plano_FK = p.ID_Plano
LEFT JOIN Instrutor i ON a.Cod_Instrutor_FK = i.Cod_Registro
ORDER BY a.Nome;

SELECT 
    a.CPF,
    a.Nome AS Nome_Aluno,
    COUNT(au.Data) AS Total_Aulas
FROM Aluno a
LEFT JOIN Aula au ON a.CPF = au.CPF_Aluno_FK
GROUP BY a.CPF, a.Nome
ORDER BY Total_Aulas DESC, a.Nome;

SELECT 
    a.CPF,
    a.Nome,
    av.Peso,
    av.Altura,
    av.IMC,
    av.Data
FROM Aluno a
LEFT JOIN Avaliacao_Fisica av ON a.CPF = av.CPF_Aluno_FK
ORDER BY a.Nome, av.Data DESC;

SELECT 
    au.Data,
    a.Nome AS Nome_Aluno,
    i.Nome AS Nome_Instrutor,
    au.Tipo
FROM Aula au
INNER JOIN Aluno a ON au.CPF_Aluno_FK = a.CPF
INNER JOIN Instrutor i ON au.Cod_Instrutor_FK = i.Cod_Registro
WHERE au.Data >= CURRENT_DATE - INTERVAL '1 year'
ORDER BY au.Data DESC;

SELECT 
    a.CPF,
    a.Nome,
    COUNT(DISTINCT av.ID_Avaliacao) AS Tipos_Avaliacao
FROM Aluno a
INNER JOIN Avaliacao_Fisica av ON a.CPF = av.CPF_Aluno_FK
GROUP BY a.CPF, a.Nome
HAVING COUNT(DISTINCT av.ID_Avaliacao) >= 2
ORDER BY a.Nome;

SELECT 
    a.CPF,
    a.Nome AS Nome_Aluno,
    COUNT(au.Data) AS Total_Aulas
FROM Aluno a
LEFT JOIN Aula au ON a.CPF = au.CPF_Aluno_FK
GROUP BY a.CPF, a.Nome
ORDER BY Total_Aulas DESC
LIMIT 10;

SELECT 
    a.CPF,
    a.Nome AS Nome_Aluno,
    COUNT(au.Data) AS Total_Aulas
FROM Aluno a
LEFT JOIN Aula au ON a.CPF = au.CPF_Aluno_FK
GROUP BY a.CPF, a.Nome
ORDER BY Total_Aulas DESC
LIMIT 10;
