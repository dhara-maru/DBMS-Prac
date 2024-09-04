
CREATE TABLE DEPARTMENT (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE,
    DepartmentCode VARCHAR(50) NOT NULL UNIQUE,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE PERSON (
    PersonID INT PRIMARY KEY,
    PersonName VARCHAR(100) NOT NULL,
    DepartmentID INT,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    City VARCHAR(100) NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID)
);

INSERT INTO PERSON (PersonID, PersonName, DepartmentID, Salary, JoiningDate, City)
VALUES 
(101, 'Rahul Tripathi', 2, 56000, '2000-01-01', 'Rajkot'),
(102, 'Hardik Pandya', 3, 18000, '2001-09-25', 'Ahmedabad'),
(103, 'Bhavin Kanani', 4, 25000, '2000-05-14', 'Baroda'),
(104, 'Bhoomi Vaishnav', 1, 39000, '2005-02-08', 'Rajkot'),
(105, 'Rohit Topiya', 2, 17000, '2001-07-23', 'Jamnagar'),
(106, 'Priya Menpara', NULL, 9000, '2000-10-18', 'Ahmedabad'),
(107, 'Neha Sharma', 2, 34000, '2002-12-25', 'Rajkot'),
(108, 'Nayan Goswami', 3, 25000, '2001-07-01', 'Rajkot'),
(109, 'Mehul Bhundiya', 4, 13500, '2005-01-09', 'Baroda'),
(110, 'Mohit Maru', 5, 14000, '2000-05-25', 'Jamnagar');

INSERT INTO DEPARTMENT (DepartmentID, DepartmentName, DepartmentCode, Location)
VALUES
(1, 'Admin', 'Adm', 'A-Block'),
(2, 'Computer', 'CE', 'C-Block'),
(3, 'Civil', 'CI', 'G-Block'),
(4, 'Electrical', 'EE', 'E-Block'),
(5, 'Mechanical', 'ME', 'B-Block');


--===============================================PART B=========================================
SELECT p.PersonName, d.DepartmentName, d.DepartmentCode
FROM PERSON p
LEFT JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID;

SELECT p.PersonName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE d.Location = 'C-Block';

SELECT p.PersonName, p.Salary, d.DepartmentName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Jamnagar';

SELECT p.PersonName, p.Salary, d.DepartmentName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE p.City <> 'Rajkot';

SELECT p.PersonName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Civil' AND p.JoiningDate > '2001-08-01';

SELECT p.*
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Computer';

SELECT p.PersonName, d.DepartmentName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE DATEDIFF(d, GETDATE(), p.JoiningDate) > 365;

SELECT d.DepartmentName, COUNT(p.PersonID) AS PersonCount
FROM DEPARTMENT d
LEFT JOIN PERSON p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName;

SELECT d.DepartmentName, MAX(p.Salary) AS MaxSalary, MIN(p.Salary) AS MinSalary
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;


SELECT p.City, SUM(p.Salary) AS TotalSalary, AVG(p.Salary) AS AvgSalary,
       MAX(p.Salary) AS MaxSalary, MIN(p.Salary) AS MinSalary
FROM PERSON p
GROUP BY p.City;

SELECT AVG(p.Salary) AS AvgSalary
FROM PERSON p
WHERE p.City = 'Ahmedabad';


SELECT CONCAT(p.PersonName, ' lives in ', p.City, ' and works in ', d.DepartmentName, ' Department') AS Output
FROM PERSON p
LEFT JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID;



SELECT CONCAT(p.PersonName, ' earns ', p.Salary, ' from ', d.DepartmentName, ' department monthly') AS Output
FROM PERSON p
LEFT JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID;


SELECT p.City, d.DepartmentName, 
       SUM(p.Salary) AS TotalSalary, AVG(p.Salary) AS AvgSalary, MAX(p.Salary) AS MaxSalary
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY p.City, d.DepartmentName;


SELECT p.*
FROM PERSON p
WHERE p.DepartmentID IS NULL;


--===============================================PART C=======================================

SELECT d.DepartmentName, SUM(p.Salary) AS TotalSalary
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(p.Salary) > 100000;


SELECT d.DepartmentName, SUM(p.Salary) AS TotalSalary
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(p.Salary) > 100000;


SELECT d.DepartmentName
FROM DEPARTMENT d
INNER JOIN PERSON p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(p.PersonID) > 2;


UPDATE PERSON
SET Salary = Salary * 1.10
WHERE DepartmentID = (SELECT DepartmentID FROM DEPARTMENT WHERE DepartmentName = 'Computer');




