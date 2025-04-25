
--HOMEWORK_10
--TASK(1)Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.

SELECT E.Name,D.DepartmentName,E.Salary FROM Employees as E
INNER JOIN Departments as D
ON E.DepartmentID=D.DepartmentID
WHERE SALARY>50000;

--TASK(2)Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
SELECT C.FirstName,C.LastName,YEAR(ORDERDATE) AS ORDER_DATE FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID=O.CustomerID
WHERE YEAR(OrderDate)=2023;

--TASK(3)Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
SELECT E.Name,D.DepartmentName
FROM Employees AS E
LEFT JOIN Departments AS D
ON E.DepartmentID=D.DepartmentID;
-- TASK(4) Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
-- 🔁 Expected Output: SupplierName, ProductName
SELECT S.SupplierID, S.SupplierName,P.ProductName FROM Suppliers AS S
LEFT JOIN Products AS P
ON P.SupplierID=S.SupplierID;
-- TASK(5) Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.-- OrderID, OrderDate, PaymentDate, Amount
-- 🔁 Expected Output: OrderID, OrderDate, PaymentDate, Amount

SELECT COALESCE( O.OrderID,P.OrderID) as Order_ID,O.OrderDate,P.PaymentDate,P.Amount  FROM Orders AS O
full outer join Payments AS P
ON O.OrderID=P.OrderID;






-- TASK(6) Using the Employees table, write a query to show each employee's name along with the name of their manager.
-- 🔁 Expected Output: EmployeeName, ManagerName
select
E1.Name,
isnull(E2.Name,'No Manager') as Manager_Name 
from Employees as E1
left join Employees as E2
ON E2.EmployeeID=E1.ManagerID ;


-- TASK(7) Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
-- 🔁 Expected Output: StudentName, CourseName

select S.Name as StudnetName,C.CourseName from Students as S
inner join Enrollments as E
on S.StudentID=E.StudentID
inner join Courses as C
on E.CourseID=C.CourseID
Where C.CourseName='Math 101';



-- TASK(8) Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
-- 🔁 Expected Output: FirstName, LastName, Quantity

select C.FirstName,C.LastName,O.Quantity  from Customers as C
inner join Orders as O
on C.CustomerID=O.CustomerID
where O.Quantity>3;


-- TASK(9) Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
-- 🔁 Expected Output: EmployeeName, DepartmentName

Select E.Name as EmployeeName ,D.DepartmentName from Employees as E
inner join Departments as D
on E.DepartmentID=D.DepartmentID
where D.DepartmentName='Human Resources';

-- TASK(10)Using the Employees and Departments tables, write a query to return department names that have more than 10 employees.
-- 🔁 Expected Output: DepartmentName, EmployeeCount
select D.DepartmentName,count(E.DepartmentID) as EmployeeCount  from Employees as E
inner join Departments as D
on E.DepartmentID=D.DepartmentID
Group By D.DepartmentName
Having count(E.DepartmentID)>10;




-- TASK(11)Using the Products and Sales tables, write a query to find products that have never been sold.	
-- 🔁 Expected Output: ProductID, ProductName

select P.ProductID,P.ProductName from Products as P
left join Sales as S
on P.ProductID=S.ProductID 
where S.ProductID is null;


-- TASK(12)Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
-- 🔁 Expected Output: FirstName, LastName, TotalOrder
select C.FirstName,C.LastName,Count(O.Quantity) AS TotalOrders from Customers as C
inner join Orders as O
on C.CustomerID=O.CustomerID
Group by C.FirstName,C.LastName
Having Count(O.Quantity)>=1;


-- TASK(13)Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
-- 🔁 Expected Output: EmployeeName, DepartmentName
Select 
E.Name as EmployeeName,
D.DepartmentName as DepartmentName 
from Employees as E
inner join Departments as D
on E.DepartmentID=D.DepartmentID;




-- TASK(14)Using the Employees table, write a query to find pairs of employees who report to the same manager.
-- 🔁 Expected Output: Employee1, Employee2, ManagerID
select Distinct E1.Name as Employee1,E2.Name as Employee2,E1.ManagerID from Employees as E1
inner join Employees as E2
on E2.ManagerID=E1.ManagerID 
where E1.EmployeeID<>E2.EmployeeID
Order By E1.ManagerID asc;

