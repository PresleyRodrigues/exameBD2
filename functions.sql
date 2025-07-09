Use exameBD2;
DELIMITER //
CREATE FUNCTION CalcularMediaPonderada(
    aluno_id INT,
    disciplina_id INT
) 
RETURNS DECIMAL(4,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(4,2);
    
    SELECT SUM(nota * peso) / SUM(peso)
    INTO media
    FROM Avaliacao a
    JOIN Matricula m ON a.matricula_id = m.id
    WHERE m.aluno_id = aluno_id
    AND a.disciplina_id = disciplina_id;
    
    RETURN COALESCE(media, 0);
END //
DELIMITER ;

DELIMITER //
CREATE FUNCTION CalcularSLAMensal(
    contrato_id INT,
    mes INT,
    ano INT
)
RETURNS DECIMAL(5,2)
DETERMINISTIC
BEGIN
    DECLARE sla DECIMAL(5,2);
    
    SELECT AVG(sla_efetivo)
    INTO sla
    FROM Pagamento
    WHERE contrato_id = contrato_id
    AND MONTH(data) = mes
    AND YEAR(data) = ano;
    
    RETURN COALESCE(sla, 0);
END //
DELIMITER ;
