create table Person
(PersonID int Primary key,
PersonName varchar(100) not null,
Salary decimal(8,2) not null,
JoiningDate Datetime not null,
City Varchar(100) not null,
Age int,
BirthDate DateTime not null)

create table PersonLog
(PLogID int Primary key,
PersonID int not null,
PersonName varchar(250) not null,
Operation varchar(50) not null,
UpdateDate DateTime not null)



