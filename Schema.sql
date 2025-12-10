SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Telefone_Aluno;
DROP TABLE IF EXISTS Pagamento;
DROP TABLE IF EXISTS Avaliacao_Fisica;
DROP TABLE IF EXISTS Aluno_Instrutor;
DROP TABLE IF EXISTS Instrutor;
DROP TABLE IF EXISTS Aluno;
DROP TABLE IF EXISTS Plano;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Plano (
  ID_Plano INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL,
  Valor DECIMAL(10,2) NOT NULL,
  Duracao INT NOT NULL,
  Beneficios VARCHAR(255),
  PRIMARY KEY (ID_Plano)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Aluno (
  CPF CHAR(11) NOT NULL,
  Nome VARCHAR(100) NOT NULL,
  Matricula VARCHAR(20) NOT NULL,
  Data_Nasc DATE,
  Rua VARCHAR(150),
  Numero VARCHAR(20),
  Bairro VARCHAR(80),
  Cidade VARCHAR(80),
  ID_Plano_FK INT,
  PRIMARY KEY (CPF),
  UNIQUE KEY uq_aluno_matricula (Matricula),
  CONSTRAINT fk_aluno_plano FOREIGN KEY (ID_Plano_FK)
    REFERENCES Plano (ID_Plano)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Instrutor (
  Cod_Registro INT NOT NULL AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL,
  Salario DECIMAL(10,2),
  Carga_Horaria INT,
  PRIMARY KEY (Cod_Registro)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Aluno_Instrutor (
  CPF_Aluno_FK CHAR(11) NOT NULL,
  Cod_Registro_FK INT NOT NULL,
  Data_Inicio DATE,
  Data_Fim DATE,
  PRIMARY KEY (CPF_Aluno_FK, Cod_Registro_FK),
  CONSTRAINT fk_ai_aluno FOREIGN KEY (CPF_Aluno_FK)
    REFERENCES Aluno (CPF),
  CONSTRAINT fk_ai_instrutor FOREIGN KEY (Cod_Registro_FK)
    REFERENCES Instrutor (Cod_Registro)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Telefone_Aluno (
  CPF_Aluno_FK CHAR(11) NOT NULL,
  Numero_Telefone VARCHAR(20) NOT NULL,
  Tipo VARCHAR(30),
  PRIMARY KEY (CPF_Aluno_FK, Numero_Telefone),
  CONSTRAINT fk_telefone_aluno FOREIGN KEY (CPF_Aluno_FK)
    REFERENCES Aluno (CPF)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Pagamento (
  ID_Pagamento INT NOT NULL AUTO_INCREMENT,
  Data_Venc DATE,
  Data_Quit DATE,
  Valor DECIMAL(10,2),
  CPF_Aluno_FK CHAR(11),
  PRIMARY KEY (ID_Pagamento),
  CONSTRAINT fk_pagamento_aluno FOREIGN KEY (CPF_Aluno_FK)
    REFERENCES Aluno (CPF)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE Avaliacao_Fisica (
  ID_Avaliacao INT NOT NULL AUTO_INCREMENT,
  Peso DECIMAL(6,2),
  Altura DECIMAL(4,2),
  IMC DECIMAL(5,2),
  Data DATE,
  CPF_Aluno_FK CHAR(11),
  PRIMARY KEY (ID_Avaliacao),
  CONSTRAINT fk_avaliacao_aluno FOREIGN KEY (CPF_Aluno_FK)
    REFERENCES Aluno (CPF)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
