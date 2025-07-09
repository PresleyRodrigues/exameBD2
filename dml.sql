Use exameBD2;
INSERT INTO Departamento (nome, orcamento_anual) VALUES
('Informática', 250000.00),
('Matemática', 180000.00),
('Engenharia Civil', 300000.00),
('Medicina', 500000.00),
('Administração', 200000.00);


INSERT INTO Funcionario (nome, tipo, departamento_id) VALUES
-- Administrativos
('Maria Silva', 'ADMINISTRATIVO', 1),
('Carlos Oliveira', 'ADMINISTRATIVO', 1),
('Ana Santos', 'ADMINISTRATIVO', 2),
('Pedro Costa', 'ADMINISTRATIVO', 3),
('Sofia Pereira', 'ADMINISTRATIVO', 4),
('Miguel Fernandes', 'ADMINISTRATIVO', 5),

-- Professores
('Prof. João Almeida', 'PROFESSOR', 1),
('Prof. Marta Rocha', 'PROFESSOR', 1),
('Prof. António Sousa', 'PROFESSOR', 2),
('Prof. Inês Marques', 'PROFESSOR', 2),
('Prof. Ricardo Lima', 'PROFESSOR', 3),
('Prof. Beatriz Gomes', 'PROFESSOR', 3),
('Prof. Francisco Martins', 'PROFESSOR', 4),
('Prof. Diana Carvalho', 'PROFESSOR', 4),
('Prof. Gonçalo Pinto', 'PROFESSOR', 5),
('Prof. Cláudia Nunes', 'PROFESSOR', 5),
('Prof. Bruno Coelho', 'PROFESSOR', 1),
('Prof. Leonor Fonseca', 'PROFESSOR', 2),
('Prof. Hugo Ramos', 'PROFESSOR', 3),
('Prof. Carolina Matos', 'PROFESSOR', 4),
('Prof. Duarte Cruz', 'PROFESSOR', 5),
('Prof. Raquel Ventura', 'PROFESSOR', 1),
('Prof. Samuel Andrade', 'PROFESSOR', 2),
('Prof. Laura Barros', 'PROFESSOR', 3),
('Prof. Vasco Neves', 'PROFESSOR', 4),
('Prof. Patrícia Guerreiro', 'PROFESSOR', 5);

-- Atualizar chefes de departamento
UPDATE Departamento SET chefe_id = 7 WHERE id = 1;  -- Informática
UPDATE Departamento SET chefe_id = 9 WHERE id = 2;  -- Matemática
UPDATE Departamento SET chefe_id = 11 WHERE id = 3; -- Eng. Civil
UPDATE Departamento SET chefe_id = 13 WHERE id = 4; -- Medicina
UPDATE Departamento SET chefe_id = 15 WHERE id = 5; -- Administração


INSERT INTO Professor (titulacao, funcionario_id) VALUES
('Doutorado', 7), ('Mestre', 8), ('Doutorado', 9), ('Mestre', 10),
('Doutorado', 11), ('Mestre', 12), ('Doutorado', 13), ('Mestre', 14),
('Doutorado', 15), ('Mestre', 16), ('Doutorado', 17), ('Mestre', 18),
('Doutorado', 19), ('Mestre', 20), ('Doutorado', 21), ('Mestre', 22),
('Doutorado', 23), ('Mestre', 24), ('Doutorado', 25), ('Mestre', 26);


INSERT INTO Curso (nome) VALUES
('Engenharia Informática'),
('Matemática Aplicada'),
('Engenharia Civil'),
('Medicina Geral'),
('Gestão de Empresas'),
('Ciência de Dados'),
('Arquitetura'),
('Enfermagem'),
('Marketing Digital'),
('Direito');

INSERT INTO Coordenador (funcionario_id, curso_id) VALUES
(7, 1),  -- Eng. Informática
(9, 2),  -- Matemática
(11, 3), -- Eng. Civil
(13, 4), -- Medicina
(15, 5), -- Gestão
(17, 6), -- Ciência de Dados
(19, 7), -- Arquitetura
(21, 8), -- Enfermagem
(23, 9), -- Marketing
(25, 10);-- Direito

