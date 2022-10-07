-- global variable for recursive control
CREATE OR REPLACE PACKAGE STATE
IS
    g_recursing  boolean := FALSE;
END;

-- after insert trigger for Herois
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
        INSERT INTO Comuns(heroi, especialidade) VALUES (:NEW.heroi, ' ');
        state.g_recursing := false;
    END IF;
END;

-- before insert trigger for Comuns
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

-- before insert trigger for Poderes
CREATE OR REPLACE TRIGGER inserir_poder_bf
BEFORE INSERT
ON Poderes
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

-- after insert trigger for Poderes
CREATE OR REPLACE TRIGGER inserir_poder_af
AFTER INSERT
ON Poderes
FOR EACH ROW
DECLARE
    any_comum NUMBER;
BEGIN
    SELECT COUNT(*) INTO any_comum FROM Comuns WHERE heroi = :NEW.heroi;
    IF any_comum <> 0 THEN
        DELETE FROM Comuns WHERE heroi = :NEW.heroi;
    END IF;
END;