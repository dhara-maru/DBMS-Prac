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

