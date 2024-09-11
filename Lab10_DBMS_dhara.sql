use dhara11sept
CREATE TABLE STUDENT (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    DID INT
);
INSERT INTO STUDENT (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE ACADEMIC (
    Rno INT PRIMARY KEY,
    SPI DECIMAL(4, 2),
    Bklog INT
);

INSERT INTO ACADEMIC (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE DEPARTMENT (
    DID INT PRIMARY KEY,
    DName VARCHAR(50) NOT NULL
);

INSERT INTO DEPARTMENT (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');


--===== PART B
CREATE TABLE COMPANY_MASTER (
    COM_ID INT PRIMARY KEY,
    COM_NAME VARCHAR(50) NOT NULL
);
INSERT INTO COMPANY_MASTER (COM_ID, COM_NAME) VALUES
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

CREATE TABLE ITEM_MASTER (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50) NOT NULL,
    PRO_PRICE DECIMAL(10, 2),
    PRO_COM INT,
    FOREIGN KEY (PRO_COM) REFERENCES COMPANY_MASTER(COM_ID)
);

INSERT INTO ITEM_MASTER (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
(101, 'Mother Board', 3200, 15),
(102, 'Key Board', 450, 16),
(103, 'ZIP drive', 250, 14),
(104, 'Speaker', 550, 16),
(105, 'Monitor', 5000, 11),
(106, 'DVD drive', 900, 12),
(107, 'CD drive', 800, 12),
(108, 'Printer', 2600, 13),
(109, 'Refill cartridge', 350, 13),
(110, 'Mouse', 250, 12);

CREATE TABLE EMP_DETAILS (
    EMP_IDNO INT PRIMARY KEY,
    EMP_FNAME VARCHAR(50) NOT NULL,
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);

INSERT INTO EMP_DETAILS (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES
(127323, 'Michale', 'Robbin', 57),
(526689, 'Carlos', 'Snares', 63),
(843795, 'Enric', 'Dosio', 57),
(328717, 'Jhon', 'Snares', 63),
(444527, 'Joseph', 'Dosni', 47),
(659831, 'Zanifer', 'Emily', 47),
(847674, 'Kuleswar', 'Sitaraman', 57),
(748681, 'Henrey', 'Gabriel', 47),
(555935, 'Alex', 'Manuel', 57),
(539569, 'George', 'Mardy', 27),
(733843, 'Mario', 'Saule', 63),
(631548, 'Alan', 'Snappy', 27),
(839139, 'Maria', 'Foster', 57);


CREATE TABLE EMP_DEPARTMENT (
    DPT_CODE INT PRIMARY KEY,
    DPT_NAME VARCHAR(50) NOT NULL,
    DPT_ALLOTMENT DECIMAL(12, 2)
);

INSERT INTO EMP_DEPARTMENT (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES
(57, 'IT', 65000),
(63, 'Finance', 15000),
(47, 'HR', 240000),
(27, 'RD', 55000),
(89, 'QC', 75000);

--**************************** ANSWERS *********************************
--==================== PART A ============================
--1
select * from STUDENT where DID IN (
	select DID from DEPARTMENT Where Dname = 'Computer');

--2
Select Name from STUDENT where Rno in(
select Rno from ACADEMIC where SPI > 8.0);

--3
select * from STUDENT where DID IN (
	select DID from DEPARTMENT Where Dname = 'Computer')
	AND 
	City = 'Rajkot';

--4
select count(*) from STUDENT where DID IN (
	select DID from DEPARTMENT Where Dname = 'Electrical');

--5
select Name from STUDENT where Rno in(
select Rno from ACADEMIC where SPI = (Select max(SPI) from ACADEMIC));

--6
Select Name from STUDENT where Rno in(
select Rno from ACADEMIC where Bklog > 1);

--7
select Name from STUDENT  where Rno in(
select Rno from ACADEMIC where SPI = (Select max(SPI) from ACADEMIC WHERE SPI < (Select max(SPI) from ACADEMIC)));

--8
select * from STUDENT where DID IN (
	select DID from DEPARTMENT Where Dname = 'Computer' or DName='Mechanical');

--9 
select Name from STUDENT where DID IN (
	select DID from STUDENT Where Rno = 102 );

--10
Select * from STUDENT where Rno in
(select Rno from ACADEMIC where SPI > 9.0 )
AND DID in
(select DID from DEPARTMENT Where Dname = 'Electrical');

--***************************** PART B (JOINS) **********************
--1
select AVG(i.PRO_PRICE), c.COM_NAME
from ITEM_MASTER i
join COMPANY_MASTER c
on i.PRO_COM = c.COM_ID
group by(c.COM_NAME)

--2
select AVG(i.PRO_PRICE), c.COM_NAME
from ITEM_MASTER i
join COMPANY_MASTER c
on i.PRO_COM = c.COM_ID
where i.PRO_PRICE >= 350
group by(c.COM_NAME) 

--3
select  MAX(i.PRO_PRICE), c.COM_NAME, i.PRO_NAME
from ITEM_MASTER i
join COMPANY_MASTER c
on i.PRO_COM = c.COM_ID
group by(c.COM_NAME) 

--4
select e.EMP_IDNO, e.EMP_FNAME, e.EMP_LNAME, e.EMP_DEPT, d.DPT_CODE from EMP_DETAILS e join EMP_DEPARTMENT d on d.DPT_CODE = e.EMP_DEPT where e.EMP_LNAME IN ('Gabriel','Dosio')--5select e.EMP_IDNO, e.EMP_FNAME, e.EMP_LNAME, e.EMP_DEPT, d.DPT_CODE from EMP_DETAILS e join EMP_DEPARTMENT d on d.DPT_CODE = e.EMP_DEPT where e.EMP_DEPT = 89 or e.EMP_DEPT = 63 --========================== PART C ============================ --1 select e.EMP_FNAME, e.EMP_LNAME  from EMP_DETAILS e join EMP_DEPARTMENT d on d.DPT_CODE = e.EMP_DEPT where d.DPT_ALLOTMENT > 50000 --2 select DPT_NAME from EMP_DEPARTMENT  where DPT_CODE in(
select DPT_CODE from EMP_DEPARTMENT where DPT_ALLOTMENT = (Select max(DPT_ALLOTMENT) from EMP_DEPARTMENT WHERE DPT_ALLOTMENT < (Select AVG(DPT_ALLOTMENT) from EMP_DEPARTMENT)));  --3 PENDING select d.DPT_NAME from EMP_DEPARTMENT d join EMP_DETAILS e  on d.DPT_CODE = e.EMP_DEPT--4select EMP_FNAME, EMP_LNAME from EMP_DETAILS  where EMP_DEPT in(
select DPT_CODE from EMP_DEPARTMENT where DPT_CODE = (
select DPT_CODE from EMP_DEPARTMENT
order by DPT_ALLOTMENT asc
offset 1 rows
fetch next 1 rows only))
