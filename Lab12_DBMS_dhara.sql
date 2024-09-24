CREATE TABLE Designation (
    DesignationID INT PRIMARY KEY,
    DesignationName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE PERSON (
    WorkerID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    DepartmentID INT,
    DesignationID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Admin'),
(2, 'IT'),
(3, 'HR'),
(4, 'Account');

INSERT INTO Designation (DesignationID, DesignationName) VALUES
(11, 'Jobber'),
(12, 'Welder'),
(13, 'Clerk'),
(14, 'Manager'),
(15, 'CEO');

INSERT INTO PERSON (WorkerID, FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID) VALUES
(101, 'Rahul', 'Anshu', 56000, '1990-01-01', 1, 12),
(102, 'Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11),
(103, 'Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11),
(104, 'Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13),
(105, 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15),
(106, 'Priya', 'Mehta', 25000, '1990-10-18', 2, NULL),
(107, 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15);


--========================== PART A ====================================
--1
--INSERT SP FOR DEPARTMENT
CREATE PROCEDURE InsertDepartment
    @deptName VARCHAR(100)
AS
BEGIN
    INSERT INTO Department (DepartmentName) VALUES (@deptName);
END;

--UPDATE SP FOR DEPARTMENT
CREATE PROCEDURE UpdateDepartment
    @deptID INT,
    @deptName VARCHAR(100)
AS
BEGIN
    UPDATE Department 
    SET DepartmentName = @deptName 
    WHERE DepartmentID = @deptID;
END;

--DELETE SP FOR DEPARTMENT
CREATE PROCEDURE DeleteDepartment
    @deptID INT
AS
BEGIN
    DELETE FROM Department WHERE DepartmentID = @deptID;
END;

--2
--INSERT, UPDATE, DELETE SP FOR DEIGNATION
--insert sp
CREATE PROCEDURE InsertDesignation
    @desgName VARCHAR(100)
AS
BEGIN
    INSERT INTO Designation (DesignationName) VALUES (@desgName);
END;


--update sp
CREATE PROCEDURE UpdateDesignation
    @desgID INT,
    @desgName VARCHAR(100)
AS
BEGIN
    UPDATE Designation 
    SET DesignationName = @desgName 
    WHERE DesignationID = @desgID;
END;

--delete sp
CREATE PROCEDURE DeleteDesignation
    @desgID INT
AS
BEGIN
    DELETE FROM Designation WHERE DesignationID = @desgID;
END;

--INSERT, UPDATE, DELETE SP FOR PERSON
--insert
CREATE PROCEDURE InsertPerson
    @fname VARCHAR(100), 
    @lname VARCHAR(100), 
    @salary DECIMAL(8,2), 
    @joinDate DATETIME, 
    @deptID INT = NULL,  -- Optional parameter
    @desgID INT = NULL   -- Optional parameter
AS
BEGIN
    INSERT INTO PERSON (FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID) 
    VALUES (@fname, @lname, @salary, @joinDate, @deptID, @desgID);
END;

--update
CREATE PROCEDURE UpdatePerson
    @workerID INT, 
    @fname VARCHAR(100), 
    @lname VARCHAR(100), 
    @salary DECIMAL(8,2), 
    @joinDate DATETIME, 
    @deptID INT = NULL,  -- Optional parameter
    @desgID INT = NULL   -- Optional parameter
AS
BEGIN
    UPDATE PERSON 
    SET FirstName = @fname, LastName = @lname, Salary = @salary, JoiningDate = @joinDate, DepartmentID = @deptID, DesignationID = @desgID
    WHERE WorkerID = @workerID;
END;

--delete
CREATE PROCEDURE DeletePerson
    @workerID INT
AS
BEGIN
    DELETE FROM PERSON WHERE WorkerID = @workerID;
END;

--2========================
CREATE PROCEDURE SelectByPrimaryKey
    @deptID INT,
    @desgID INT,
    @workerID INT
AS
BEGIN
    -- Selecting from Department table
    SELECT *
    FROM Department
    WHERE DepartmentID = @deptID;

    -- Selecting from Designation table
    SELECT *
    FROM Designation
    WHERE DesignationID = @desgID;

    -- Selecting from PERSON table
    SELECT *
    FROM PERSON
    WHERE WorkerID = @workerID;
END;


--3============================
CREATE PROCEDURE SelectWithJoins
    @workerID INT
AS
BEGIN
    SELECT 
        p.WorkerID,
        p.FirstName,
        p.LastName,
        p.Salary,
        p.JoiningDate,
        d.DepartmentID,
        d.DepartmentName,
        desg.DesignationID,
        desg.DesignationName
    FROM 
        PERSON p
    LEFT JOIN 
        Department d ON p.DepartmentID = d.DepartmentID
    LEFT JOIN 
        Designation desg ON p.DesignationID = desg.DesignationID
    WHERE 
        p.WorkerID = @workerID;
END;

--4==============================
CREATE PROCEDURE SelectFirstThreePersons
AS
BEGIN
    SELECT TOP 3 
        WorkerID,
        FirstName,
        LastName,
        Salary,
        JoiningDate,
        DepartmentID,
        DesignationID
    FROM 
        PERSON
    ORDER BY 
        WorkerID;  
END;


--============================ PART B ==============================
--1
CREATE PROCEDURE GetWorkersByDepartmentName
    @deptName VARCHAR(100)
AS
BEGIN
    SELECT 
        p.WorkerID,
        p.FirstName,
        p.LastName,
        p.Salary,
        p.JoiningDate,
        d.DepartmentID,
        d.DepartmentName
    FROM 
        PERSON p
    JOIN 
        Department d ON p.DepartmentID = d.DepartmentID
    WHERE 
        d.DepartmentName = @deptName;
END;


--2
CREATE PROCEDURE GetWorkersByDepartmentAndDesignation
    @deptName VARCHAR(100),
    @desgName VARCHAR(100)
AS
BEGIN
    SELECT 
        p.FirstName,
        p.Salary,
        p.JoiningDate,
        d.DepartmentName
    FROM 
        PERSON p
    JOIN 
        Department d ON p.DepartmentID = d.DepartmentID
    JOIN 
        Designation desg ON p.DesignationID = desg.DesignationID
    WHERE 
        d.DepartmentName = @deptName
        AND desg.DesignationName = @desgName;
END;
EXEC GetWorkersByDepartmentAndDesignation @deptName = 'IT', @desgName = 'Jobber';

--4
CREATE PROCEDURE GetDepartmentSalaryStatistics
AS
BEGIN
    SELECT 
        d.DepartmentName,
        MAX(p.Salary) AS MaxSalary,
        MIN(p.Salary) AS MinSalary,
        SUM(p.Salary) AS TotalSalary
    FROM 
        PERSON p
    JOIN 
        Department d ON p.DepartmentID = d.DepartmentID
    GROUP BY 
        d.DepartmentName;
END;

--5
CREATE PROCEDURE GetDesignationSalaryStatistics
AS
BEGIN
    SELECT 
        desg.DesignationName,
        AVG(p.Salary) AS AverageSalary,
        SUM(p.Salary) AS TotalSalary
    FROM 
        PERSON p
    JOIN 
        Designation desg ON p.DesignationID = desg.DesignationID
    GROUP BY 
        desg.DesignationName;
END;

--====================== PART C ============================
--1
CREATE PROCEDURE GetPersonCountByDepartmentName
    @deptName VARCHAR(100)
AS
BEGIN
    SELECT 
        COUNT(p.WorkerID) AS PersonCount
    FROM 
        PERSON p
    JOIN 
        Department d ON p.DepartmentID = d.DepartmentID
    WHERE 
        d.DepartmentName = @deptName;
END;

--3
CREATE PROCEDURE GetDepartmentPersonCount
AS
BEGIN
    SELECT 
        d.DepartmentID,
        d.DepartmentName,
        COUNT(p.WorkerID) AS PersonCount
    FROM 
        Department d
    LEFT JOIN 
        PERSON p ON d.DepartmentID = p.DepartmentID
    GROUP BY 
        d.DepartmentID, d.DepartmentName;
END;
