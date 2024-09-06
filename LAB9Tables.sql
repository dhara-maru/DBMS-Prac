use LAB9DHARA
CREATE TABLE CITY (
    CityID INT PRIMARY KEY,
    Name VARCHAR(50) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(50)
);
INSERT INTO CITY (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

CREATE TABLE VILLAGE (
    VID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES CITY(CityID)
);

INSERT INTO VILLAGE (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

CREATE TABLE STUDENT (
    Rno INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Branch VARCHAR(50) DEFAULT 'General',
    SPI DECIMAL(4, 2) CHECK (SPI >0 AND SPI < 10) ,
    Bklog INT
);

INSERT INTO STUDENT (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', 'General', 4.50, 3);


--****************************** PART A ***********************
--1
select v.VID, v.Name, c.Name
from CITY c
JOIN VILLAGE v
on c.CityID = v.CityID
where c.Name = 'Rajkot'

--2
select c.name, c.Pincode, v.Name
from CITY c
LEFT JOIN VILLAGE v
on c.CityID = v.CityID

--3
select c.Name, v.Name
from CITY c
JOIN VILLAGE v
on c.CityID = v.CityID
where 

--4
select c.Name
from CITY c
LEFT JOIN VILLAGE v
on c.CityID = v.CityID
group by c.Name
having count(VID)=0


--5
select c.Name, count(Vid)
from CITY c
JOIN VILLAGE v
on c.CityID = v.CityID
group by c.Name


--6
select count(*) from(
select c.Name, count(v.Name) as totalvillage from CITY c
join VILLAGE v
on c.CityID = v.CityID
group by c.Name
)subqueryalias
where totalvillage > 1



--7
--Update STUDENT set SPI = 12.00 where Name = 'Raju'
--The UPDATE statement conflicted with the CHECK constraint "CK__STUDENT__SPI__1ED998B2". The conflict occurred in database "LAB9DHARA", table "dbo.STUDENT", column 'SPI'.
--The statement has been terminated.

--8
Update STUDENT set Bklog = 1 where Name = 'Neha'

--************************* PART B **************************
--1
CREATE TABLE Emp(
Eid INT PRIMARY KEY,
Ename VARCHAR(50) NOT NULL,
Did INT NOT NULL UNIQUE,
Cid INT NOT NULL,
Salary INT NOT NULL,
Experience INT NOT NULL,
Foreign key (Did) References Dept(Did),
Foreign key (Cid) References City1(Cid))

CREATE TABLE Dept(
Did INT PRIMARY KEY,
Dname varchar(50))

CREATE TABLE City1(
Cid INT PRIMARY KEY,
Cname varchar(50))

--insert into Dept('cs1', 'CS');
--insert into City('M1', 'MORBI');
--insert into Emp('cs1', 'Dhara', 3, 20000, '5 years');

--*********************** PART C *******************
CREATE TABLE Empfc(
Eid INT PRIMARY KEY,
Ename VARCHAR(50) NOT NULL,
Did INT NOT NULL UNIQUE,
Cid INT NOT NULL,
Salary INT NOT NULL,
Experience INT NOT NULL,
Foreign key (Did) References Dept2(Did),
Foreign key (Cid) References Citynew(Cid))

CREATE TABLE Dept2(
Did INT PRIMARY KEY,
Dname varchar(50))

CREATE TABLE Citynew(
Cid INT PRIMARY KEY,
Cname varchar(50),
Disid INT NOT NULL,
Foreign key (Disid) References Districtnew(Disid))

CREATE TABLE Districtnew(Disid INT PRIMARY KEY,
DisName Varchar(50) NOT NULL UNIQUE,
Sid INT NOT NULL,
Foreign key (Sid) References Statenew(Sid))

CREATE TABLE Statenew(Sid INT PRIMARY KEY,
SName Varchar(50) NOT NULL UNIQUE,
Cid INT NOT NULL,
Foreign key (Cid) References Country(Conid))

CREATE TABLE Country(Conid INT PRIMARY KEY,
Conname VARCHAR(50) NOT NULL)


--3
select e.Ename, d.Dname, e.Salary, e.Experience, c.Cname, d.Dname, s.Sname, con.Conname
from Dept2 d inner join Empfc e  
on e.Did=d.Did
inner join Citynew c
on c.Cid=e.Cid
inner join Districtnew dis
on dis.Disid = c.Disid
inner join Statenew s
on dis.Sid = s.Sid
inner join Country con
on s.Cid = con.Conid




