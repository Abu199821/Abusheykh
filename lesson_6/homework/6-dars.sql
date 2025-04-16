CREATE DATABASE homework_6
use Homework_6


--Task(1) Explain at least two ways to find distinct values based on two columns.
1)SELECT DISTINCT
  CASE WHEN col1 < col2 THEN col1 ELSE col2 END AS col1,
  CASE WHEN col1 < col2 THEN col2 ELSE col1 END AS col2
FROM InputTbl;
2) SELECT DISTINCT
  LEAST(col1, col2) AS col1,
  GREATEST(col1, col2) AS col2
FROM InputTbl;

--Task(2) If all the columns have zero values, then don’t show that row. In this case, we have to remove the 5th row while selecting data.
SELECT * FROM TestMultipleZero 
where (A=1 or B=1 or C=1 or D=1);
--Task(3) Find those with odd ids
select * from section1
WHERE (id%2>0);
--Task(4) Person with the smallest id (use the table in puzzle 3)
select FirstName from section1
where id=(select MIN(ID)from section1);
--Task(5) Person with the highest id (use the table in puzzle 3)
select FirstName from section1
where id=(select MAX(id) from section1);
--Task(6) People whose name starts with b (use the table in puzzle 3)
select * from section1
where FirstName like 'b%';
--Task(7) Write a query to return only the rows where the code contains the literal underscore _ (not as a wildcard).

SELECT * FROM ProductCodes
WHERE Code LIKE '%\_%' ESCAPE '\';


