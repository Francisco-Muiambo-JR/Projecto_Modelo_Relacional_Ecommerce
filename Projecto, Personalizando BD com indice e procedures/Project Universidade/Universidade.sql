CREATE DATABASE Universidade;
USE Universidade;

-- Criar tabela de Alunos
CREATE TABLE Alunos (
    idAluno INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    DataNascimento DATE,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Criar tabela de Cursos
CREATE TABLE Cursos (
    idCurso INT AUTO_INCREMENT PRIMARY KEY,
    NomeCurso VARCHAR(100) NOT NULL,
    CargaHoraria INT NOT NULL
);

-- Criar tabela de Matrículas (Relacionando Alunos e Cursos)
CREATE TABLE Matriculas (
    idMatricula INT AUTO_INCREMENT PRIMARY KEY,
    idAluno INT,
    idCurso INT,
    DataMatricula DATE,
    FOREIGN KEY (idAluno) REFERENCES Alunos(idAluno) ON DELETE CASCADE,
    FOREIGN KEY (idCurso) REFERENCES Cursos(idCurso) ON DELETE CASCADE
);



