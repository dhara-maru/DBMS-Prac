--LAB 11 tables
CREATE TABLE ORDERS (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);

INSERT INTO ORDERS (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5001),
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001);


CREATE TABLE SALESMAN (
    salesman_id INT,
    name VARCHAR(100),
    city VARCHAR(100),
    commission DECIMAL(3, 2)
);

INSERT INTO SALESMAN (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);


CREATE TABLE CUSTOMER (
    customer_id INT,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);

INSERT INTO CUSTOMER (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


-- part A
--1
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM ORDERS
WHERE salesman_id = (SELECT salesman_id FROM SALESMAN WHERE name = 'Paul Adam');

--2
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM ORDERS
WHERE salesman_id IN (SELECT salesman_id FROM SALESMAN WHERE city = 'London');

--3
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM ORDERS
WHERE salesman_id = (SELECT salesman_id FROM CUSTOMER WHERE customer_id = 3007);

--4
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM ORDERS
WHERE purch_amt > (SELECT AVG(purch_amt) FROM ORDERS WHERE ord_date = '2012-10-10');

--5
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM ORDERS
WHERE customer_id IN (SELECT customer_id FROM CUSTOMER WHERE city = 'New York');


--6
SELECT commission
FROM SALESMAN
WHERE city = 'Paris';

--7
SELECT *
FROM CUSTOMER
WHERE customer_id < 2001
  AND salesman_id = (SELECT salesman_id FROM SALESMAN WHERE name = 'Mc Lyon');

  --8
  SELECT grade, COUNT(*)
FROM CUSTOMER
WHERE city = 'New York' AND grade > (SELECT AVG(grade) FROM CUSTOMER)
GROUP BY grade;


--9
SELECT ord_no, purch_amt, ord_date, salesman_id
FROM ORDERS
WHERE salesman_id = (SELECT salesman_id FROM SALESMAN WHERE commission = (SELECT MAX(commission) FROM SALESMAN));

--10
SELECT o.ord_no, o.purch_amt, o.ord_date, o.customer_id, o.salesman_id, c.cust_name
FROM ORDERS o
JOIN CUSTOMER c ON o.customer_id = c.customer_id
WHERE o.ord_date = '2012-08-17';

--11
SELECT salesman_id, name
FROM SALESMAN
WHERE salesman_id IN (
    SELECT salesman_id
    FROM CUSTOMER
    GROUP BY salesman_id
    HAVING COUNT(customer_id) > 1
);

--12
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM ORDERS
WHERE purch_amt > (SELECT AVG(purch_amt) FROM ORDERS);

--13
SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
FROM ORDERS
WHERE purch_amt >= (SELECT AVG(purch_amt) FROM ORDERS);
