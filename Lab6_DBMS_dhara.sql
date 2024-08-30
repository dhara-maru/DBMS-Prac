--PART A =============================================================================

SELECT *
FROM STUDENT
CROSS JOIN RESULT;

SELECT s.Rno, s.Name, s.Branch, r.SPI
FROM STUDENT as s
INNER JOIN RESULT as r
ON s.Rno = r.Rno;

SELECT s.Rno, s.Name, s.Branch, r.SPI
FROM STUDENT as s
INNER JOIN RESULT as r
ON s.Rno = r.Rno
WHERE s.Branch = 'CE';

SELECT s.Rno, s.Name, s.Branch, r.SPI
FROM STUDENT as s
INNER JOIN RESULT as r
ON s.Rno = r.Rno
WHERE s.Branch = 'EC';


SELECT s.Branch, AVG(r.SPI) as Average_SPI
FROM STUDENT as s
INNER JOIN RESULT as r
ON s.Rno = r.Rno
GROUP BY s.Branch;


SELECT s.Branch, AVG(r.SPI) as Average_SPI
FROM STUDENT as s
INNER JOIN RESULT as r
ON s.Rno = r.Rno
GROUP BY s.Branch
ORDER BY Average_SPI ASC;

select AVG(r.SPI) as avgspi
FROM STUDENT as s
INNER join RESULT as r
on s.Rno=r.Rno
WHERE s.Branch IN ('CE', 'ME')
GROUP BY s.Branch;

USE LAB6_DBMS_dhara;

select * 
from STUDENT as s
LEFT JOIN RESULT as r
ON s.Rno=r.Rno;


select * 
from STUDENT as s
RIGHT JOIN RESULT as r
ON s.Rno=r.Rno;


select * 
from STUDENT as s
LEFT JOIN RESULT as r
ON s.Rno=r.Rno
UNION
select * 
from STUDENT as s
RIGHT JOIN RESULT as r
ON s.Rno=r.Rno;


SELECT e1.Name as EMPLOYEE, e2.Name as Manager
FROM EMPLOYEE e1
LEFT JOIN EMPLOYEE e2
ON e1.ManagerNo = e2.EmployeeNo;

--PART B====================================================================


use LAB6_DBMS_dhara;

SELECT p.PersonName, d.DepartmentName, d.DepartmentCode
FROM PERSON p
LEFT JOIN DEPARTMENT d 
ON p.DepartmentID = d.DepartmentID;


SELECT d.DepartmentName, 
       MAX(p.Salary) AS MaxSalary, 
       MIN(p.Salary) AS MinSalary
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;

SELECT d.DepartmentName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(p.Salary) > 100000;


SELECT p.PersonName, p.Salary, d.DepartmentName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE p.City = 'Jamnagar';


SELECT p.PersonName
FROM PERSON p
LEFT JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


SELECT d.DepartmentName, COUNT(p.PersonID) AS PersonCount
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName;


SELECT AVG(p.Salary) AS AverageSalary
FROM PERSON p
WHERE p.City = 'Ahmedabad';


SELECT CONCAT(p.PersonName, ' earns ', p.Salary, ' from department ', d.DepartmentName, ' monthly.') AS Output
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID;


SELECT d.DepartmentName
FROM DEPARTMENT d
LEFT JOIN PERSON p ON d.DepartmentID = p.DepartmentID
WHERE p.PersonID IS NULL;


SELECT p.City, d.DepartmentName,
       SUM(p.Salary) AS TotalSalary,
       AVG(p.Salary) AS AverageSalary,
       MAX(p.Salary) AS MaxSalary
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY p.City, d.DepartmentName;


--PART C====================================================================

SELECT DISTINCT City
FROM PERSON;

SELECT d.DepartmentName
FROM PERSON p
INNER JOIN DEPARTMENT d ON p.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING COUNT(p.PersonID) > 2;

UPDATE PERSON
SET Salary = Salary * 1.10
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM DEPARTMENT
    WHERE DepartmentCode = 'CE'
);


