-- Create a database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Create Tables:
-- 	1. Author Table
-- 	2. Books Table
-- 	3. Member Table
-- 	4. Loans Table

CREATE TABLE Authors (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    AuthorID INT,
    PublicationYear INT,
    Genre VARCHAR(100),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20)
);

CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Data insertion into Table
-- Insert authors
INSERT INTO Authors (FirstName, LastName) VALUES ('J.K.', 'Rowling');
INSERT INTO Authors (FirstName, LastName) VALUES ('George', 'Orwell');
INSERT INTO Authors (FirstName, LastName) VALUES ('Jane', 'Austen');

-- Insert books
INSERT INTO Books (Title, AuthorID, PublicationYear, Genre) VALUES ('Harry Potter and the Sorcerer''s Stone', 1, 1997, 'Fantasy');
INSERT INTO Books (Title, AuthorID, PublicationYear, Genre) VALUES ('1984', 2, 1949, 'Dystopian');
INSERT INTO Books (Title, AuthorID, PublicationYear, Genre) VALUES ('Pride and Prejudice', 3, 1813, 'Romance');

-- Insert members
INSERT INTO Members (FirstName, LastName, Email, PhoneNumber) VALUES ('John', 'Doe', 'john.doe@example.com', '123-456-7890');
INSERT INTO Members (FirstName, LastName, Email, PhoneNumber) VALUES ('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210');

-- Insert loans
INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate) VALUES (1, 1, '2023-06-01', '2023-06-15');
INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate) VALUES (2, 2, '2023-06-05', '2023-06-20');

---------------------------------------------------------------------------------------------------------------
-- Practice: 1.Joins
select * from Authors join Books
ON Authors.AuthorID = Books.AuthorID
--------------------------------------
select a.FirstName, a.LastName, b.PublicationYear, b.Title
from Authors AS a 
join Books AS b
ON a.AuthorID = b.AuthorID

-- 2. Inner Join
select * from Authors Inner join Books
ON Authors.AuthorID = Books.AuthorID
------------------------------------------
select * from Books
Inner join Authors ON 
Authors.AuthorID = Books.AuthorID
-----------------------------------------
select a.FirstName, a.LastName, b.PublicationYear, b.Title
from Authors AS a 
join Books AS b
ON a.AuthorID = b.AuthorID

-- 3. Left Join
select * from Books
Left join Authors ON 
Authors.AuthorID = Books.AuthorID

-- 4. Right Join
select * from Books
Right join Authors ON 
Authors.AuthorID = Books.AuthorID

-- 5. OUTER JOIN
select * from Books
Outer join Authors ON 
Authors.AuthorID = Books.AuthorID
----------------------------------------------------------------
SELECT *
FROM Books
LEFT OUTER JOIN Authors ON Authors.AuthorID = Books.AuthorID;
-----------------------------------------------------------------
SELECT *
FROM Books
LEFT JOIN Authors ON Authors.AuthorID = Books.AuthorID
UNION
SELECT *
FROM Books
RIGHT JOIN Authors ON Authors.AuthorID = Books.AuthorID;



