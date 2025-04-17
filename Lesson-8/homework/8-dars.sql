CREATE DATABASE homework_08
Use homework_08
--Task(1)Using Products table, find the total number of products available in each category.
select Category,Count(*) as prod_per_Cafrom Products
Group by Category 
select*from Products

--Task(2) Using Products table, get the average price of products in the 'Electronics' category.
SELECT Category,AVG(Price) as AVG_Price_Electronics
FROM Products
WHERE Category='Electronics'
GROUP BY Category;


--Task(3) Using Customers table, list all customers from cities that start with 'L'.	
SELECT * FROM Customers
where City like 'L%'


--Task(4) Using Products table, get all product names that end with 'er'.
select*from Products
where ProductName like '%er'


--Task(5) Using Customers table, list all customers from countries ending in 'A'.	
select*from Customers
where Country like '%A'



--Task(6) Using Products table, show the highest price among all products.
select MAX(Price) as Max_Price 
from Products;

--Task(7) Using Products table, use IIF to label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
select*,iif(Quantity<30,'Low Stock','Sufficient') as Price_Label
from Products;


--Task(8) Using Customers table, find the total number of customers in each country.
select Country,Count(*) as Total_Customers 
from Customers
Group By Country


--Task(9)Using Orders table, find the minimum and maximum quantity ordered.
select MIN(QUANTITY) AS min_quant_ordered ,MAX(Quantity) as max_quant_ordered
from Orders;



--Task(10)Using Orders and Invoices tables, list customer IDs who placed orders in 2023 (using EXCEPT) to find those who did not have invoices.

SELECT * from orders
select * from invoices

SELECT CustomerID FROM orders
WHERE YEAR(OrderDate)=2023 
EXCEPT
Select CustomerID FROM invoices;


--Task(11)Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
select ProductName from Products_Discounted
union all
select ProductName from Products;

--Task(12)Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
select ProductName from Products_Discounted
union
select ProductName from Products;

--Task(13)Using Orders table, find the average order amount by year.
select Year(OrderDate) as Yearly_Order,AVG(TotalAmount) as Avg_amount_Yearly 
from orders
group by Year(OrderDate)





--Task(14)Using Products table, use CASE to group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
select ProductName,
CASE 
WHEN Price<100 THEN 'Low'
WHEN Price between 100 and 500 THEN 'Mid'
ELSE 'HIGH' END AS PriceGroup 
from Products;



--Task(15)Using Customers table, list all unique cities where customers live, sorted alphabetically.
Select distinct city from Customers
Order by City asc


--Task(16)Using Sales table, find total sales per product Id.

select ProductID,SUM(SaleAmount) as Total_sales from Sales
group by ProductID;

--Task(17)Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
select ProductName from Products
where ProductName like '%oo%';


--Task(18)Using Products and Products_Discounted tables, compare product IDs using INTERSECT.
select ProductID from Products
INTERSECT
select ProductID from Products_Discounted;


--Task(19)Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.	
SELECT Top 3 
CustomerID,
SUM(TotalAmount) as Total_Spend
FROM  Invoices
Group by CustomerID
Order By Total_Spend desc;
--Task(20)Find product ID and productname that are present in Products but not in Products_Discounted.
select ProductId,ProductName from Products
EXCEPT
select ProductID,ProductName from Products_Discounted;


--Task(21)Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
SELECT P.ProductName,Count(S.SaleID) AS NumberofSales FROM Products as P
inner join Sales as S
on P.ProductID=S.ProductID
Group by P.ProductName;



--Task(22)Using Orders table, find top 5 products (by ProductID) with the highest order quantities.
select top (5)
ProductID,
SUM(Quantity) AS HIGHEST_QUANTITY
from Orders
GROUP BY ProductID
Order by SUM(Quantity) DESC;


