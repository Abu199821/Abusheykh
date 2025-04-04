-- task 1
CREATE TABLE employees ( 
EmpID int,
Name Varchar(50),
Salary Decimal(10,2));
--task 2
INSERT INTO employees(EmpID,Name,Salary) VALUES (1,'JOHN', 2000);

INSERT INTO employees(EmpID,Name,Salary) VALUES (8,'Dilshod',4933);
--task 3
SELECT * from employees;
UPDATE employees SET Salary=4500 where EmpID=1;
--task 4
DELETE FROM employees where EmpID=2;
--task 5
CREATE TABLE CARS (NAME VARCHAR(20),YEAR INT,PRICE DECIMAL (8,1));
INSERT INTO CARS ( 
NAME,
YEAR,
PRICE)
VALUES (
'LACETTI',
2008,
3500);
DELETE FROM CARS WHERE NAME='LACETTI';
TRUNCATE table CARS;
SELECT * FROM CARS;
DROP TABLE CARS;
--Task 6
ALTER TABLE	employees ALTER COLUMN Name Varchar(100);
--Task 7
ALTER TABLE employees ADD DEPARTMENT Varchar(50);
SELECT*FROM employees;
--Task 8
ALTER TABLE employees ALTER COLUMN SALARY float(2);
--TASK 9
CREATE TABLE Departments (DepartemntID int PRIMARY KEY,
DepartmentName varchar(50),salary char(50));
--task 10 
DROP TABLE employees;
--task 11
ALTER TABLE Departments ADD Salary char(50);
INSERT INTO Departments (DepartemntID,DepartmentName) SELECT DISTINCT 1,'Management';
SELECT * FROM Departments;
UPDATE Departments SET Salary=5000;
INSERT INTO Departments (DepartemntID,DepartmentName,salary) SELECT DISTINCT 5,'IT Manager',3500;
UPDATE Departments SET DepartmentName='IT_Manager' WHERE DepartmentName='IT Manager';
--Task 12
UPDATE Departments Set DepartmentName='Manager' WHERE Salary>5000;
--Task 13
TRUNCATE TABLE Departments;
--Task 15
EXEC sp_rename 'Employees','StaffMembers';
--Task 16
DROP TABLE StaffMembers;
--Task 17
CREATE TABLE Products(ProductID int PRIMARY KEY,ProductName VARCHAR(20),Category VARCHAR(20),Price DECIMAL(12,2));
--Task 18
ALTER TABLE Products ADD CONSTRAINT Price CHECK (Price>0);
--Task 19
ALTER TABLE Products ADD StockQuantity int DEFAULT 50; 
--Task 20
EXEC sp_rename 'Products.Category','ProductCategory','COLUMN';
SELECT*from Products;
--Task 21
INSERT INTO Products(ProductID,ProductName,ProductCategory,Price) VALUES (5,'Mandarin','Mevalar',7000);
--Task 22
SELECT*INTO Products_Backup From Products;
SELECT*FROM Products_Backup;
--Task 23
EXEC sp_rename 'Products','inventory';
SELECT*FROM inventory;
--Task 24
ALTER TABLE inventory ALTER COLUMN Price DECIMAL(10,2);
--Task 25
ALTER TABLE inventory ADD ProductCode int IDENTITY(1000,5);
SELECT*FROM inventory
