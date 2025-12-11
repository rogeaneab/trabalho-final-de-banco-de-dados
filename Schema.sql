-- CREATE DATABASE academia;
-- \c academia;

-- ============================
-- TABELA PLANO
-- ============================
CREATE TABLE Plano (
    ID_Plano SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Valor NUMERIC(10,2) NOT NULL,
    Duracao INT NOT NULL,
    Beneficios TEXT
);

-- ============================
-- TABELA INSTRUTOR
-- ============================
CREATE TABLE Instrutor (
    Cod_Registro SERIAL PRIMARY KEY,
    Nome VARCHAR(120) NOT NULL,
    Salario NUMERIC(10,2) NOT NULL,
    Carga_Horaria INT NOT NULL
);

-- ============================
-- TABELA ALUNO
-- ============================
CREATE TABLE Aluno (
    CPF VARCHAR(11) PRIMARY KEY,
    Nome VARCHAR(120) NOT NULL,
    Matricula VARCHAR(20) UNIQUE NOT NULL,
    Data_Nasc DATE NOT NULL,
    Rua VARCHAR(120),
    Numero INT,
    Bairro VARCHAR(120),
    Cidade VARCHAR(120),
    ID_Plano_FK INT REFERENCES Plano(ID_Plano)
);

-- ============================
-- TABELA TELEFONE_ALUNO
-- ============================
CREATE TABLE Telefone_Aluno (
    ID_Telefone SERIAL PRIMARY KEY,
    CPF_Aluno_FK VARCHAR(11) REFERENCES Aluno(CPF),
    Numero_Telefone VARCHAR(20) NOT NULL
);

-- ============================
-- TABELA PAGAMENTO
-- ============================
CREATE TABLE Pagamento (
    ID_Pagamento SERIAL PRIMARY KEY,
    Data_Venc DATE NOT NULL,
    Data_Quit DATE,
    Valor NUMERIC(10,2) NOT NULL,
    CPF_Aluno_FK VARCHAR(11) REFERENCES Aluno(CPF)
);

-- ============================
-- TABELA AVALIACAO_FISICA
-- ============================
CREATE TABLE Avaliacao_Fisica (
    ID_Avaliacao SERIAL PRIMARY KEY,
    Peso NUMERIC(5,2) NOT NULL,
    Altura NUMERIC(4,2) NOT NULL,
    IMC NUMERIC(5,2) NOT NULL,
    Data DATE NOT NULL,
    CPF_Aluno_FK VARCHAR(11) REFERENCES Aluno(CPF)
);

