DROP DATABASE IF EXISTS LibraryDB;
CREATE DATABASE LibraryDB;
USE LibraryDB;

CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

SHOW DATABASES;


CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
 
---
-- -- Update Author name where it is NULL
UPDATE Authors
SET Name = 'Unknown Author'
WHERE Name IS NULL;

-- Update Member name where it is NULL
UPDATE Members
SET Name = 'Unknown Member'
WHERE Name IS NULL;

-- Update missing email for Bob
UPDATE Members
SET Email = 'bob@example.com'
WHERE Name = 'Bob' AND Email IS NULL;

-- Set ReturnDate as today (2025-08-06) for overdue books
UPDATE Loans
SET ReturnDate = '2025-08-06'
WHERE ReturnDate IS NULL AND LoanDate < '2025-08-05';

-- Delete loans where the loan date is more than 1 year old (just as cleanup)
DELETE FROM Loans
WHERE LoanDate < '2024-08-01';

-- Delete members with NULL or empty emails
DELETE FROM Members
WHERE Email IS NULL OR Email = '';

-- Delete books with unknown titles
DELETE FROM Books
WHERE Title = 'Unknown Title';

-- View all data from Authors table
SELECT * FROM Authors;

-- View only the names of all members
SELECT Name FROM Members;

-- Get all books with their author names using JOIN
SELECT Books.Title, Authors.Name AS AuthorName
FROM Books
JOIN Authors ON Books.AuthorID = Authors.AuthorID;

-- Find members who have an email ending with 'gmail.com'
SELECT * FROM Members
WHERE Email LIKE '%gmail.com';

-- Find books whose title contains the word 'Data'
SELECT * FROM Books
WHERE Title LIKE '%Data%';

-- Get loans between two specific dates
SELECT * FROM Loans
WHERE LoanDate BETWEEN '2024-01-01' AND '2024-12-31';

-- Find loans where the book is not returned yet (ReturnDate is NULL)
SELECT * FROM Loans
WHERE ReturnDate IS NULL;

-- Find members who borrowed books on or after '2024-07-01'
SELECT Members.Name, Loans.LoanDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
WHERE LoanDate >= '2024-07-01';

-- List all books ordered by Title (ascending)
SELECT * FROM Books
ORDER BY Title ASC;

-- List 5 most recent loans
SELECT * FROM Loans
ORDER BY LoanDate DESC
LIMIT 5;

-- List all loans with member name and book title
SELECT Loans.LoanID, Members.Name AS MemberName, Books.Title AS BookTitle, Loans.LoanDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID;

-- Find members whose name starts with 'A'
SELECT * FROM Members
WHERE Name LIKE 'A%';

-- Find books by a specific author (example: AuthorID = 2)
SELECT * FROM Books
WHERE AuthorID = 2;

-- Get all members who borrowed the book titled 'SQL Fundamentals'
SELECT Members.Name, Books.Title
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Title = 'SQL Fundamentals';

-- Count how many books each member has borrowed
SELECT Members.Name, COUNT(Loans.LoanID) AS TotalLoans
FROM Members
JOIN Loans ON Members.MemberID = Loans.MemberID
GROUP BY Members.Name;
