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
    Branch VARCHAR(50),
    SPI DECIMAL(4, 2),
    Bklog INT
);

INSERT INTO STUDENT (Rno, Name, Branch, SPI, Bklog) VALUES
(101, 'Raju', 'CE', 8.80, 0),
(102, 'Amit', 'CE', 2.20, 3),
(103, 'Sanjay', 'ME', 1.50, 6),
(104, 'Neha', 'EC', 7.65, 0),
(105, 'Meera', 'EE', 5.52, 2),
(106, 'Mahesh', 'General', 4.50, 3);
