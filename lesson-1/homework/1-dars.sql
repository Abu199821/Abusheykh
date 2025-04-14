--1.Define the following terms: data, database, relational database, and table

--Definition: Data refers to raw facts, figures, or information that can be processed to gain meaningful insights.
--Definition: A database is an organized collection of data that allows for easy access, management, and updating.
--Definition: A relational database is a structured database that stores data in tables and establishes relationships between them using keys (Primary Key & Foreign Key).
--Definition: A table is a structured format within a database that stores data in rows (records) and columns (fields).

--2. List five key features of SQL Server.

--Relational Database Management System.
--High Security.
--Backup and Recovery.
--Scalability and Performance Optimization
--Advanced Data Analytics and BI Support

--3.What are the different authentication modes available when connecting to SQL Server? (Give at least 2)

--SQL Server Authentication Mode
--Windows Authentication Mode (Integrated Security)

--4.Create a new database in SSMS named SchoolDB.
CREATE DATABASE Schooldb;  

USE Schooldb;

--5.rite and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
CREATE table Students(
	StudentID int PRIMARY KEY,
	Name VARCHAR(50),
	Age int
);

--DELETE FROM Students;

--6.Describe the differences between SQL Server, SSMS, and SQL. Hard

--SQL Server → A database management system (RDBMS) that stores and processes data.
--SSMS (SQL Server Management Studio) → A GUI tool used to manage SQL Server databases easily.
--SQL (Structured Query Language) → A programming language used to interact with databases (write queries like SELECT, INSERT).

--7.Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples.

--DQL (Query)	Retrieves data
--DML (Modify)	Inserts, updates, deletes data.
--DDL (Structure)	Defines and modifies database objects.
--DCL (Control)	Manages user permission.
--TCL (Transaction)	Manages database transactions.


INSERT INTO Students (StudentID, Name, Age)
VALUES 
(1, 'ABDUQODIR HUSANOV', 28),
(2, 'TEMURBEK JABBOROV', 27),
(3, 'MUNISA RIZAYEVA', 22);

SELECT * FROM Students;



