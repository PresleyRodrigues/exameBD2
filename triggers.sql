Use exameBD2;
DELIMITER //
CREATE TRIGGER ValidarVagaMatricula
BEFORE INSERT ON Matricula
FOR EACH ROW
BEGIN
    DECLARE vagas_disponiveis INT;
    
    SELECT capacidade - COUNT(*) 
    INTO vagas_disponiveis
    FROM Matricula 
    WHERE turma_id = NEW.turma_id;
    
    IF vagas_disponiveis <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Turma sem vagas disponíveis';
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER VerificarSobreposicaoHoraria
BEFORE INSERT ON Alocacao
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM Alocacao a
        JOIN Turma t_existente ON a.turma_id = t_existente.id
        JOIN Turma t_nova ON NEW.turma_id = t_nova.id
        WHERE a.professor_id = NEW.professor_id
        AND t_existente.horario_inicio < t_nova.horario_fim
        AND t_existente.horario_fim > t_nova.horario_inicio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Conflito de horário para este professor';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER audit_matricula_insert
AFTER INSERT ON Matricula
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaMatricula (operacao, matricula_id, usuario)
    VALUES ('INSERT', NEW.id, CURRENT_USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER audit_matricula_update
AFTER UPDATE ON Matricula
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaMatricula (operacao, matricula_id, usuario)
    VALUES ('UPDATE', NEW.id, CURRENT_USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER audit_matricula_delete
AFTER DELETE ON Matricula
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaMatricula (operacao, matricula_id, usuario)
    VALUES ('DELETE', OLD.id, CURRENT_USER());
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER bloqueio_pagamento_sem_garantia
BEFORE INSERT ON Pagamento
FOR EACH ROW
BEGIN
    DECLARE garantia_valida BOOLEAN;
    
    SELECT validade >= CURDATE() 
    INTO garantia_valida
    FROM Garantia 
    WHERE contrato_id = NEW.contrato_id;
    
    IF NOT garantia_valida THEN
        INSERT INTO AuditoriaPagamento (operacao, motivo)
        VALUES ('BLOCK', 'Garantia vencida ou inexistente');
        
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pagamento bloqueado: garantia inválida';
    ELSE
        INSERT INTO AuditoriaPagamento (operacao, pagamento_id)
        VALUES ('INSERT', NEW.id);
    END IF;
END //
DELIMITER ;
