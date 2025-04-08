--(Task-1) Define and explain the purpose of BULK INSERT in SQL Server.
BULK INSERT provides chance to insert large volume of date in ease at once.Inserting rows one by one with INSERT command takes long time.

--(Task-2) List four file formats that can be imported into SQL Server.
--Excel, Text, XML, JSON
	

--(Task-3) Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
CREATE TABLE Products (ProductID INT PRIMARY KEY,ProductName VARCHAR(50),Price DECIMAL(10,2));

--(Task-4) Insert three records into the Products table using INSERT INTO.
INSERT INTO Products (ProductID,ProductName,Price) VALUES (1,'Apple',4500);
INSERT INTO Products (ProductID,ProductName,Price) VALUES (2,'Potato',3000);
INSERT INTO Products (ProductID,ProductName,Price) VALUES (3,'Onion',1000);

--(Task-5) Explain the difference between NULL and NOT NULL with examples.
--Diffreneces between NULL and NOTNULL
--NULL
CREATE TABLE NULLDEMO (DemoID int,DemoName Varchar(50));
INSERT INTO NULLDEMO (DemoID ) VALUES (1);
--In this condition Automatically NULL is taken for DemoName deu to there is no Constrains for 'NOT NULL'.
--NOT NULL
CREATE TABLE NULLDEMO (DemoID int,DemoName Varchar(50) NOT NULL);
INSERT INTO NULLDEMO (DemoID ) VALUES (1);
--In the Second Condition above Command Insert Into will not be excecuted deu to there is Constraint NOT NULL.

--(Task-6)Add a UNIQUE constraint to the ProductName column in the Products table.
ALTER TABLE Products ADD CONSTRAINT unique_Product_Name UNIQUE (ProductName);

--(Task-7)Write a comment in a SQL query explaining its purpose.
-- SQL is the programming language which can be connecting Databases and it allow to access volume of data importing and manupilating.

--(Task-8) Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
CREATE TABLE Categories ( CategroyID INT PRIMARY KEY ,CategoryName VARCHAR(50) UNIQUE);

--(Task-9)Explain the purpose of the IDENTITY column in SQL Server.
The IDENTITY property can automatically increment values in a column.
CREATE TABLE PRODUCT_TABLE (Product_ID int IDENTITY(1,1),PRODUCTNAME VARCHAR(20))

--(Task-10)Use BULK INSERT to import data from a text file into the Products table.
bulk insert customer
from 'C:\Users\ABDULKHOFIZ\Downloads\Telegram Desktop\customer.txt'
with
(
fieldterminator=',',
rowterminator='\n'
)
--(Task-11) Create a FOREIGN KEY in the Products table that references the Categories table.
CREATE TABLE TABLE1 
(DEM1_ID INT PRIMARY KEY IDENTITY(1,1),DEM1_NAME VARCHAR(50),DEM1_SALARY DECIMAL(10,2))

INSERT INTO TABLE1 VALUES (1,'JOHN',2000),(2,'SAMANTA',3500),(3,'LOCKY',5000);

CREATE TABLE TABLE2 
(DEM2_ID INT IDENTITY(1,1),DEM2_NAME VARCHAR(50),DEM1_ID INT,DEM2_BONUS DECIMAL(12,2)
FOREIGN KEY (DEM1_ID) REFERENCES TABLE1(DEM1_ID));

INSERT INTO TABLE2 VALUES ('BRANDON',1,3200),('ROCKY',2,5000),('LAWRENCE',3,4030)

--(Task-12)  Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.

Primary key is the unical aspect of the row and it exists only one for one table, FOREIGN KEY connects with PRIMARY KEY it bounds two diffrient tables.

--(Task -13)Add a CHECK constraint to the Products table ensuring Price > 0.
ALTER TABLE Products ADD CONSTRAINT Check_Price CHECK (Price>0);

--(Task-14) Modify the Products table to add a column Stock (INT, NOT NULL).
ALTER TABLE Products ADD column_name Stock INT NOT NULL;
--(Task-15) Use the ISNULL function to replace NULL values in a column with a default value.
select ISNULL(Price,0) from Products
--(Task -16) Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
Foriegn Key is the one of the constraint which can allow to generalize multible tables with the specific column 
and it connects with the column which has Pirmary Key constraint set.
--(Task -17)Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.

create table Customers(Id int,Fname Varchar(50),Lname Varchar(50),Age int CONSTRAINT age Check( age>=18))

--(Task-18) Create a table with an IDENTITY column starting at 100 and incrementing by 10.
Create table DemoTable(ID INT IDENTITY (100,10))
--(Task-19)  Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
Create Table OrderDetails(OrderID int,ProductID int Primary Key(OrderID,ProductID))
--(Task-20) Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.
ISNULL is used for replacing NULL with Default value and it retrieve Value which is not NULL other wise retrieve second default value: select isnull(Coulmn1,Value) RESULT WILL BE Value.
COALESCE is used for retrieve first values which is not NULL in many parameters;
select COALESCE (NULL,NULL,NULL, 'HELLO') RESULT = 'HELLO'.
--(Task-21) Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
CREATE TABLE employees ( EmpID int PRIMARY KEY,Email VARCHAR(50) UNIQUE);
--(Task -22) Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID) ON DELETE CASCADE ON UPDATE CASCADE
);

