INSERT INTO Disciplina (nome, carga_horaria, curso_id) VALUES
-- Engenharia Informática
('Programação I', 60, 1),
('Bases de Dados', 60, 1),
('Redes de Computadores', 45, 1),
-- Matemática
('Cálculo I', 60, 2),
('Álgebra Linear', 45, 2),
('Estatística', 45, 2),
-- Engenharia Civil
('Mecânica dos Solos', 60, 3),
('Estruturas Metálicas', 45, 3),
('Hidráulica', 45, 3),
-- Medicina
('Anatomia Humana', 90, 4),
('Fisiologia', 90, 4),
('Farmacologia', 60, 4),
-- Gestão
('Contabilidade', 45, 5),
('Gestão Financeira', 45, 5),
('Marketing', 45, 5);

INSERT INTO Turma (capacidade, sala, horario_inicio, horario_fim, disciplina_id) VALUES
(30, 'A101', '08:00:00', '10:00:00', 1),
(25, 'B202', '10:00:00', '12:00:00', 2),
(20, 'C303', '14:00:00', '16:00:00', 3),
(30, 'D404', '08:00:00', '10:00:00', 4),
(25, 'E505', '10:00:00', '12:00:00', 5),
(20, 'F606', '14:00:00', '16:00:00', 6),
(30, 'G707', '08:00:00', '10:00:00', 7),
(25, 'H808', '10:00:00', '12:00:00', 8),
(20, 'I909', '14:00:00', '16:00:00', 9),
(30, 'J101', '08:00:00', '10:00:00', 10),
(25, 'K202', '10:00:00', '12:00:00', 11),
(20, 'L303', '14:00:00', '16:00:00', 12),
(30, 'M404', '08:00:00', '10:00:00', 13),
(25, 'N505', '10:00:00', '12:00:00', 14),
(20, 'O606', '14:00:00', '16:00:00', 15);

-- Gerar 89 alunos
INSERT INTO Aluno (nome, propina_paga) VALUES 
('João Silva', TRUE), ('Maria Santos', TRUE), ('Pedro Costa', TRUE),
('Ana Oliveira', TRUE), ('Carlos Pereira', TRUE), ('Sofia Rodrigues', TRUE),
('Miguel Fernandes', TRUE), ('Inês Martins', TRUE), ('Ricardo Marques', TRUE),
('Beatriz Gonçalves', TRUE), ('Francisco Ferreira', TRUE), ('Diana Sousa', TRUE),
('Gonçalo Pinto', TRUE), ('Cláudia Alves', TRUE), ('Bruno Figueiredo', TRUE),
('Leonor Gomes', TRUE), ('Hugo Ribeiro', TRUE), ('Carolina Carvalho', TRUE),
('Duarte Lopes', TRUE), ('Raquel Teixeira', TRUE), ('Samuel Monteiro', TRUE),
('Laura Moreira', TRUE), ('Vasco Barbosa', TRUE), ('Patrícia Tavares', TRUE),
('Luís Correia', TRUE), ('Marta Lima', TRUE), ('António Machado', TRUE),
('Teresa Freitas', TRUE), ('Jorge Magalhães', TRUE), ('Catarina Azevedo', TRUE),
('Rui Pinheiro', TRUE), ('Helena Neves', TRUE), ('Paulo Coelho', TRUE),
('Irina Mendes', TRUE), ('André Guerreiro', TRUE), ('Eva Domingues', TRUE),
('Nuno Simões', TRUE), ('Liliana Antunes', TRUE), ('Artur Morais', TRUE),
('Vitória Lourenço', TRUE), ('Bernardo Baptista', TRUE), ('Renata Melo', TRUE),
('Filipe Pires', TRUE), ('Yara Andrade', TRUE), ('Xavier Abreu', TRUE),
('Zara Brandão', TRUE), ('Wilson Vasconcelos', TRUE), ('Tânia Fonseca', TRUE),
('Edgar Maia', TRUE), ('Olívia Nascimento', TRUE), ('Ivan Leite', TRUE),
('Nádia Miranda', TRUE), ('Walter Henriques', TRUE), ('Úrsula Campos', TRUE),
('Kevin Cardoso', TRUE), ('Lara Matos', TRUE), ('Dário Faria', TRUE),
('Soraia Garcia', TRUE), ('Ivo Gil', TRUE), ('Noémia Reis', TRUE),
('Alexandre Amorim', TRUE), ('Mónica Paiva', TRUE), ('Valter Cordeiro', TRUE),
('Lúcia Brito', TRUE), ('Orlando Pinho', TRUE), ('Jéssica Frade', TRUE),
('Gaspar Vicente', TRUE), ('Érica Rosa', TRUE), ('Renato Araújo', TRUE),
('Íris Peixoto', TRUE), ('Mauro Bento', TRUE), ('Lara Branco', TRUE),
('Nelson Borges', TRUE), ('Vera Barata', TRUE), ('Marcos Vaz', TRUE),
('Lia Furtado', TRUE), ('Sandro Vale', TRUE), ('Tatiana Resende', TRUE),
('Elias Macedo', TRUE), ('Rosa Lima', TRUE), ('Hélder Rocha', TRUE),
('Júlia Carmo', TRUE), ('Romeu Esteves', TRUE), ('Celeste Mota', TRUE),
('Salomé Nogueira', TRUE), ('Fábio Medeiros', TRUE), ('Anita Craveiro', TRUE);

