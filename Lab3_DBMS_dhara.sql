--=====================================PART A ===========================================
CREATE TABLE STUDENT (
    StuID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Website VARCHAR(100),
    City VARCHAR(50),
    Division VARCHAR(50)
);
INSERT INTO STUDENT (StuID, FirstName, LastName, Website, City, Division)
VALUES
(1011, 'Keyur', 'Patel', 'techonthenet.com', 'Rajkot', 'II-BCX'),
(1022, 'Hardik', 'Shah', 'digminecraft.com', 'Ahmedabad', 'I-BCY'),
(1033, 'Kajal', 'Trivedi', 'bigactivities.com', 'Baroda', 'IV-DCX'),
(1044, 'Bhoomi', 'Gajera', 'checkyourmath.com', 'Ahmedabad', 'III-DCW'),
(1055, 'Harmit', 'Mitel', NULL, 'Rajkot', 'II-BCY'),
(1066, 'Ashok', 'Jani', NULL, 'Baroda', 'II-BCZ');

SELECT FirstName FROM STUDENT WHERE FirstName LIKE 'K%';

SELECT FirstName FROM STUDENT WHERE LEN(FirstName) = 5;

SELECT FirstName, LastName FROM STUDENT WHERE City LIKE '_____a'; 

SELECT FirstName, LastName FROM STUDENT WHERE LastName LIKE '%tel';

SELECT FirstName FROM STUDENT WHERE FirstName LIKE 'Ha%t';
SELECT FirstName FROM STUDENT WHERE FirstName LIKE 'K_y%';
SELECT FirstName FROM STUDENT WHERE Website IS NULL AND LEN(FirstName) = 5;
SELECT FirstName, LastName FROM STUDENT WHERE LastName LIKE '%jer%';
SELECT FirstName, LastName FROM STUDENT WHERE LastName LIKE '%jer%';
SELECT FirstName, LastName, City FROM STUDENT WHERE City LIKE 'R%' OR City LIKE 'B%';
SELECT FirstName, LastName FROM STUDENT WHERE Website IS NOT NULL;
SELECT FirstName FROM STUDENT WHERE FirstName LIKE '[A-H]%';
SELECT FirstName FROM STUDENT WHERE FirstName LIKE '_[AEIOU]%';
SELECT FirstName, LastName, City FROM STUDENT WHERE City LIKE '%rod%';
SELECT FirstName, LastName FROM STUDENT WHERE Website LIKE 'bi%';
SELECT City FROM STUDENT WHERE LEN(LastName) = 6;
SELECT FirstName, LastName, City FROM STUDENT WHERE LEN(City) = 5 AND City NOT LIKE 'Ba%';
SELECT FirstName, LastName, Division FROM STUDENT WHERE Division LIKE 'II%';
SELECT FirstName FROM STUDENT WHERE Division LIKE '%bc%';
SELECT StuID, City FROM STUDENT WHERE LEN(Division) = 6 AND Website IS NOT NULL;
SELECT FirstName FROM STUDENT WHERE FirstName LIKE '__[BCDFGHJKLMNPQRSTVWXYZ]%';

--==================================PART B ====================================================
CREATE TABLE CUSTOMER (
    CID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    ContactName VARCHAR(100),
    Address VARCHAR(100),
    City VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50)
);
INSERT INTO CUSTOMER (CID, CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Obere Str. 57', 'Berlin', '12209', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F.', '05021', 'Mexico'),
(3, 'Antonio Moreno Taqueria', 'Antonio Moreno', 'Mataderos 2312', 'Mexico D.F.', '05023', 'Mexico'),
(4, 'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 'WA1 1DP', 'UK'),
(5, 'Berglunds snabbkop', 'Christina Berglund', 'Berguvsvagen 8', 'Lulea', 'S-958 22', 'Sweden');

SELECT * FROM CUSTOMER WHERE City LIKE 'L_nd__';
SELECT * FROM CUSTOMER WHERE City LIKE '%L%';
SELECT * FROM CUSTOMER WHERE City NOT LIKE '%L%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'La%';
SELECT * FROM CUSTOMER WHERE CustomerName NOT LIKE 'La%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'b%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'a%' OR CustomerName LIKE 'c%' OR CustomerName LIKE 't%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE '[a-d]%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE '%a';
SELECT * FROM CUSTOMER WHERE CustomerName NOT LIKE '%a';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'b%s';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE '%or%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE '%or%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE 'a__%';
SELECT * FROM CUSTOMER WHERE CustomerName LIKE '_r%';
SELECT * FROM CUSTOMER WHERE Country = 'Spain';


--============================PART C====================================
CREATE TABLE CUSTOMER2 (
    CID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Address VARCHAR(100),
    Salary DECIMAL(10, 2)
);
INSERT INTO CUSTOMER2 (CID, Name, Age, Address, Salary) VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'Hyderabad', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);

SELECT * FROM CUSTOMER2 WHERE Salary LIKE '200%';
SELECT * FROM CUSTOMER2 WHERE Name LIKE '%al%';
SELECT * FROM CUSTOMER2 WHERE Name LIKE 'K___%';
SELECT * FROM CUSTOMER2 WHERE Name LIKE '__m%';
SELECT * FROM CUSTOMER2 WHERE (Name LIKE 'C%i') OR (Name LIKE '%k');
SELECT * FROM CUSTOMER2 WHERE Name NOT LIKE 'K%';
