--LAB 13 DBMS dhara
--========================= PART A ===============================
--1=======================
CREATE TRIGGER trg_RecordAffected
ON Person2
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'Record is Affected.'
END;

--2============================
CREATE TRIGGER trg_LogPersonOperations
ON Person2
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(50);
    
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
        SET @Operation = 'UPDATE';
    ELSE IF EXISTS (SELECT * FROM inserted)
        SET @Operation = 'INSERT';
    ELSE IF EXISTS (SELECT * FROM deleted)
        SET @Operation = 'DELETE';
    
    INSERT INTO PersonLog (PLogID, PersonID, PersonName, Operation, UpdateDate)
    SELECT 
        (SELECT ISNULL(MAX(PLogID), 0) + 1 FROM PersonLog),  -- Generate new PLogID
        PersonID,
        PersonName,
        @Operation,
        GETDATE()
    FROM 
        (SELECT * FROM inserted UNION SELECT * FROM deleted) AS AllRows;
END;

--===================== PART B =========================
--1=======================
CREATE TRIGGER trg_LogPersonOperationsInstead
ON Person2
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @Operation VARCHAR(50);
    
    -- Log INSERT operation
    IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @Operation = 'INSERT';
        INSERT INTO PersonLog (PLogID, PersonID, PersonName, Operation, UpdateDate)
        SELECT 
            (SELECT ISNULL(MAX(PLogID), 0) + 1 FROM PersonLog), 
            PersonID,
            PersonName,
            @Operation,
            GETDATE()
        FROM inserted;

        -- Actual insert to Person2 table
        INSERT INTO Person2 (PersonName, Salary, JoiningDate, City, Age, BirthDate)
        SELECT PersonName, Salary, JoiningDate, City, Age, BirthDate FROM inserted;
    END
    
    -- Log UPDATE operation
    IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @Operation = 'UPDATE';
        INSERT INTO PersonLog (PLogID, PersonID, PersonName, Operation, UpdateDate)
        SELECT 
            (SELECT ISNULL(MAX(PLogID), 0) + 1 FROM PersonLog), 
            PersonID,
            PersonName,
            @Operation,
            GETDATE()
        FROM inserted;

        -- Actual update to Person2 table
        UPDATE Person2
        SET 
            PersonName = i.PersonName,
            Salary = i.Salary,
            JoiningDate = i.JoiningDate,
            City = i.City,
            Age = i.Age,
            BirthDate = i.BirthDate
        FROM Person2 p
        INNER JOIN inserted i ON p.PersonID = i.PersonID;
    END

    -- Log DELETE operation
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @Operation = 'DELETE';
        INSERT INTO PersonLog (PLogID, PersonID, PersonName, Operation, UpdateDate)
        SELECT 
            (SELECT ISNULL(MAX(PLogID), 0) + 1 FROM PersonLog), 
            PersonID,
            PersonName,
            @Operation,
            GETDATE()
        FROM deleted;

        -- Actual delete from Person2 table
        DELETE FROM Person2
        WHERE PersonID IN (SELECT PersonID FROM deleted);
    END
END;


--2========================
CREATE TRIGGER trg_UppercasePersonName
ON Person2
AFTER INSERT
AS
BEGIN
    UPDATE Person2
    SET PersonName = UPPER(PersonName)
    FROM Person2 p
    INNER JOIN inserted i ON p.PersonID = i.PersonID;
END;

--============================ PART C ============================
--1================
CREATE TRIGGER trg_CalculateAge
ON Person2
AFTER INSERT
AS
BEGIN
    UPDATE Person2
    SET Age = DATEDIFF(YEAR, BirthDate, GETDATE())
    FROM Person2 p
    INNER JOIN inserted i ON p.PersonID = i.PersonID;
END;

--2======================
CREATE TRIGGER trg_DeletePersonLog
ON PersonLog
FOR DELETE
AS
BEGIN
    PRINT 'Record deleted successfully from PersonLog';
END;
