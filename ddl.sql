-- Criar basededados
CREATE DATABASE exameBD2;
Use exameBD2;
-- 1. Departamento
CREATE TABLE Departamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    orcamento_anual DECIMAL(12,2),
    chefe_id INT  -- Temporariamente sem FK
);
-- 2. Funcionario
CREATE TABLE Funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo ENUM('ADMINISTRATIVO', 'PROFESSOR') NOT NULL,
    departamento_id INT NOT NULL,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(id)
);
-- 3. Adicionar
ALTER TABLE Departamento
ADD FOREIGN KEY (chefe_id) REFERENCES Funcionario(id);
-- 4. Curso 
CREATE TABLE Curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    coordenador_id INT, 
    FOREIGN KEY (coordenador_id) REFERENCES Funcionario(id)
);
-- 5. Disciplina 
CREATE TABLE Disciplina (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);
-- 6. Professor
CREATE TABLE Professor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulacao VARCHAR(50) NOT NULL,
    funcionario_id INT NOT NULL UNIQUE,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(id)
);
-- 7. Coordenador
CREATE TABLE Coordenador (
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT NOT NULL,
    curso_id INT NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES Funcionario(id),
    FOREIGN KEY (curso_id) REFERENCES Curso(id)
);
-- 8. Turma
CREATE TABLE Turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    capacidade INT NOT NULL,
    sala VARCHAR(20) NOT NULL,
    horario_inicio TIME NOT NULL,
    horario_fim TIME NOT NULL,
    disciplina_id INT NOT NULL,
    CHECK (horario_inicio < horario_fim),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id)
);
-- 9. Aluno
CREATE TABLE Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    propina_paga BOOLEAN DEFAULT FALSE
);
-- 10. Matricula
CREATE TABLE Matricula (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aluno_id INT NOT NULL,
    turma_id INT NOT NULL,
    data DATE NOT NULL,
    status ENUM('ATIVA', 'CANCELADA') DEFAULT 'ATIVA',
    FOREIGN KEY (aluno_id) REFERENCES Aluno(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id)
);
-- 11. Alocacao
CREATE TABLE Alocacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    professor_id INT NOT NULL,
    turma_id INT NOT NULL,
    aprovado BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (professor_id) REFERENCES Professor(id),
    FOREIGN KEY (turma_id) REFERENCES Turma(id)
);
-- 12. Empresa
CREATE TABLE Empresa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nif VARCHAR(20) UNIQUE NOT NULL,
    tipo_servico ENUM('LIMPEZA', 'SEGURANCA', 'CAFETARIA') NOT NULL
);
-- 13. Contrato
CREATE TABLE Contrato (
    id INT PRIMARY KEY AUTO_INCREMENT,
    empresa_id INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL,
    sla_esperado DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (empresa_id) REFERENCES Empresa(id)
);
-- 14. Garantia
CREATE TABLE Garantia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contrato_id INT NOT NULL UNIQUE,
    validade DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (contrato_id) REFERENCES Contrato(id)
);
-- 15. Pagamento
CREATE TABLE Pagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    contrato_id INT NOT NULL,
    data DATE NOT NULL,
    valor_contratado DECIMAL(10,2) NOT NULL,
    sla_efetivo DECIMAL(5,2) NOT NULL,
    multa DECIMAL(10,2) GENERATED ALWAYS AS (
        CASE WHEN sla_efetivo < 90 THEN valor_contratado * 0.1 ELSE 0 END
    ) STORED,
    valor_pago DECIMAL(10,2) GENERATED ALWAYS AS (valor_contratado - multa) STORED,
    FOREIGN KEY (contrato_id) REFERENCES Contrato(id)
);
-- 16. Auditoria
CREATE TABLE Auditoria (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tabela VARCHAR(50) NOT NULL,
    operacao ENUM('INSERT','UPDATE','DELETE') NOT NULL,
    id_registro INT NOT NULL,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(100) NOT NULL
);
-- 16. Avaliação
CREATE TABLE Avaliacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    matricula_id INT NOT NULL,
    disciplina_id INT NOT NULL,
    data DATE NOT NULL,
    nota DECIMAL(4,2) NOT NULL CHECK (nota BETWEEN 0 AND 20),  -- RN03
    peso DECIMAL(3,2) NOT NULL DEFAULT 1.00,
    tipo ENUM('Teste', 'Exame', 'Trabalho') NOT NULL,
    FOREIGN KEY (matricula_id) REFERENCES Matricula(id),
    FOREIGN KEY (disciplina_id) REFERENCES Disciplina(id)
);
-- 17. AuditoriaMatricula
CREATE TABLE AuditoriaMatricula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    operacao ENUM('INSERT','UPDATE','DELETE'),
    matricula_id INT,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(100)
);
-- 17.  auditoria
CREATE TABLE AuditoriaPagamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    operacao ENUM('INSERT','BLOCK'),
    pagamento_id INT,
    motivo VARCHAR(255),
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
