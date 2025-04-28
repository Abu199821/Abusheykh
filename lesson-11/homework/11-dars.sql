
Homework_11

--Task(1): Show all orders placed after 2022 along with the names of the customers who placed them.
SELECT
      O.OrderID,
	  C.FirstName AS CustomerName,
	  O.OrderDate   
FROM Orders AS O
INNER JOIN Customers AS C ON O.CustomerID=C.CustomerID;

--Task(2)Display the names of employees who work in either the Sales or Marketing department.
--Return: EmployeeName, DepartmentName
SELECT
     E.Name AS EmployeeName,
     D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D
ON E.DepartmentID=D.DepartmentID
WHERE D.DepartmentName IN ('Sales','Marketing');


--Task(3) For each department, show the name of the employee who earns the highest salary.
--Return: DepartmentName, TopEmployeeName, MaxSalary
SELECT 
    D.DepartmentName,
    E.Name AS TopEmployeeName,
    E.Salary AS MaxSalary
FROM 
    Employees AS E
INNER JOIN 
    Departments AS D ON E.DepartmentID = D.DepartmentID
WHERE 
    E.Salary = (
        SELECT MAX(Salary)
        FROM Employees
        WHERE DepartmentID = E.DepartmentID
    )
ORDER BY 
    D.DepartmentName;


--Task(4)List all customers from the USA who placed orders in the year 2023.
--return: CustomerName, OrderID, OrderDate
---USE Oreder and Customer Tables	
SELECT 
      C.FirstName AS CustomerName,
	  O.OrderID,
	  O.OrderDate  
FROM ( SELECT * 
      FROM Customers WHERE Country='USA')  AS C
iNNER JOIN (SELECT * 
           FROM Orders WHERE YEAR(OrderDate)=2023) AS O
ON C.CustomerID=O.CustomerID;


----Task(5)Return: CustomerName, TotalOrders
--Task: Show how many orders each customer has placed.
--Tables Used: Orders (as a derived table), Customers
SELECT C.FirstName AS CustomerName,
       O.TotalOrders 
FROM (   SELECT 
                CustomerID,
		        COUNT(OrderID) AS TotalOrders 
	     FROM Orders
         GROUP BY CustomerID ) AS O
INNER JOIN (SELECT FirstName,CustomerID  FROM Customers) AS C
ON O.CustomerID=C.CustomerID;


----Task(6)Return: ProductName, SupplierName
--Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
--Tables Used: Products, Suppliers
SELECT 
    P.ProductName,
	S.SupplierName 
FROM Products AS P
   INNER JOIN Suppliers AS S
   ON P.SupplierID=S.SupplierID
WHERE S.SupplierName IN ('Gadget Suppliers','Clothing Mart');

	----Return: CustomerName, MostRecentOrderDate, OrderID
	----Task(7): For each customer, show their most recent order. Include customers who haven't placed any orders.
	----Tables Used: Customers, Orders (as a derived table)
SELECT
   C.FirstName AS CustomerName,
   MostRecentOrderDate,
   O.OrderID 
FROM Customers AS C
LEFT JOIN (
        SELECT 
          CustomerID,
		  MAX(OrderDate) AS MostRecentOrderDate,
		  MAX(OrderID)AS OrderID 
		FROM Orders
        GROUP BY CustomerID) AS O
    ON C.CustomerID=O.CustomerID;


----Return: CustomerName, OrderID, OrderTotal
----Task(8): Show the customers who have placed an order where the total amount is greater than 500.
----Tables Used: Orders, Customers

SELECT 
   C.FirstName as CustomerName,
   O.OrderID,
   O.TotalAmount AS OrderTotal
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID=O.CustomerID
WHERE O.TotalAmount>500
ORDER BY OrderTotal Desc;

--Return: ProductName, SaleDate, SaleAmount
--Task(9): List product sales where the sale was made in 2022 or the sale amount exceeded 400.
--Tables Used: Products, Sales
SELECT 
      P.ProductName,
	  S.SaleDate,
	  S.SaleAmount
FROM Products AS P
INNER JOIN Sales AS S ON S.ProductID=P.ProductID
WHERE YEAR(S.SaleDate)=2022 OR S.SaleAmount>400
ORDER BY S.SaleAmount DESC;

--Return: ProductName, TotalSalesAmount
--Task(10): Display each product along with the total amount it has been sold for.
--Tables Used: Sales (as a derived table), Products
SELECT 
      P.ProductName,
	  S.TotalSalesAmount 
FROM Products AS P
     INNER JOIN (SELECT
	               ProductID,
				   sum(SaleAmount) as TotalSalesAmount 
				 FROM Sales
Group By ProductID) AS S ON S.ProductID=P.ProductID;

