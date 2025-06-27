-- Task 4

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












 
 