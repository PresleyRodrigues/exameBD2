Use exameBD2;
CREATE VIEW GradeHorariaCurso AS
SELECT 
    c.nome AS curso,
    d.nome AS disciplina,
    t.sala,
    t.horario_inicio,
    t.horario_fim,
    f.nome AS professor
FROM Curso c
JOIN Disciplina d ON c.id = d.curso_id
JOIN Turma t ON d.id = t.disciplina_id
LEFT JOIN Alocacao a ON t.id = a.turma_id
LEFT JOIN Professor p ON a.professor_id = p.id
LEFT JOIN Funcionario f ON p.funcionario_id = f.id;

CREATE VIEW CargaHorariaProfessor AS
SELECT 
    f.nome AS professor,
    SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(t.horario_fim, t.horario_inicio)))) AS total_horas,
    COUNT(t.id) AS num_turmas
FROM Alocacao a
JOIN Professor p ON a.professor_id = p.id
JOIN Funcionario f ON p.funcionario_id = f.id
JOIN Turma t ON a.turma_id = t.id
WHERE a.aprovado = TRUE
GROUP BY a.professor_id;

CREATE VIEW ResumoServicosMensal AS
SELECT 
    e.nome AS empresa,
    e.tipo_servico,
    YEAR(p.data) AS ano,
    MONTH(p.data) AS mes,
    COUNT(p.id) AS num_pagamentos,
    SUM(p.valor_contratado) AS valor_contratado,
    SUM(p.multa) AS total_multas,
    SUM(p.valor_pago) AS valor_liquido,
    AVG(p.sla_efetivo) AS sla_medio
FROM Pagamento p
JOIN Contrato c ON p.contrato_id = c.id
JOIN Empresa e ON c.empresa_id = e.id
GROUP BY e.id, ano, mes;