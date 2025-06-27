-- TASK 1
create database Library;
USE Library;

CREATE TABLE Authors(
	authorID INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE Books(
	bookID INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    authorID INT,
    FOREIGN KEY (authorID) REFERENCES Authors(authorID)
);

CREATE TABLE Students(
	studentID INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    class VARCHAR(50)
);

CREATE TABLE IssuedBooks(
	issueID INT PRIMARY KEY,
    studentID INT,
    bookID INT,
    issueDate DATE,
    returnDate DATE,
    FOREIGN KEY (studentID) REFERENCES Students(studentID),
    FOREIGN KEY (bookID) REFERENCES Books(bookID)
);

-- TASK 2

INSERT INTO Authors(authorID, name) VALUES(101,"Joanne Rowling");
INSERT INTO Authors(authorID, name) VALUES(102,"George Orwell");
INSERT INTO Authors(authorID, name) VALUES(103,"Paulo Coelho");

INSERT INTO Books(bookID,title,authorID) VALUES(1001,"Harry Potter-1",101);
INSERT INTO Books(bookID,title,authorID) VALUES(1002,"1984",102);
INSERT INTO Books(bookID,title,authorID) VALUES(1003,"The Alchemist",103);
INSERT INTO Books(bookID,title,authorID) VALUES(1004,"Harry Potter-2",NULL);

INSERT INTO Students(studentID, name, class) VALUES(1,"Alice Johnson",'10');
INSERT INTO Students(studentID, name, class) VALUES(2,"Bob Smith",NULL);
INSERT INTO Students(studentID, name, class) VALUES(3,"Charlie Brown",'11');
INSERT INTO Students(studentID, name, class) VALUES(4,"Daina",'10');
INSERT INTO Students(studentID, name, class) VALUES(5,"Emanual",'10');

INSERT INTO IssuedBooks(issueID, studentID, bookID, issueDate, returnDate)
VALUES
(1,1,1003,'2025-05-02','2025-05-10'),
(2,3,1004,'2025-06-20', NULL);

-- Update


UPDATE Authors
SET name = "J.K. Rowling" WHERE authorID = 101;

UPDATE Books
SET authorID = 101 WHERE bookID = 1004;

UPDATE Students
SET class = '11' WHERE studentID = 2;

UPDATE IssuedBooks
SET returnDate = "2025-06-24" WHERE bookID = 1004;

DELETE FROM Books WHERE bookID = 1001;
DELETE FROM Students WHERE studentID = 2;
DELETE FROM IssuedBooks WHERE issueID = 2;

-- TASK 3 

SHOW tables;
SELECT * FROM Authors;
SELECT * FROM Books;
SELECT * FROM Students;
SELECT * FROM IssuedBooks;

-- Where and Or
SELECT * FROM students WHERE class = "10" OR class = '11';

-- Between 
SELECT title FROM books where bookID 
BETWEEN 1001 and 1003;

-- IN
SELECT name FROM Students 
WHERE studentID IN
(SELECT studentID FROM IssuedBooks) ;

-- And, Like, AS
SELECT studentID AS ID,name AS ST_NAME FROM Students
Where class LIKE '10' AND (studentID BETWEEN 1 and 5) ;

-- Order by and Limit
Select * FROM Authors
ORDER BY name;

SELECT name FROM Students
ORDER BY name DESC
LIMIT 4;

-- Distinct
SELECT DISTINCT class FROM Students;

-- Task 4  --

--  SUM() - Total number of books issued
SELECT COUNT(issueId) FROM Issuedbooks;

-- Count
Select class,count(studentID) AS TotalStudents
FROM STUDENTS
GROUP BY class;

-- AVG
SELECT AVG(bookID) AS AverageBookIDIssued FROM IssuedBooks;

-- GROUP BY
SELECT authors.name, COUNT(books.authorID) AS BOOKS
FROM Authors
Join books ON authors.authorID= books.authorID
group by name;

-- Having

SELECT authors.name, COUNT(books.authorID) AS Books
From Authors
JOIN books ON authors.authorID= books.authorID
group by name
HAVING Books>1;










 
 