-- TASK(15) Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
-- 🔁 Expected Output: OrderID, OrderDate, FirstName, LastName

SELECT O.OrderID,YEAR(O.OrderDate) AS YEAR,C.FirstName,C.LastName
FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID=O.CustomerID
WHERE YEAR(O.OrderDate)=2022;




-- TASK(16) Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
-- 🔁 Expected Output: EmployeeName, Salary, DepartmentName

SELECT E.Name as EmployeeName,E.Salary,D.DepartmentName FROM Employees AS E
INNER JOIN Departments AS D
ON E.DepartmentID=D.DepartmentID
WHERE D.DepartmentName='Sales' and Salary>60000;




-- TASK(17) Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
-- 🔁 Expected Output: OrderID, OrderDate, PaymentDate, Amount

select O.OrderID,O.OrderDate,P.PaymentDate,P.Amount from Payments as P
inner join Orders as O
on p.OrderID=O.OrderID;





-- TASK(18) Using the Products and Orders tables, write a query to find products that were never ordered.
-- 🔁 Expected Output: ProductID, ProductName

select O.ProductID,P.ProductName from Products as P
inner join Orders as O
on P.ProductID=O.ProductID
Where O.OrderID is null;




-- TASK(19) Using the Employees table, write a query to find employees whose salary is greater than the average salary of all employees.
-- 🔁 Expected Output: EmployeeName, Salary

select Name as EmployeeName, Salary  from Employees 
where Salary>(select AVG( salary) from Employees);

--TASK(20)Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.
-- 🔁 Expected Output: OrderID, OrderDate

SELECT O.OrderID,P.PaymentDate FROM Payments AS P
LEFT JOIN Orders AS O
ON P.OrderID=O.OrderID
WHERE YEAR(P.PaymentDate)<2020 AND P.OrderID IS NULL;





--TASK(21)Using the Products and Categories tables, write a query to return products that do not have a matching category.
-- 🔁 Expected Output: ProductID, ProductName
SELECT P.ProductID,P.ProductName FROM Products AS P
left join CategorieS AS C
on P.Category = C.CategoryID
where C.CategoryID is null;



--TASK(22)Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
-- 🔁 Expected Output: Employee1, Employee2, ManagerID, Salary
select distinct e1.Name as Employee1,e2.Name as Employee2,e1.ManagerID,
e1.Salary from Employees as e1
join Employees as e2
on e1.ManagerID=e2.ManagerID
where e1.EmployeeID <> e2.EmployeeID  and e1.Salary>60000 and e2.salary>60000;


--TASK(23)Using the Employees and Departments tables, write a query to return employees who work in departments whose name starts with the letter 'M'.
-- 🔁 Expected Output: EmployeeName, DepartmentName	
select E.Name AS EmployeeName,D.DepartmentName from Employees as E
inner join Departments as D
on E.DepartmentID=D.DepartmentID
where D.DepartmentName like 'M%';


--TASK(24)Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
-- 🔁 Expected Output: SaleID, ProductName, SaleAmount
select S.SaleID,P.ProductName,S.SaleAmount from Products as P
inner join Sales as S
on p.ProductID=S.ProductID
where S.SaleAmount>500;

--TASK(25)Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
--🔁 Expected Output: StudentID, StudentName
select S.StudentID,S.Name as StudentName from Students as S
left join Enrollments as E
on S.StudentID=E.StudentID
left join Courses as C
on E.CourseID=C.CourseID and C.CourseName<>'Math 101'
where C.CourseID is Null;



--TASK(26)Using the Orders and Payments tables, write a query to return orders that are missing payment details.
	--🔁 Expected Output: OrderID, OrderDate, PaymentID
	select O.OrderID,O.OrderDate,P.PaymentID  from Orders AS O
	left JOIN Payments AS P 
	ON O.OrderID=P.OrderID
	where P.PaymentID is null;
--TASK(27)Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
-- 🔁 Expected Output: ProductID, ProductName, CategoryName

select P.ProductID,P.ProductName,C.CategoryName from Products as P
inner join Categories as C 
on P.Category=C.CategoryID
where C.CategoryName in ('Electronics','Furniture');


