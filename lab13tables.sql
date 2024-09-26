use LAB13_DBMS_dhara
CREATE TABLE Person2 (
    PersonID int PRIMARY KEY IDENTITY(101,1),
    PersonName varchar(100) NOT NULL,
    Salary decimal(8,2) NOT NULL,
    JoiningDate datetime NOT NULL,
    City varchar(100) NOT NULL,
    Age int,
    BirthDate datetime NOT NULL
);


create table PersonLog
(PLogID int Primary key,
PersonID int not null,
PersonName varchar(250) not null,
Operation varchar(50) not null,
UpdateDate DateTime not null)




