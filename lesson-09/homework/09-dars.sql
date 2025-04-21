Create Database Lesson_09
use Lesson_09


Homework 

--Task(1)Using Products, Suppliers table List all combinations of product names and supplier names.
 Select P.ProductName,S.SupplierName from Products as P
 Cross Join Suppliers as S



--Task(2)Using Departments, Employees table Get all combinations of departments and employees.
Select D.DepartmentName,E.FirstName from Departments AS D
CROSS JOIN Employees AS E


```sql
--Task(3)Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name

Create Table ProductsSuppliers(
ProductID INT,
SupplierID INT,
PRIMARY KEY (ProductID,SupplierID),
FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID))

SELECT 
S.SupplierName,
P.ProductName
from ProductsSuppliers as PS
inner join Products as P
on PS.ProductID=P.ProductID
inner join Suppliers as S
on PS.SupplierID=S.SupplierID;
```
--Task(4)Using Orders, Customers table List customer names and their orders ID.

SELECT C.FirstName,O.OrderID FROM Customers AS C
INNER JOIN Orders AS O
ON C.CustomerID=O.CustomerID;


--Task(5)Using Courses, Students table Get all combinations of students and courses.
SELECT C.CourseName,S.Name FROM Courses AS C
CROSS JOIN Students AS S;


--Task(6)Using Products, Orders table Get product names and orders where product IDs match.
SELECT P.ProductName,O.OrderID FROM Products AS P
INNER JOIN Orders AS O
ON P.ProductID=O.ProductID;

--Task(7)Using Departments, Employees table List employees whose DepartmentID matches the department.
CREATE TABLE DepartmentsEmployees(
DepartmentID INT,
EmployeeID INT,
PRIMARY KEY (DepartmentID,EmployeeID),
FOREIGN KEY (DepartmentID) REFERENCES Departments (DepartmentID),
FOREIGN KEY (EmployeeID) REFERENCES Employees (EmployeeID));


SELECT E.FirstName,D.DepartmentName FROM DepartmentsEmployees AS DE
INNER JOIN Departments AS D 
ON DE.DepartmentID=D.DepartmentID
INNER JOIN Employees AS E
ON DE.EmployeeID=E.EmployeeID;


--Task(8)Using Students, Enrollments table List student names and their enrolled course IDs.
SELECT S.Name,E.CourseID FROM Enrollments AS E
INNER JOIN Students AS S
ON E.StudentID=S.StudentID;

--Task(9)Using Payments, Orders table List all orders that have matching payments.	
select*from Payments as P
inner join Orders as O
on P.OrderID=O.OrderID;
--Task(10)Using Orders, Products table Show orders where product price is more than 100.
select O.OrderID,P.ProductName,P.Price from Orders as O
inner join Products as P
on O.ProductID=P.ProductID
WHERE P.Price>100;


--Task(11)Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.

select ISNULL(FirstName,'No Name') as F_Name ,D.DepartmentName as Dep_Name from Employees as E
Cross join Departments as D
where E.DepartmentName!=D.DepartmentName;


--Task(12)Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
select O.OrderID,P.StockQuantity,O.Quantity,P.ProductName from Orders as O
inner join Products as P
on O.ProductID=P.ProductID
where O.Quantity>P.StockQuantity;


--Task(13)Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
select C.FirstName,S.ProductID from Customers as C
inner join Sales as S
on C.CustomerID=S.CustomerID
where S.SaleAmount>=500;

--Task(14)Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.

select S.Name,C.CourseName from Students as S
inner join Enrollments as E
on S.StudentID=E.StudentID
inner join Courses as C
on C.CourseID=E.CourseID;

--Task(15)Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
select P.ProductName,S.SupplierName from ProductsSuppliers as SP
inner join Suppliers as S
ON SP.SupplierID=S.SupplierID
inner join Products as P
ON SP.ProductID=P.ProductID
Where S.SupplierName like '%Tech%';


--Task(16)Using Orders, Payments table Show orders where payment amount is less than total amount.

select O.OrderID,P.Amount,O.TotalAmount from Orders as O
inner join Payments as P
on O.OrderID=P.OrderID
where P.Amount<O.TotalAmount





--Task(17)Using Employees table List employee names with salaries greater than their manager’s salary.
SELECT e.Name AS EmployeeName, e.Salary, m.Name AS ManagerName, m.Salary AS ManagerSalary
FROM Employees e
JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary;


--Task(18)Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.

select P.* from Products as P
inner join Categories as C
on P.Category=C.CategoryName
where P.Category in('Electronics','Furniture');




--Task(19)Using Sales, Customers table Show all sales from customers who are from 'USA'.
select S.* from Customers As C
inner join Sales AS S
on C.CustomerID=S.CustomerID
Where C.Country='USA';



--Task(20)Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
select O.*from Orders as O 
inner join Customers as C
on O.CustomerID=C.CustomerID
where C.Country='Germany' and O.TotalAmount>100;




--Task(21)Using Employees table List all pairs of employees from different departments.
SELECT E1.Name AS Employee1, E2.Name AS Employee2,
       E1.DepartmentID AS Dept1, E2.DepartmentID AS Dept2
FROM Employees AS E1
JOIN Employees AS E2
    ON E1.EmployeeID < E2.EmployeeID
WHERE E1.DepartmentID != E2.DepartmentID;




--Task(22) Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
SELECT P1.* FROM Payments AS P1
INNER JOIN Orders AS O
ON P1.OrderID=O.OrderID 
INNER JOIN Products AS P2
ON P2.ProductID=O.ProductID 
WHERE P1.Amount<>(O.Quantity*P2.Price);


--Task(23)Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
SELECT * 
FROM Students AS S 
LEFT JOIN Enrollments AS E
ON E.StudentID=S.StudentID
LEFT JOIN Courses AS C
ON E.CourseID=C.CourseID
WHERE C.CourseID is NULL;




--Task(24)Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
SELECT E1.*FROM Employees AS E1
INNER JOIN Employees AS E2
ON E1.EmployeeID = E2.ManagerID 
WHERE E1.Salary<=E2.Salary;
--Task(25)Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.

SELECT C.*FROM Orders AS O
LEFT JOIN Payments AS P
ON O.OrderID=P.OrderID
INNER JOIN Customers AS C
ON O.CustomerID=C.CustomerID
WHERE P.PaymentID IS NULL;








