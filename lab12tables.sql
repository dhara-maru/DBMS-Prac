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

INSERT INTO PERSON (WorkerID, FirstName, LastName, Salary, JoiningDate, DepartmentID, DesignationID) VALUES
(101, 'Rahul', 'Anshu', 56000, '1990-01-01', 1, 12),
(102, 'Hardik', 'Hinsu', 18000, '1990-09-25', 2, 11),
(103, 'Bhavin', 'Kamani', 25000, '1991-05-14', NULL, 11),
(104, 'Bhoomi', 'Patel', 39000, '2014-02-20', 1, 13),
(105, 'Rohit', 'Rajgor', 17000, '1990-07-23', 2, 15),
(106, 'Priya', 'Mehta', 25000, '1990-10-18', 2, NULL),
(107, 'Neha', 'Trivedi', 18000, '2014-02-20', 3, 15);