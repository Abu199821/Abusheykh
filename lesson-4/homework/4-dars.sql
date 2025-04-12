use Lesson_4
--(Task-1)Write a query to select the top 5 employees from the Employees table.
SELECT TOP 5 [FirstName],
[LastName],
[DepartmentName],
[Salary],
[HireDate],
[Email],
[Country]
FROM [dbo].[Employees];


--(Task-2)Use SELECT DISTINCT to select unique ProductName values from the Products table.
Select Distinct ProductName from Products_Discounted;
--(Task-3)Write a query that filters the Products table to show products with Price > 100.
select * from  Products_Discounted where Price>100;
--(Task-4) Write a query to select all CustomerName values that start with 'A' using the LIKE operator.
select * from Customers where FirstName like 'A%';
--(Task-5) Order the results of a Products query by Price in ascending order.	
Select  * from Products_Discounted order by Price asc;
--(Task-6) Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.
select * from Employees 
where Salary>=60000 AND DepartmentName ='HR';
--(Task-7) Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table
SELECT ISNULL(Email,'noemail@example.com') AS Updated_Email from Employees;
--(Task-8) Write a query that shows all products with Price BETWEEN 50 AND 100.
select*from Products_Discounted where Price>50 and Price<100;

--(Task-9)Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.
SELECT DISTINCT Category,ProductName FROM Products_Discounted;
--(Task-10)After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.
SELECT DISTINCT Category,ProductName FROM Products_Discounted order by ProductName desc;
--(Task-11)Write a query to select the top 10 products from the Products table, ordered by Price DESC.
SELECT TOP 10 * FROM [dbo].[Products_Discounted] ORDER BY Price desc;
--(Task-12)Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
SELECT COALESCE(FirstName, LastName) AS First_Null
FROM Employees;

--(Task-13)Write a query that selects distinct Category and Price from the Products table.
SELECT DISTINCT Category,Price FROM Products_Discounted;
--(Task-14)Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
SELECT*FROM Employees WHERE Age=30 and Age=40 or DepartmentName='Marketing';
--(Task-15)Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
SELECT * FROM Employees
ORDER BY Salary DESC
OFFSET 11 ROWS FETCH NEXT 20 ROWS only;
--(Task-16)Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
SELECT * FROM Products_Discounted WHERE Price<=1000 and StockQuantity>50 
ORDER BY StockQuantity asc;
--(Task-17)Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
SELECT * FROM Products_Discounted WHERE ProductName like 'e%';
--(Task-18)Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.
SELECT * FROM Employees WHERE DepartmentName IN ('HR','IT','Finance');
--(Task-19)Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table
SELECT * FROM Customers ORDER BY City asc , PostalCode desc;
--(Task-20)Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
SELECT TOP 10 SaleAmount
FROM Sales
ORDER BY SaleAmount DESC;

--(Task-21)Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)
SELECT (FirstName+' 'Lastname) as FullName FROM Employees
--(Task-22)Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
SELECT DISTINCT Category,ProductName,Price FROM Products_Discounted where Price>50 
--(Task-23)Write a query that selects products whose Price is less than 10% of the average price in the Products table.(Do some research on how to find average price of all products)
SELECT * FROM Products_Discounted
where (select avg(Price) from Products_Discounted)*0.1>Price
--(Task-24)Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
SELECT*FROM Employees
WHERE Age<30 and DepartmentName in ('IT', 'HR')
--(Task-25)Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
SELECT*FROM Customers 
WHERE Email like '%@gmail.com'
--(Task-26)Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
Sales Department is not exist in Employees table


--(Task-27)Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and CURRENT_DATE. (Search how to get the current date)
SELECT *
FROM Orders
WHERE DateDiff(day,OrderDate,Getdate())>180








