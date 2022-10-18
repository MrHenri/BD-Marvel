-- global variable for recursive control
CREATE OR REPLACE PACKAGE STATE
IS
    g_recursing  boolean := FALSE;
END;

-- after insert trigger for Herois
-- Ao inserir um heroi, inseri-lo também na tabela de Comuns
CREATE OR REPLACE TRIGGER inserir_heroi
AFTER INSERT
ON Herois
FOR EACH ROW
DECLARE
    any_comum NUMBER;
BEGIN
    SELECT COUNT(*) INTO any_comum FROM Comuns WHERE heroi = :NEW.heroi;
    IF any_comum = 0 AND not state.g_recursing THEN
        state.g_recursing := true;
        INSERT INTO Comuns(heroi, especialidade) VALUES (:NEW.heroi, ' '); --(Herança Total)
        state.g_recursing := false;
    END IF;
END;

-- before insert trigger for Comuns
-- Ao inserir um heroi diretamente na tabela de Comuns, inseri-lo também na super-entidade
CREATE OR REPLACE TRIGGER inserir_comum
BEFORE INSERT
ON Comuns
FOR EACH ROW
DECLARE
    any_heroi NUMBER;
    pragma autonomous_transaction;
BEGIN
    SELECT COUNT(*) INTO any_heroi FROM Herois WHERE heroi = :NEW.heroi;
    IF any_heroi = 0 AND not state.g_recursing THEN
        state.g_recursing := true;
        INSERT INTO Herois(heroi) VALUES (:NEW.heroi);
        COMMIT;
        state.g_recursing := false;
    END IF;
END;

-- before insert trigger for Superes
-- Ao inserir um heroi diretamente na tabela de Superes,
-- inseri-lo também na super-entidade
-- e Inserir o poder associado caso não exista na tabela de Poderes
CREATE OR REPLACE TRIGGER inserir_super_bf
BEFORE INSERT
ON Superes
FOR EACH ROW
DECLARE
    any_heroi NUMBER;
    any_poder NUMBER;
    pragma autonomous_transaction;
BEGIN
    SELECT COUNT(*) INTO any_heroi FROM Herois WHERE heroi = :NEW.heroi;
    IF any_heroi = 0 AND not state.g_recursing THEN
        state.g_recursing := true;
        INSERT INTO Herois(heroi) VALUES (:NEW.heroi);
        COMMIT;
        state.g_recursing := false;
    END IF;

    SELECT COUNT(*) INTO any_poder FROM Poderes WHERE poder = :NEW.poder AND grau = :NEW.grau;
    IF any_poder = 0 THEN
        INSERT INTO Poderes(poder, grau) VALUES (:NEW.poder, :NEW.grau);
        COMMIT;
    END IF;
END;

-- after insert trigger for Superes
-- Caso algum Comun tenha se tornado um super,
-- ele precisa ser deletado da tabela de Comuns (Herança Disjunta)
CREATE OR REPLACE TRIGGER inserir_super_af
AFTER INSERT
ON Superes
FOR EACH ROW
DECLARE
    any_comum NUMBER;
BEGIN
    SELECT COUNT(*) INTO any_comum FROM Comuns WHERE heroi = :NEW.heroi;
    IF any_comum <> 0 THEN
        DELETE FROM Comuns WHERE heroi = :NEW.heroi;
    END IF;
END;

-- after update trigger for Herois
-- Quando um Heroi morrer, ele deve ser deletado da Equipe
CREATE OR REPLACE TRIGGER update_heroi
AFTER UPDATE
OF estado ON Herois
FOR EACH ROW
BEGIN
    IF :New.estado = 'morto' THEN
        DELETE FROM HeroiEquipe WHERE heroi = :NEW.heroi;
    END IF;
END;