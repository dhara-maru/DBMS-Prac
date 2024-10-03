--=================== PART A =============
--1
CREATE FUNCTION PrintHelloWorld()
RETURNS VARCHAR(20)
BEGIN
    RETURN 'Hello World';
END;

--2
CREATE FUNCTION AddNumbers(@num1 INT, @num2 INT)
RETURNS INT
BEGIN
    RETURN @num1 + @num2;
END;

--3
CREATE FUNCTION CubeNumber(@num INT)
RETURNS INT
BEGIN
    RETURN @num * @num * @num;
END;

--4
CREATE FUNCTION IsOddOrEven(@num INT)
RETURNS VARCHAR(4)
AS
BEGIN
    DECLARE @result VARCHAR(4);
    
    IF @num % 2 = 0
        SET @result = 'EVEN';
    ELSE
        SET @result = 'ODD';
    
    RETURN @result;
END;

--5
CREATE FUNCTION GetPersonsByFirstNameB()
RETURNS TABLE
AS
RETURN
(
    SELECT * 
    FROM Person 
    WHERE FirstName LIKE 'B%'
);

--6
CREATE FUNCTION GetUniqueFirstNames()
RETURNS TABLE
AS
RETURN
(
    SELECT DISTINCT FirstName 
    FROM Person
);

--========== PART B ===============
--1
CREATE FUNCTION CompareIntegers(@num1 INT, @num2 INT)
RETURNS VARCHAR(10)
BEGIN
    RETURN (CASE 
            WHEN @num1 > @num2 THEN 'Greater'
            WHEN @num1 < @num2 THEN 'Smaller'
            ELSE 'Equal'
            END);
END;

--2
CREATE FUNCTION PrintNumbersToN(@N INT)
RETURNS VARCHAR(MAX)
BEGIN
    DECLARE @i INT = 1, @result VARCHAR(MAX) = '';
    WHILE @i <= @N
    BEGIN
        SET @result = @result + CAST(@i AS VARCHAR) + ' ';
        SET @i = @i + 1;
    END;
    RETURN @result;
END;

--3
CREATE FUNCTION SumEvenNumbers1To20()
RETURNS INT
BEGIN
    DECLARE @sum INT = 0, @i INT = 2;
    WHILE @i <= 20
    BEGIN
        IF @i % 2 = 0
            SET @sum = @sum + @i;
        SET @i = @i + 1;
    END;
    RETURN @sum;
END;
