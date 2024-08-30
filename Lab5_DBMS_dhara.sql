--==================================PART A===================================================
CREATE TABLE ORDERS (
    ord_no INT,
    purch_amt DECIMAL(10, 2),
    ord_date DATE,
    customer_id INT,
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

CREATE TABLE CUSTOMER (
    customer_id INT,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    Grade INT,
    salesman_id INT
);
INSERT INTO CUSTOMER (customer_id, cust_name, city, Grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);


CREATE TABLE SALESMAN (
    salesman_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);
INSERT INTO SALESMAN (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

SELECT SUM(purch_amt) AS total_purchase_amount
FROM ORDERS;

SELECT AVG(purch_amt) AS average_purchase_amount
FROM ORDERS;

SELECT COUNT(DISTINCT salesman_id) AS number_of_salespeople
FROM ORDERS;

SELECT COUNT(*) AS number_of_customers
FROM CUSTOMER;

SELECT COUNT(DISTINCT customer_id) AS number_of_customers_with_grades
FROM CUSTOMER
WHERE Grade IS NOT NULL;

SELECT MAX(purch_amt) AS max_purchase_amount
FROM ORDERS;

SELECT MIN(purch_amt) AS min_purchase_amount
FROM ORDERS;

SELECT city, MAX(Grade) AS highest_grade
FROM CUSTOMER
GROUP BY city;

SELECT customer_id, MAX(purch_amt) AS highest_purchase_amount
FROM ORDERS
GROUP BY customer_id;

SELECT ord_date, customer_id, MAX(purch_amt) AS highest_purchase_amount
FROM ORDERS
GROUP BY ord_date, customer_id;

--===============================================PART B============================================================
SELECT salesman_id, MAX(purch_amt) AS highest_purchase_amount
FROM ORDERS
WHERE ord_date = '2012-08-17'
GROUP BY salesman_id;

SELECT customer_id, ord_date, MAX(purch_amt) AS highest_purchase_amount
FROM ORDERS
GROUP BY customer_id, ord_date
HAVING MAX(purch_amt) > 2000.00;

SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM ORDERS
WHERE purch_amt BETWEEN 2000 AND 6000
GROUP BY customer_id, ord_date;

SELECT customer_id, ord_date, MAX(purch_amt) AS max_purchase_amount
FROM ORDERS
WHERE purch_amt IN (2000, 3000, 5760, 6000)
GROUP BY customer_id, ord_date;

SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM ORDERS
WHERE customer_id BETWEEN 3002 AND 3007
GROUP BY customer_id;

SELECT customer_id, MAX(purch_amt) AS max_purchase_amount
FROM ORDERS
WHERE customer_id BETWEEN 3002 AND 3007 AND purch_amt > 1000
GROUP BY customer_id;

SELECT salesman_id, MAX(purch_amt) AS max_purchase_amount
FROM ORDERS
WHERE salesman_id BETWEEN 5003 AND 5008
GROUP BY salesman_id;

SELECT COUNT(*) AS number_of_orders
FROM ORDERS
WHERE ord_date = '2012-08-17';

SELECT city, COUNT(*) AS number_of_salespeople
FROM SALESMAN
GROUP BY city;

SELECT ord_date, salesman_id, COUNT(*) AS number_of_orders
FROM ORDERS
GROUP BY ord_date, salesman_id;


--=========================================PART C====================================
SELECT AVG(Price) AS average_product_price
FROM PRODUCTS;

SELECT COUNT(*) AS number_of_products
FROM PRODUCTS
WHERE Price >= 350;

SELECT CompanyID, AVG(Price) AS average_price
FROM PRODUCTS
GROUP BY CompanyID;

SELECT SUM(AllotmentAmount) AS sum_allotment_amount
FROM DEPARTMENTS;

SELECT DepartmentCode, COUNT(*) AS number_of_employees
FROM EMPLOYEES
GROUP BY DepartmentCode;

SELECT DepartmentCode, COUNT(*) AS number_of_employees
FROM EMPLOYEES
GROUP BY DepartmentCode;