-- Alocar professores a turmas sem sobreposição
INSERT INTO Alocacao (professor_id, turma_id, aprovado) VALUES
(1, 1, TRUE), (2, 2, TRUE), (3, 3, TRUE),
(4, 4, TRUE), (5, 5, TRUE), (6, 6, TRUE),
(7, 7, TRUE), (8, 8, TRUE), (9, 9, TRUE),
(10, 10, TRUE), (11, 11, TRUE), (12, 12, TRUE),
(13, 13, TRUE), (14, 14, TRUE), (15, 15, TRUE),
(16, 1, FALSE), (17, 4, FALSE), (18, 7, FALSE); 

INSERT INTO Empresa (nome, nif, tipo_servico) VALUES
('Limpezas SA', '123456789', 'LIMPEZA'),
('Segurança Total', '987654321', 'SEGURANCA'),
('Café Académico', '456789123', 'CAFETARIA'),
('Limpeza Express', '321654987', 'LIMPEZA'),
('Vigilância 24h', '789123456', 'SEGURANCA');

INSERT INTO Contrato (empresa_id, data_inicio, data_fim, valor_mensal, sla_esperado) VALUES
(1, '2024-01-01', '2024-12-31', 5000.00, 95.00),
(2, '2024-02-01', '2024-11-30', 7000.00, 98.00),
(3, '2024-03-01', '2025-02-28', 3000.00, 92.00),
(4, '2024-04-01', '2024-10-31', 4500.00, 94.00),
(5, '2024-05-01', '2024-09-30', 6000.00, 96.00),
(1, '2025-01-01', '2025-12-31', 5200.00, 96.00),
(2, '2025-02-01', '2025-11-30', 7200.00, 98.00),
(3, '2025-03-01', '2026-02-28', 3100.00, 93.00),
(4, '2025-04-01', '2025-10-31', 4700.00, 95.00),
(5, '2025-05-01', '2025-09-30', 6200.00, 97.00);


INSERT INTO Garantia (contrato_id, validade, valor) VALUES
(1, '2025-01-31', 10000.00),
(2, '2024-12-31', 15000.00),
(3, '2025-03-31', 8000.00),
(4, '2024-11-30', 12000.00),
(5, '2024-10-31', 14000.00),
(6, '2026-01-31', 11000.00),
(7, '2025-12-31', 16000.00),
(8, '2026-03-31', 8500.00),
(9, '2025-11-30', 12500.00),
(10, '2025-10-31', 14500.00);


