--*******************************TABLES***********************
CREATE TABLE ORDERS (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
CREATE TABLE SALESMAN (
    salesman_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4, 2)
);
CREATE TABLE CUSTOMER (
    customer_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);

INSERT INTO ORDERS (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.5, '2012-08-17', 3009, 5003),
(70007, 948.5, '2012-09-10', 3005, 5002),
(70005, 2400.6, '2012-07-27', 3007, 5001),
(70008, 5760, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.4, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.6, '2012-04-25', 3002, 5001),
(70001, 150.5, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001);

INSERT INTO SALESMAN (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

INSERT INTO CUSTOMER (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


--******************************TABLES OVER*************************************

--1
SELECT s.name AS Salesman, c.cust_name, c.city
FROM SALESMAN s
JOIN CUSTOMER c ON s.city = c.city;

--2
SELECT o.ord_no, o.purch_amt, c.cust_name, c.city
FROM ORDERS o
JOIN CUSTOMER c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 AND 2000;

--3
SELECT c.cust_name AS Customer_Name, c.city AS Customer_City, s.name AS Salesman, s.commission
FROM CUSTOMER c
JOIN SALESMAN s ON c.salesman_id = s.salesman_id;

--4
SELECT c.cust_name AS Customer_Name, c.city AS Customer_City, s.name AS Salesman, s.commission
FROM CUSTOMER c
JOIN SALESMAN s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;

--5
SELECT c.cust_name AS Customer_Name, c.city AS Customer_City, s.name AS Salesman, s.city AS Salesman_City, s.commission
FROM CUSTOMER c
JOIN SALESMAN s ON c.salesman_id = s.salesman_id
WHERE c.city <> s.city AND s.commission > 0.12;

--6
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name AS Salesman, s.commission
FROM ORDERS o
JOIN CUSTOMER c ON o.customer_id = c.customer_id
JOIN SALESMAN s ON o.salesman_id = s.salesman_id;

--7
SELECT o.ord_no, o.purch_amt, o.ord_date, c.cust_name, c.city AS customer_city, c.grade, s.name AS salesman_name, s.city AS salesman_city, s.commission
FROM ORDERS o
JOIN CUSTOMER c ON o.customer_id = c.customer_id
JOIN SALESMAN s ON o.salesman_id = s.salesman_id;

--8
SELECT c.cust_name, c.city AS customer_city, c.grade, s.name AS salesman, s.city AS salesman_city
FROM CUSTOMER c
JOIN SALESMAN s ON c.salesman_id = s.salesman_id
ORDER BY c.customer_id;

--9
SELECT c.cust_name, c.city AS customer_city, c.grade, s.name AS salesman, s.city AS salesman_city
FROM CUSTOMER c
JOIN SALESMAN s ON c.salesman_id = s.salesman_id
WHERE c.grade < 300
ORDER BY c.customer_id;

--10
SELECT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt
FROM CUSTOMER c
JOIN ORDERS o ON c.customer_id = o.customer_id
ORDER BY o.ord_date;

--********************************** PART B ************************************
--1
SELECT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt, s.name AS salesman_name, s.commission
FROM CUSTOMER c
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id
LEFT JOIN SALESMAN s ON c.salesman_id = s.salesman_id
ORDER BY c.cust_name, o.ord_date;

--2
SELECT s.name AS salesperson, COUNT(c.customer_id) AS customer_count
FROM SALESMAN s
LEFT JOIN CUSTOMER c ON s.salesman_id = c.salesman_id
GROUP BY s.salesman_id, s.name
ORDER BY s.name;

--3
SELECT s.name AS salesperson, c.cust_name, c.city AS customer_city, c.grade, o.ord_no, o.ord_date, o.purch_amt
FROM SALESMAN s
JOIN CUSTOMER c ON s.salesman_id = c.salesman_id
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id
ORDER BY s.name, o.ord_date;

--4
SELECT s.name AS salesperson, c.cust_name, c.city AS customer_city, c.grade, o.ord_no, o.ord_date, o.purch_amt
FROM SALESMAN s
LEFT JOIN CUSTOMER c ON s.salesman_id = c.salesman_id
LEFT JOIN ORDERS o ON c.customer_id = o.customer_id AND o.purch_amt >= 2000
WHERE c.grade IS NOT NULL
ORDER BY s.name, c.cust_name;

--5
SELECT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt
FROM CUSTOMER c
JOIN ORDERS o ON c.customer_id = o.customer_id
UNION
SELECT DISTINCT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt
FROM CUSTOMER c
RIGHT JOIN ORDERS o ON c.customer_id = o.customer_id;

--********************************PART C ******************************************
--1
SELECT c.cust_name, c.city AS customer_city, o.ord_no, o.ord_date, o.purch_amt
FROM CUSTOMER c
JOIN ORDERS o ON c.customer_id = o.customer_id
WHERE (c.grade IS NOT NULL AND c.grade IS NOT NULL)
   OR (c.grade IS NULL AND c.cust_name IS NOT NULL);


--2
SELECT s.name AS salesman_name, c.cust_name, c.city AS customer_city
FROM SALESMAN s
CROSS JOIN CUSTOMER c;

--3
SELECT s.name AS salesman_name, c.cust_name, c.city AS customer_city
FROM SALESMAN s
CROSS JOIN CUSTOMER c
WHERE s.city = c.city;

--4
SELECT s.name AS salesman_name, c.cust_name, c.city AS customer_city
FROM SALESMAN s
CROSS JOIN CUSTOMER c
WHERE c.grade IS NOT NULL;

--5
SELECT s.name AS salesman_name, c.cust_name, c.city AS customer_city
FROM SALESMAN s
CROSS JOIN CUSTOMER c
WHERE s.city <> c.city AND c.grade IS NOT NULL;

