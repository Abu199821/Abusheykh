
HOMEWORK_12

--TASK (1) Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.


SELECT 
      P.firstName,
	  P.lastName,
	  A.city,
	  A.state
FROM Person as P
left JOIN Address as A on P.PersonID=A.PersonID;


--TASK(2)Write a solution to find the employees who earn more than their managers.
--(Joe is the only employee who earns more than his manager.)

SELECT 
      E.name AS Employee	  
FROM Employee AS E
left join Employee AS M ON E.managerid=M.id
WHERE E.Salary>M.salary;

--TASK(3) Write a solution to report all the duplicate emails. Note that it''s guaranteed that the email field is not NULL.
--( a@b.com is repeated two times.)
SELECT 
      email
FROM Person
GROUP BY Email
HAVING COUNT(email)>1;


--TASK(4)Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
--john@example.com is repeated two times. We keep the row with the smallest Id = 1.
DELETE P1
FROM Person as P1
INNER JOIN Person as P2
ON P1.Email = P2.Email AND P1.Id > P2.Id;



--TASK(5)  Find those parents who has only girls.
SELECT DISTINCT ParentName
FROM Girls
WHERE ParentName NOT IN (SELECT DISTINCT ParentName FROM Boys);


--task(6)Find total Sales amount for the orders which weights more than 50 for each customer along with their least weight.
--(from TSQL2012 database, Sales.Orders Table)
SELECT 
    O.custid,
    SUM(O.freight) AS TotalSalesAmount,
    MIN(O.freight) AS LeastWeight
FROM 
    [TSQL2012].[Sales].[Orders] O
WHERE 
    O.freight > 50
GROUP BY 
    O.custid
ORDER BY 
    TotalSalesAmount DESC;

--Task (7)

--Expected Output.


--| Item Cart 1 | Item Cart 2 |  
--|-------------|-------------|  
--| Sugar       | Sugar       | 
--| Bread       | Bread       |  
--| Juice       |             |  
--| Soda        |             |  
--| Flour       |             |
--|             | Butter      |  
--|             | Cheese      |  
--|             | Fruit       |


SELECT 
    COALESCE(C1.Item, ' ') AS Item1, 
    COALESCE(C2.Item, ' ') AS Item2
FROM Cart1 AS C1
FULL JOIN Cart2 AS C2 
    ON C1.Item = C2.Item
ORDER BY Item1 DESC;





--TASK ( 8) Resultga yutgan jamoaning nomi chiqsin agar durrang bo''lsa 'Draw' so''zi 
--chiqsin.(Hisob 10:11 yoki 111:99 bo'lishi ham mumkin :) )
SELECT *,
  CASE 
    WHEN CAST(LEFT(score, CHARINDEX(':', score) - 1) AS INT) 
       > CAST(SUBSTRING(score, CHARINDEX(':', score) + 1, LEN(score)) AS INT)
      THEN SUBSTRING(match, 1, CHARINDEX('-', match) - 1)
    WHEN CAST(LEFT(score, CHARINDEX(':', score) - 1) AS INT) 
       < CAST(SUBSTRING(score, CHARINDEX(':', score) + 1, LEN(score)) AS INT)
      THEN SUBSTRING(match, CHARINDEX('-', match) + 1, LEN(match))
    ELSE 'Draw'
  END AS Result
FROM match1;


--Task(9). Customers Who Never Order(Write a solution to find all customers who never order anything.)
--Use order table
select C.name as Customers 
from Customers as C
left join Orders As O on C.id=O.customerId
Where O.CustomerId is null;
-- Task(10). Students and Examinations(Write a solution to find the number of times each student attended each exam.)

select S.student_id,
       S.student_name,
	   sub.subject_name,
	   count(E.student_id) as attended_exams
from Students as S
cross join Subjects as sub
left join Examinations as E on E.student_id=S.student_id and E.subject_name=sub.subject_name
Group by S.student_id,
       S.student_name,
	   sub.subject_name
order by S.student_id,
        sub.subject_name asc;
