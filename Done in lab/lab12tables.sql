CREATE TABLE Designation (
    DesignationID INT PRIMARY KEY,
    DesignationName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE PERSON (
    WorkerID INT PRIMARY KEY,
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
('Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11),
('Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11),
('Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13),
( 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15),
( 'Priya', 'Mehta', 25000, '1990-10-18', 2, NULL),
( 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15);

--====================== PART A ==================================
--1
--delete sp for department
create procedure deletedept
@did int
as
begin
delete from Department where DepartmentID = @did
end
--delete sp for designation
create procedure deletedesign
@did int
as
begin
delete from Designation where DesignationID = @did
end
--delete sp for person
create procedure deleteperson
@pid int
as
begin
delete from PERSON where WorkerID = @pid
end

--update sp for dept
create procedure updatedept
@dname varchar(50),
@did int
as
begin
update Department set DepartmentName = @dname where DepartmentID = @did
end
--update sp for design
create procedure updatedesign
@dname varchar(50),
@did int
as
begin
update Designation set DesignationName = @dname where DesignationID = @did
end
--update sp for person
create procedure updateperson
@pname varchar(50),
@pid int
as
begin
update PERSON set FirstName = @pname where WorkerID = @pid
end

--insert sp for department
create procedure insertdept
@did int,
@dname varchar(50)
as
begin
insert into Department (DepartmentID, DepartmentName) values (@did, @dname)
end
--insert sp for designation 
create procedure insertdesign
@did int,
@dname varchar(50)
as
begin
insert into Designation(DesignationID, DesignationName) values (@did, @dname)
end
--insert sp for person
create procedure insertperson
@pid int,
@fname varchar(50),
@lname varchar(50),
@salary decimal(8,2),
@date date,
@did int,
@dname varchar(50)
as
begin
insert into PERSON(WorkerID,FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID) values (@pid, @fname, @lname, @salary, @date, @did, @dname)
end

--2============================
--select primary key for dept
create procedure selectpkdept
as
begin
select DepartmentID from Department
end

--design select pk
create procedure selectpkdesign
as
begin
select DesignationID from Designation
end

--person select pk
create procedure selectpkperson
as
begin
select WorkerID from PERSON
end

--3==========================
create procedure alltables
as
begin
select p.WorkerID, p.FirstName, p.Salary, p.JoiningDate, d1.DepartmentID, d2.DesignationID
from PERSON p
left join Department d1
on p.DepartmentID = d1.DepartmentID
left join Designation d2
on p.DepartmentID = d2.DesignationID
end

--4========================
create procedure top3person
as
begin
select top 3 * from PERSON
end

--========================== PART B ============================
--1
create procedure deptandpersons
@dname varchar(50)
as
begin
select d.DepartmentName, p.Firstname, p.LastName
from PERSON p
inner join Department d
on p.DepartmentID = d.DepartmentID
where d.DepartmentID = @dname
end

--2
create procedure deptdesignandpersons
@deptname varchar(50),
@designname varchar(50)
as
begin
select dept.DepartmentName, p.Firstname, p.LastName, p.Salary, p.JoiningDate
from PERSON p
inner join Department dept
on p.DepartmentID = dept.DepartmentID
where dept.DepartmentName = @deptname
end

--3
create procedure displayperson
@fname varchar(50)
as
begin
select * from PERSON where FirstName = @fname
end

--4
create procedure minmaxdisplay
@did int
as
begin
select MIN(Salary), MAX(Salary), SUM(Salary) 
from PERSON 
where DepartmentID = @did
group by DepartmentID
end

--5
create procedure avgtotaldisplay
@did int
as
begin
select AVG(Salary), SUM(Salary)
from PERSON 
where DesignationID = @did
group by DesignationID
end

--====================== PART C ========================
--1
create procedure personcount
@did int
as
begin
select count(WorkerID) from PERSON 
where DepartmentID = @did
group by DepartmentID
end

--2
create or alter procedure testcases
@deptname varchar(50),
@dname varchar(50)
as
begin
select p.FirstName, p.LastName, p.Salary, p.JoiningDate, dept.DepartmentName, d.DesignationName
from PERSON p
left join Department dept
on p.DepartmentID = dept.DepartmentID
left join Designation d
on p.DesignationID = d.DesignationID
where (DepartmentName is null AND DesignationName = @dname)
or
(DepartmentName = @deptname AND DesignationName is null)
end

exec testcases @deptname = 'IT', @dname = NULL
exec testcases @deptname = NULL , @dname = 'Jobber'
exec testcases @deptname = 'IT', @dname = 'Jobber'
exec testcases @deptname = NULL , @dname = NULL

--3
create procedure PersonDeptDesignCount
as
begin
select d.DepartmentID, d.DepartmentName, count(p.WorkerID) from Department d
join PERSON P
on p.DepartmentID = d.DepartmentID
group by DepartmentName, d.DepartmentID
end
