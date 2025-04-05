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
BULK INSERT CustomerDemo
from 'C:\Users\ABDULKHOFIZ\Downloads\Telegram Desktop\class_text.txt'
with(
fieldterminator=',',
rowterminator='\n',
TABLOCK
)
