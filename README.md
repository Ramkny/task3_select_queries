🎯 Objective
The objective of this task is to practice and demonstrate the use of basic SELECT queries in SQL to extract data from one or more tables using clauses like WHERE, ORDER BY, and LIMIT.

🛠️ Tools Used
MySQL Workbench / DB Browser for SQLite

SQL Script File: task3_select_queries.sql

📂 Database Structure
The following tables were created and used for this task:

Authors (AuthorID, Name)

Books (BookID, Title, AuthorID)

Members (MemberID, Name, Email)

Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate)

All necessary foreign key relationships have been established between these tables.

🔍 What the SQL Script Includes
The SQL file contains the following types of queries:

Query Type	Description
SELECT *	Display all records from a table
SELECT column1, column2	Retrieve specific columns
WHERE, AND, OR	Filter records based on multiple conditions
LIKE	Search using patterns (e.g., emails ending in gmail.com)
BETWEEN	Get data in a specific date range
ORDER BY	Sort results in ascending or descending order
LIMIT	Limit the number of results returned
JOIN	Combine data from multiple related tables
GROUP BY + COUNT()	Count how many loans each member has

📁 Sample Queries Included
List all authors and books

Find members with Gmail accounts

List books with titles containing a keyword

Get top 5 recent loans

Find members who borrowed a specific book

Count how many books each member has borrowed

✅ Outcome
This task helps build confidence in extracting meaningful data from a relational database and is a solid foundation for writing more complex SQL queries in real-world applications.# task3_select_queries
