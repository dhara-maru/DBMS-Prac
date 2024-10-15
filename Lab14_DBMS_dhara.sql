CREATE TABLE Products (
    Product_id INT PRIMARY KEY,
    Product_Name VARCHAR(250) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);

INSERT INTO Products (Product_id, Product_Name, Price) VALUES
(1, 'Smartphone', 35000),
(2, 'Laptop', 65000),
(3, 'Headphones', 5500),
(4, 'Television', 85000),
(5, 'Gaming Console', 32000);


--============ PART A ===================
--1
DECLARE Product_Cursor CURSOR FOR
SELECT * FROM Products;

OPEN Product_Cursor;

FETCH NEXT FROM Product_Cursor;

CLOSE Product_Cursor;
DEALLOCATE Product_Cursor;

--2
DECLARE Product_Cursor_Fetch CURSOR FOR
SELECT CAST(Product_id AS VARCHAR) + '_' + Product_Name AS ProductID_ProductName
FROM Products;

OPEN Product_Cursor_Fetch;

FETCH NEXT FROM Product_Cursor_Fetch;

CLOSE Product_Cursor_Fetch;
DEALLOCATE Product_Cursor_Fetch;

--3
DECLARE @Product_id INT; 
DECLARE Product_CursorDelete CURSOR FOR
SELECT Product_id FROM Products;

OPEN Product_CursorDelete;


FETCH NEXT FROM Product_CursorDelete INTO @Product_id;

WHILE @@FETCH_STATUS = 0
BEGIN
    DELETE FROM Products WHERE Product_id = @Product_id;
    FETCH NEXT FROM Product_CursorDelete INTO @Product_id;
END

CLOSE Product_CursorDelete;
DEALLOCATE Product_CursorDelete;

--==================== PART B ========================
--1
DECLARE @Product_id INT, @Price DECIMAL(10,2);

DECLARE Product_CursorUpdate CURSOR FOR
SELECT Product_id, Price FROM Products;

OPEN Product_CursorUpdate;

FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Price;


WHILE @@FETCH_STATUS = 0
BEGIN
  
    UPDATE Products
    SET Price = @Price * 1.10
    WHERE Product_id = @Product_id;
    
    
    FETCH NEXT FROM Product_CursorUpdate INTO @Product_id, @Price;
END

CLOSE Product_CursorUpdate;
DEALLOCATE Product_CursorUpdate;

