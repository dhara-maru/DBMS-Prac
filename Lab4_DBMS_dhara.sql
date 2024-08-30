--==========================part A======================================
CREATE TABLE EMPLOYEE (
    EID INT PRIMARY KEY,
    EName VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    JoiningDate DATE,
    City VARCHAR(50)
);
INSERT INTO EMPLOYEE (EID, EName, Department, Salary, JoiningDate, City) VALUES
(101, 'Rahul', 'Admin', 56000, '1990-01-01', 'Rajkot'),
(102, 'Hardik', 'IT', 18000, '1990-09-25', 'Ahmedabad'),
(103, 'Bhavin', 'HR', 25000, '1991-05-14', 'Baroda'),
(104, 'Bhoomi', 'Admin', 39000, '1991-02-08', 'Rajkot'),
(105, 'Rohit', 'IT', 17000, '1990-07-23', 'Jamnagar'),
(106, 'Priya', 'IT', 9000, '1990-10-18', 'Ahmedabad'),
(107, 'Neha', 'HR', 34000, '1991-12-25', 'Rajkot');

SELECT 
    MAX(Salary) AS Maximum,
    MIN(Salary) AS Minimum,
    SUM(Salary) AS Total_Sal,
    AVG(Salary) AS Average_Sal
FROM EMPLOYEE;

SELECT COUNT(*) AS Total_Employees FROM EMPLOYEE;
SELECT MAX(Salary) AS Max_IT_Salary FROM EMPLOYEE WHERE Department = 'IT';
SELECT COUNT(DISTINCT City) AS Total_Cities FROM EMPLOYEE;
SELECT City, COUNT(*) AS Total_Employees FROM EMPLOYEE GROUP BY City;
SELECT City FROM EMPLOYEE GROUP BY City HAVING COUNT(*) > 1;
SELECT Department, SUM(Salary) AS Total_Salary FROM EMPLOYEE GROUP BY Department;
SELECT AVG(Salary) AS Average_Salary FROM EMPLOYEE GROUP BY Department;
SELECT MIN(Salary) AS Min_Salary FROM EMPLOYEE WHERE City = 'Ahmedabad';

SELECT Department
FROM EMPLOYEE
WHERE City = 'Rajkot'
GROUP BY Department
HAVING SUM(Salary) > 50000;

SELECT COUNT(*) AS Num_Employees_Rajkot FROM EMPLOYEE WHERE City = 'Rajkot';
SELECT MAX(Salary) - MIN(Salary) AS DIFFERENCE FROM EMPLOYEE;
SELECT COUNT(*) AS Total_Employees_Before_1991 FROM EMPLOYEE WHERE JoiningDate < '1991-01-01';

SELECT Department, SUM(Salary) AS Total_Salary
FROM EMPLOYEE
GROUP BY Department
HAVING SUM(Salary) > 35000
ORDER BY Total_Salary;

SELECT Department
FROM EMPLOYEE
GROUP BY Department
HAVING COUNT(*) > 2;

--==========================================PART B==============================================
CREATE TABLE COMPANY (
    Title VARCHAR(50),
    Company VARCHAR(50),
    Type VARCHAR(50),
    Production_year INT,
    System VARCHAR(10),
    Production_cost DECIMAL(12,2),
    Revenue DECIMAL(12,2),
    Rating INT
);
INSERT INTO COMPANY (Title, Company, Type, Production_year, System, Production_cost, Revenue, Rating)
VALUES
('Blasting Boxes', 'Simone Games', 'action adventure', 1998, 'PC', 100000, 200000, 7),
('Run Run Run!', '13 Mad Bits', 'shooter', 2011, 'PS3', 3500000, 650000, 3),
('Duck n’Go', '13 Mad Bits', 'shooter', 2012, 'Xbox', 3000000, 1500000, 5),
('SQL Wars!', 'Vertabelo', 'wargames', 2017, 'Xbox', 5000000, 25000000, 10),
('Tap Tap Hex!', 'PixelGaming Inc.', 'rhythm', 2006, 'PS2', 2500000, 3500000, 7),
('NoRisk', 'Simone Games', 'action adventure', 2004, 'PS2', 1400000, 3400000, 8);

SELECT Company, SUM(Revenue) AS total_revenue
FROM COMPANY
GROUP BY Company;

SELECT Production_year, COUNT(*) AS count, AVG(Production_cost) AS avg_cost, AVG(Revenue) AS avg_revenue
FROM COMPANY
GROUP BY Production_year;

SELECT Type, COUNT(*) AS number_of_games
FROM COMPANY
WHERE Revenue > Production_cost
GROUP BY Type;

SELECT Type, SUM(Revenue) AS total_revenue
FROM COMPANY
WHERE Production_year > 2010 AND System IN ('PS2', 'PS3')
GROUP BY Type
ORDER BY total_revenue DESC;

SELECT Company, SUM(Revenue - Production_cost) AS gross_profit_sum
FROM COMPANY
GROUP BY Company
ORDER BY gross_profit_sum DESC;

SELECT Company, Production_year, (Revenue - Production_cost) AS gross_profit
FROM COMPANY
ORDER BY Company, Production_year;

SELECT Company, COUNT(*) AS number_of_games, AVG(Production_cost) AS avg_cost
FROM COMPANY
GROUP BY Company
HAVING COUNT(*) > 1;

