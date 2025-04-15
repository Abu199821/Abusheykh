CREATE DATABASE Lesson_5
use Lesson_5
--(Task-1)Write a query that uses an alias to rename the ProductName column as Name in the Products table.
Select ProductName as Name from Products;

--(Task-2)Write a query that uses an alias to rename the Customers table as Client for easier reference.
select*from CUSTOMERS as Client;

--(Task-3)Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
select ProductName from Products_Discounted
Union
select ProductName from Products;

--(Task-4)Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
SELECT * FROM Products_Discounted
INTERSECT
SELECT * FROM Products;

--(Task-5)Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
SELECT DISTINCT FirstName,Country from CUSTOMERS;

--(Task-6)Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
SELECT Price, CASE 
WHEN Price>1000 THEN 'HIGH'
ELSE 'LOW'
END AS Yangi_ustun
FROM Products;
--(Task-7)Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
SELECT *, IIF(StockQuantity>100,'Yes','No') As New_Column 
FROM Products_Discounted;
--(Task-8)Use UNION to combine results from two queries that select ProductName from Products and ProductName from OutOfStock tables.
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM OutOfStock;
--(Task-9) Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
SELECT ProductName FROM Products
EXCEPT
SELECT ProductName FROM Products_Discounted;

--(Task-10)Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
SELECT*,IIF(Price>1000,'Expensive','Affordable') AS PRICE_LEVEL 
FROM Products;

--(Task-11)Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.
SELECT * 
FROM Employees
WHERE Age < 25 OR Salary > 60000;

--(Task-12)Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
SELECT *, CASE
WHEN DepartmentName='HR'THEN Salary*1.1
WHEN EmployeeID=5 THEN Salary*1.1
ELSE Salary
END AS Update_Salary
FROM Employees;

--(Task-13)Use INTERSECT to show products that are common between Products and Products_Discounted tables.
SELECT * FROM Products
INTERSECT
SELECT * FROM Products_Discounted;

--(Task-14)Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)
SELECT*,
CASE 
 WHEN SaleAmount>500 THEN 'Top Tier'
 WHEN SaleAmount<500 and SaleAmount>200 THEN 'Mid Tier'
 ELSE 'Low Tier'
 END AS Quality_level
 FROM Sales;


--(Task-15)Use EXCEPT to find customers' ID who have placed orders but do not have a corresponding record in the Invoices table.
SELECT CustomerID FROM orders
EXCEPT 
SELECT CustomerID FROM invoices;

 --(Task-16) Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased.Use orders table. Result set should show customerid, quantity and discount percentage. The discount should be applied as follows: 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%
SELECT*,
CASE
WHEN Quantity=1 THEN '3% Discount'
WHEN Quantity>1 AND Quantity<=3 THEN '5% Discount'
ELSE '7% Discount'
END AS Discounts
FROM Orders;