INSERT INTO Pagamento (contrato_id, data, valor_contratado, sla_efetivo) VALUES
-- Contrato 1 (SLA acima de 90%)
(1, '2024-01-05', 5000.00, 95.50),
(1, '2024-02-05', 5000.00, 96.00),

-- Contrato 2 (SLA abaixo de 90% em um pagamento)
(2, '2024-02-10', 7000.00, 98.00),
(2, '2024-03-10', 7000.00, 85.00), -- Gerará multa

-- Contrato 3 (SLA variado)
(3, '2024-03-15', 3000.00, 92.50),
(3, '2024-04-15', 3000.00, 91.00),

-- Contrato 4 (SLA acima de 90%)
(4, '2024-04-20', 4500.00, 94.50),
(4, '2024-05-20', 4500.00, 95.00),

-- Contrato 5 (SLA abaixo de 90%)
(5, '2024-05-25', 6000.00, 88.00), -- Gerará multa
(5, '2024-06-25', 6000.00, 89.50); -- Gerará multa



INSERT INTO Auditoria (tabela, operacao, id_registro, usuario) VALUES
('Matricula', 'INSERT', 1, 'admin@isptec.co.ao'),
('Alocacao', 'INSERT', 1, 'coordenador@isptec.co.ao'),
('Pagamento', 'INSERT', 2, 'financeiro@isptec.co.ao'),
('Contrato', 'UPDATE', 3, 'admin@isptec.co.ao'),
('Aluno', 'DELETE', 50, 'secretaria@isptec.co.ao');


INSERT INTO Avaliacao (matricula_id, disciplina_id, data, nota, peso, tipo)
SELECT 
    m.id,
    d.id AS disciplina_id,
    DATE_ADD(t.horario_inicio, INTERVAL FLOOR(RAND() * 60) DAY) AS data,
    ROUND(10 + RAND() * 10, 1) AS nota,  -- Notas entre 10.0 e 20.0
    CASE 
        WHEN RAND() < 0.7 THEN 0.3  -- 70% são trabalhos/pesos menores
        ELSE 0.7  -- 30% são exames importantes
    END AS peso,
    ELT(FLOOR(1 + RAND() * 3), 'Teste', 'Exame', 'Trabalho') AS tipo
FROM Matricula m
JOIN Turma t ON m.turma_id = t.id
JOIN Disciplina d ON t.disciplina_id = d.id;

-- Adicionar algumas notas baixas para diversidade
INSERT INTO Avaliacao (matricula_id, disciplina_id, data, nota, peso, tipo)
SELECT 
    matricula_id,
    disciplina_id,
    DATE_ADD(data, INTERVAL 7 DAY),
    ROUND(5 + RAND() * 5, 1),  -- Notas entre 5.0 e 10.0
    0.7,
    'Exame'
FROM Avaliacao
WHERE RAND() < 0.2  -- 20% dos alunos terão uma nota baixa
LIMIT 50;


-- Exemplo de inserção
INSERT INTO Departamento (nome, orcamento_anual) 
VALUES ('Informática', 150000.00);

INSERT INTO Funcionario (nome, tipo, departamento_id) 
VALUES ('Ana Sousa', 'ADMINISTRATIVO', 1);

-- Atualizar chefe do departamento
UPDATE Departamento SET chefe_id = 1 WHERE id = 1;
-- Matrícula de todos alunos em pelo menos 3 turmas
INSERT INTO Matricula (aluno_id, turma_id, data) 
SELECT 
    a.id AS aluno_id,
    t.id AS turma_id,
    DATE_ADD('2024-09-01', INTERVAL FLOOR(RAND() * 30) DAY) AS data
FROM Aluno a
CROSS JOIN (SELECT id FROM Turma ORDER BY RAND() LIMIT 3) t;