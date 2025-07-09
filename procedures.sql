Use exameBD2;
DELIMITER //
CREATE PROCEDURE MatricularAluno(
    IN aluno_id INT,
    IN turma_id INT
)
BEGIN
    DECLARE vagas_disponiveis INT DEFAULT 0;
    DECLARE pagamento_efetuado BOOLEAN DEFAULT FALSE;
    DECLARE capacidade_turma INT;
    
    SELECT capacidade INTO capacidade_turma 
    FROM Turma 
    WHERE id = turma_id;
    
    SELECT capacidade_turma - COUNT(*) 
    INTO vagas_disponiveis 
    FROM Matricula 
    WHERE turma_id = turma_id
    AND status = 'ATIVA';
    
    SELECT propina_paga INTO pagamento_efetuado 
    FROM Aluno 
    WHERE id = aluno_id;
    
    IF vagas_disponiveis > 0 AND pagamento_efetuado THEN
        INSERT INTO Matricula (aluno_id, turma_id, data) 
        VALUES (aluno_id, turma_id, CURDATE());
    ELSE
        IF vagas_disponiveis <= 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Turma sem vagas disponíveis';
        ELSE
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Propina não paga';
        END IF;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AlocarProfessor(
    IN professor_id INT,
    IN turma_id INT
)
BEGIN
    DECLARE horario_inicio_novo TIME;
    DECLARE horario_fim_novo TIME;
    

    SELECT horario_inicio, horario_fim 
    INTO horario_inicio_novo, horario_fim_novo
    FROM Turma 
    WHERE id = turma_id;
    

    IF EXISTS (
        SELECT 1 
        FROM Alocacao a
        JOIN Turma t ON a.turma_id = t.id
        WHERE a.professor_id = professor_id
        AND t.horario_inicio < horario_fim_novo
        AND t.horario_fim > horario_inicio_novo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Professor já alocado em horário sobreposto';
    ELSE
        INSERT INTO Alocacao (professor_id, turma_id, aprovado) 
        VALUES (professor_id, turma_id, FALSE); 
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ProcessarPagamento(
    IN contrato_id INT,
    IN data_pagamento DATE,
    IN valor_contratado DECIMAL(10,2),
    IN sla_efetivo DECIMAL(5,2)
)
BEGIN
    DECLARE garantia_valida BOOLEAN;
    
    SELECT validade >= CURDATE() 
    INTO garantia_valida
    FROM Garantia 
    WHERE contrato_id = contrato_id;
    
    IF NOT garantia_valida THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pagamento bloqueado: garantia vencida';
    ELSE
        INSERT INTO Pagamento (contrato_id, data, valor_contratado, sla_efetivo)
        VALUES (contrato_id, data_pagamento, valor_contratado, sla_efetivo);
    END IF;
END //
DELIMITER ;
