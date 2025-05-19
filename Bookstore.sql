
-- Create Author table
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);

-- Create Book table with foreign key to Author
CREATE TABLE Book (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

-- Insert Authors
INSERT INTO Author (AuthorID, Name) VALUES
(1, 'Sara Samir'),
(2, 'Dina Mostafa'),
(3, 'Walaa Magdy'),
(4, 'Unknown Author');

-- Insert Books
INSERT INTO Book (BookID, Title, AuthorID) VALUES
(1, 'Cinderella', 1),
(2, 'Isolde', 2),
(3, 'Juliet', 2),
(4, 'Briar', 3),
(5, 'Unlinked Book', NULL); -- No matching author

-- INNER JOIN: Matching Author and Book
SELECT b.Title, a.Name
FROM Book b
INNER JOIN Author a ON b.AuthorID = a.AuthorID;

-- LEFT JOIN: All books with or without matching author
SELECT b.Title, a.Name
FROM Book b
LEFT JOIN Author a ON b.AuthorID = a.AuthorID;

-- RIGHT JOIN: All authors with or without books
SELECT b.Title, a.Name
FROM Book b
RIGHT JOIN Author a ON b.AuthorID = a.AuthorID;

-- FULL OUTER JOIN: All authors and all books, match where possible
SELECT b.Title, a.Name
FROM Book b
FULL OUTER JOIN Author a ON b.AuthorID = a.AuthorID;