--Return: EmployeeName, DepartmentName, Salary
--Task(11): Show the employees who work in the HR department and earn a salary greater than 50000.
--Tables Used: Employees, Departments
SELECT 
      E.name as EmployeeName,
	  D.DepartmentName,
	  E.Salary
FROM Employees AS E
INNER JOIN Departments AS D ON E.DepartmentID=D.DepartmentID
WHERE D.DepartmentName='HR' AND E.Salary>50000;


--Return: ProductName, SaleDate, StockQuantity
--Task(12): List the products that were sold in 2023 and had more than 50 units in stock at the time.
--Tables Used: Products, Sales

SELECT 
     P.ProductName,
	 S.SaleDate,
	 P.StockQuantity
FROM Products AS P
INNER JOIN Sales AS S ON P.ProductID=S.ProductID
WHERE YEAR(S.SaleDate)=2023 AND P.StockQuantity>50
ORDER BY P.StockQuantity DESC;

--Return: EmployeeName, DepartmentName, HireDate
--Task(13): Show employees who either work in the Sales department or were hired after 2020.
--Tables Used: Employees, Departments

SELECT 
      E.Name AS EmployeeName,
	  D.DepartmentName,
	  E.HireDate
FROM Employees AS E
     INNER JOIN Departments as D ON E.DepartmentID=D.DepartmentID
WHERE YEAR(HireDate)>2020 or 
       D.DepartmentName='Sales';

--Return: CustomerName, OrderID, Address, OrderDate
--Task(14): List all orders made by customers in the USA whose address starts with 4 digits.
--Tables Used: Customers, Orders
 SELECT 
       C.FirstName AS CustomerName,
	   O.OrderID,
	   C.Address,
	   O.OrderDate 
 FROM Customers AS C
 INNER JOIN Orders AS O ON C.CustomerID=O.CustomerID
 WHERE C.Country='USA' AND C.Address LIKE '____%';


--Return: ProductName, Category, SaleAmount
--Task(15): Display product sales for items in the Electronics category or where the sale amount exceeded 350.
--Tables Used: Products, Sales

SELECT 
      P.ProductName,
	  P.Category,
	  S.SaleAmount 
FROM Products as P
INNER JOIN Sales AS S ON P.ProductID=S.ProductID
WHERE P.Category='Electronics' OR S.SaleAmount>350
ORDER BY S.SaleAmount DESC;



--Return: CategoryName, ProductCount
--Task(16): Show the number of products available in each category.
--Tables Used: Products (as a derived table), Categories

SELECT 
      C.CategoryName,
	  ProductCount
FROM ( SELECT 
             Category,
			 COUNT(ProductID) AS ProductCount        
	   FROM Products
	   GROUP BY Category) AS P
INNER JOIN Categories AS C ON C.CategoryID=P.Category



--Return: CustomerName, City, OrderID, Amount
--Task(17): List orders where the customer is from Los Angeles and the order amount is greater than 300.
--Tables Used: Customers, Orders
SELECT 
      C.FirstName as CustomerName,
	  C.City,
	  O.OrderId,
	  O.TotalAmount as Amount
FROM Customers AS C
INNER JOIN Orders AS O ON C.CustomerID=O.CustomerID
WHERE C.City='Los Angeles' and O.TotalAmount>300;

--Return: EmployeeName, DepartmentName
--Task(18): Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
--Tables Used: Employees, Departments
SELECT E.Name AS EmployeeName,
       D.DepartmentName
FROM Employees AS E
INNER JOIN Departments AS D ON E.DepartmentID=D.DepartmentID
WHERE (D.DepartmentName='HR' or D.DepartmentName='Finance') or
E.Name like '%a%' or 
E.Name like '%o%' or
E.Name like '%u%' or
E.Name like '%e%' or
E.Name like '%i%' ;
--Return: ProductName, QuantitySold, Price
--Task(19): List products that had a sales quantity above 100 and a price above 500.
--Tables Used: Sales, Products
SELECT P.ProductName,
       SUM(S.SaleAmount) AS QuantitySold,
	   P.Price
FROM Products AS P
INNER JOIN Sales AS S ON S.ProductID=P.ProductID 
WHERE P.StockQuantity>100 and P.price>500
GROUP BY P.ProductName,P.Price;

--Return: EmployeeName, DepartmentName, Salary
--Task(20): Show employees who are in the Sales or Marketing department and have a salary above 60000.
--Tables Used: Employees, Departments

SELECT E.Name AS EmployeeName,
       D.DepartmentName,
	   E.Salary
FROM Employees AS E
INNER JOIN
      Departments AS D ON E.DepartmentID=D.DepartmentID
WHERE D.DepartmentName IN ('Sales','Marketing') 
      and E.Salary>60000
ORDER BY 
      E.Salary DESC;


