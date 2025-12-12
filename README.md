# Banco de Dados: Gestão de Academia 🏋️
Implementação de um banco de dados completo para gerenciamento de uma academia, incluindo tabelas como Aluno, Instrutor, Plano, Pagamento e Avaliação Física.
O objetivo do sistema é armazenar e organizar informações essenciais da operação, permitindo análises e facilitando o acompanhamento dos alunos, instrutores e rotinas financeiras.

1. Estrutura

1.  **`Create_tables.sql`**: Contém todos os comandos responsáveis da estrutura do banco de dados. Criação das tabelas e os relacionamentos.
2.  **`Tuplas.sql`**: Armazena os arquivos com comandos do povoamento do banco e realizar as manipulações iniciais. Dados da base, registros e validação.
3.  **`Consultas.sql`**: Relatórios e análises. Reune os selects para consultas simples de leitura, consultas complexas, consultas obrigatórias, relatórios e análises.

---
**Principais Consultas**

Total pago por aluno

SELECT a.CPF, a.Nome, SUM(p.Valor) AS TotalPago
FROM Aluno a
LEFT JOIN Pagamento p ON p.CPF_Aluno_FK = a.CPF
GROUP BY a.CPF, a.Nome
ORDER BY TotalPago DESC;

Avaliações por aluno

SELECT a.CPF, a.Nome, COUNT(av.ID_Avaliacao) AS TotalAvaliacoes
FROM Aluno a
LEFT JOIN Avaliacao_Fisica av ON av.CPF_Aluno_FK = a.CPF
GROUP BY a.CPF, a.Nome
ORDER BY TotalAvaliacoes DESC;

Intrutores com mais alunos ativos

SELECT i.Cod_Registro, i.Nome, COUNT(ai.CPF_Aluno_FK) AS TotalAlunos
FROM Instrutor i
LEFT JOIN Aluno_Instrutor ai ON ai.Cod_Registro_FK = i.Cod_Registro
GROUP BY i.Cod_Registro, i.Nome
ORDER BY TotalAlunos DESC;

---

📐 Modelo lógico.
![modelo_logico](https://github.com/user-attachments/assets/df4db0fc-0eb9-4f05-ae35-b64a5e6e9ea2)
