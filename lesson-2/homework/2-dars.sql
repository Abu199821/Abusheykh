--Basic level tasks (10)
CREATE TABLE Employee(
EmpID int,
Name varchar(50),
Salary DECIMAL (10,2)
)

INSERT INTO Employee(EmpID, Name, Salary) VALUES
(1, 'JOHN EVANS', 5.400),
(2, 'PAUL FORD', 7.200),
(3, 'TOMMY GREEN', 3.800)

UPDATE Employee
SET SALARY = 6.40 
WHERE EmpID = 1

DELETE  FROM Employee
WHERE EmpID =2

--	Removes specific rows based on a condition
--  Removes all rows in the table
--  Removes all data (table is gone)

ALTER TABLE Employee
ALTER COLUMN NAME VARCHAR(100);

ALTER TABLE Employee
ADD DEPARTMENT VARCHAR(50);

ALTER TABLE Employee
ALTER COLUMN SALARY FLOAT



CREATE TABLE DEPARTMENTS(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(50),
)

UPDATE Employee
SET DEPARTMENT = 'MANAGMENT'
WHERE EmpID = 1

UPDATE Employee
SET DEPARTMENT = 'IT'
WHERE EmpID = 3

SELECT * from Employee

--intermediate-Level Tasks (6)
INSERT INTO DEPARTMENTS (DepartmentID, DepartmentName) VALUES
(1, 'IT'),
(2, 'MANAGMENT'),
(3, 'MEDICINE'),
(4, 'ACCOUNTING'),
(5, 'SCIENCE')

UPDATE EMPLOYEE
SET DEPARTMENT = 'Management'
WHERE Salary > 5000;

ALTER TABLE EMPLOYEE
DROP COLUMN DEPARMENT

EXEC sp_rename 'Employee', 'StaffMembers';

DROP TABLE DEPARMENTS
SELECT * FROM StaffMembers

--Advanced-Level Tasks (9)
-- Create the PRODUCTS table with specified lengths for VARCHAR columns
CREATE TABLE PRODUCTS (
    ProductID INT PRIMARY KEY, 
    ProductName VARCHAR(255),  -- Increased size to accommodate longer product names
    ProductCategory VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT DEFAULT 50);

-- Add CHECK constraint to ensure Price is greater than 0
ALTER TABLE PRODUCTS
ADD CONSTRAINT chk_price CHECK (Price > 0);


-- Rename Category column to ProductCategory
EXEC sp_rename 'PRODUCTS.Category', 'ProductCategory', 'COLUMN';

-- Insert values into the PRODUCTS table
INSERT INTO PRODUCTS (ProductID, ProductName, ProductCategory, Price, StockQuantity) 
VALUES
(1, 'Deodorant', 'Perfume', 3.00, 100),
(2, 'Apple', 'Fruit', 4.00, 10),
(3, 'Chocolate', 'Sweet', 2.00, 8),
(4, 'Iphone', 'Tech', 1.30, 20),
(5, 'TV ', 'Tech', 6.75, 30);

SELECT * 
INTO PRODUCT_BACKUP
FROM PRODUCTS

EXEC sp_rename 'PRODUCTS', 'Inventory';

ALTER TABLE Inventory
DROP CONSTRAINT chk_price;


ALTER TABLE Inventory
ALTER COLUMN Price FLOAT;

ALTER TABLE Inventory
ADD PRODUCT_CODE INT IDENTITY (1000,5);


SELECT * FROM Inventory;
