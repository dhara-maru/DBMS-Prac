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

