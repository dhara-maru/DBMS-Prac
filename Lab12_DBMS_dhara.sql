use septdhara
CREATE TABLE Designation (
    DesignationID INT PRIMARY KEY,
    DesignationName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE PERSON (
    WorkerID INT PRIMARY KEY IDENTITY(101,1),
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Salary DECIMAL(8,2) NOT NULL,
    JoiningDate DATETIME NOT NULL,
    DepartmentID INT,
    DesignationID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY (DesignationID) REFERENCES Designation(DesignationID)
);


INSERT INTO Department (DepartmentID, DepartmentName) VALUES
(1, 'Admin'),
(2, 'IT'),
(3, 'HR'),
(4, 'Account');

INSERT INTO Designation (DesignationID, DesignationName) VALUES
(11, 'Jobber'),
(12, 'Welder'),
(13, 'Clerk'),
(14, 'Manager'),
(15, 'CEO');

INSERT INTO PERSON ( FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID) VALUES
('Rahul', 'Anshu', 56000, '1990-01-01', 1, 12),
( 'Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11),
('Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11),
('Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13),
( 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15),
('Priya', 'Mehta', 25000, '1990-10-18', 2, NULL),
( 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15);

--=============== part a ===================
--delete from person
create procedure delperson
@pid int
as
begin
delete from PERSON where WorkerID = @pid
end

exec delperson 107

-- delete from department
create procedure deldept
@did int
as
begin
delete from Department where DepartmentID = @did
end

exec deldept 4

--delete from designation
create procedure deldesign
@deid int
as
begin
delete from Designation where DesignationID = @deid
end

exec deldesign 15

--update in person
create procedure updateperson
@pid int,
@fname varchar(50)
as
begin
update PERSON set FirstName = @fname where WorkerID = @pid
end

exec updateperson 101, 'Dhara'

--update in department
create procedure updatedept
@did int,
@dname varchar(50)
as
begin
update Department set DepartmentName = @dname where DepartmentID = @did
end

exec updatedept 1,'Development'

--update in designation
create procedure updatedesign
@did int,
@dname varchar(50)
as
begin
update Designation set DesignationName = @dname where DesignationID = @did
end

exec updatedesign 11,'Developer'

--insert in person
create procedure insertperson
@fname varchar(50),
@lname varchar,
@sal int,
@date date,
@deptid int,
@designid int
as
begin
insert into PERSON ( FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID)  values ( @fname, @lname, @sal, @date, @deptid, @designid)
end

exec insertperson 'Dhara', 'M.', 20000, '04/06/2024', 1, 11

--insert in dept
create procedure insertdept
@did int,
@dname varchar
as
begin
insert into Department (DepartmentID, DepartmentName) values (@did, @dname)
end

exec insertdept 5,'Testing'

--insert into design
create procedure insertdesign
@did int,
@dname varchar
as
begin
insert into Designation(DesignationID, DesignationName) values (@did, @dname)
end

exec insertdesign 16,'Worker'

--2==================================
--select pk for person
create procedure pkperson1
@pid int
as
begin
select WorkerID from PERSON where WorkerID = @pid
end

exec pkperson1 101

--select pk for dept 
create procedure pkdept1
@did int
as
begin
select DepartmentID from Department where DepartmentID = @did
end

exec pkdept1 1

--select pk fro design
create or alter procedure pkdesign1
@did int
as
begin
select DesignationID from Designation where DesignationID = @did
end

exec pkdesign1 11

--3============================
create procedure joinpro
as
begin
select p.WorkerID, p.FirstName, p.LastName, p.Salary, p.JoiningDate, d.DepartmentID, de.DesignationID, d.Departmentname, de.DesignationName
from PERSON p
left join Department d
on p.DepartmentID = d.DepartmentID
left join Designation de
on p.DesignationID = de.DesignationID
end

exec joinpro

--4=======================
create procedure showtop3
as
begin
select top 3 * from PERSON
end

exec showtop3

--========================= PART B ========================
--1
create or alter procedure partb1
@deptname varchar(50)
as
begin
select p.WorkerID, p.FirstName, d.DepartmentName
from PERSON p
JOIN Department d
on p.DepartmentID = d.DepartmentID
where d.DepartmentName = @deptname
end

exec partb1 'IT'

--2
create procedure partb2
@deptname varchar(50),
@designname varchar(50)
as
begin
select p.FirstName, p.Salary, p.JoiningDate, d.DepartmentName, de.DesignationName
from PERSON p
left join Department d
on p.DepartmentID = d.DepartmentID
left join Designation de
on p.DesignationID = de.DesignationID
where d.DepartmentName = @deptname AND de.DesignationName = @designname
end

exec partb2 'IT', 'Jobber'

--3
create procedure partb3
@fname varchar(50)
as
begin
select p.FirstName, p.Salary, p.JoiningDate, d.DepartmentName, de.DesignationName
from PERSON p
left join Department d
on p.DepartmentID = d.DepartmentID
left join Designation de
on p.DesignationID = de.DesignationID
where p.FirstName = @fname
end

exec partb3 'Rahul'

--4
create or alter procedure partb4
as
begin
select d.DepartmentName, MIN(p.Salary) as MinSalary, MAX(p.Salary) as MaxSalary, SUM(p.Salary) as TotalSalary
from PERSON p
join Department d
on p.DepartmentID = d.DepartmentID
group by d.DepartmentName
end

exec partb4

--5
create procedure partb5
as
begin
select d.DesignationName, AVG(p.Salary) as AvgSalary, SUM(p.Salary) as TotalSalary
from PERSON p
join Designation d
on p.DesignationID = d.DesignationID
group by d.DesignationName
end

exec partb5

--============================== PART C ========================
--1
create procedure partc1
@dname varchar(50)
as
begin
select d.Departmentname, COUNT(p.WorkerID)
from Department d
join PERSON p
on d.DepartmentID = p.DepartmentID
group by d.DepartmentName
end

exec partc1 'IT'

--2
create or alter procedure partc2
@deptname varchar(50),
@designname varchar(50)
as
begin
select p.FirstName, p.Salary, p.JoiningDate, d.DepartmentName, de.DesignationName
from PERSON p
left join Department d
on p.DepartmentID = d.DepartmentID
left join Designation de
on p.DesignationID = de.DesignationID
where (d.DepartmentName IS NULL AND de.DesignationName = @designname) OR (de.DesignationName IS NULL AND d.DepartmentName = @deptname)
end

exec partc2 'IT', NULL
exec partc2 NULL, 'Jobber'
exec partc2 'IT', 'Jobber'
exec partc2 NULL, NULL

--3
create or alter procedure finalans
as
begin
select d.DepartmentID, d.Departmentname, COUNT(p.WorkerID) as WorkerCount
from PERSON p
join Department d
on p.DepartmentID = d.DepartmentID
group by d.DepartmentID, d.DepartmentName
end

exec finalans