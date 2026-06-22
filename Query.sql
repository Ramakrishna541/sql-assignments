 MySQL  localhost:3306 ssl  student  SQL > CREATE TABLE Authors
                                        -> (
                                        ->     AuthorID INT PRIMARY KEY,
                                        ->     AuthorName VARCHAR(100),
                                        ->     Country VARCHAR(50)
                                        -> );
INSERT INTO Authors
VALUES
(1,'John Smith','United States'),
(2,'Ravi Kumar','India'),
(3,'David Brown','United States');
  MySQL  localhost:3306 ssl  student  SQL > select * from authors;
+----------+-------------+---------------+
| AuthorID | AuthorName  | Country       |
+----------+-------------+---------------+
|        1 | John Smith  | United States |
|        2 | Ravi Kumar  | India         |
|        3 | David Brown | United States |
+----------+-------------+---------------+
3 rows in set (0.0058 sec)
CREATE TABLE Books
(
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    AuthorID INT,
    Category VARCHAR(50),
    PublicationYear INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);
INSERT INTO Books
VALUES
(101,'SQL Basics',1,'Fiction',2015),
(102,'Database Design',1,'Fiction',2018),
(103,'Python Guide',2,'Technology',2020),
(104,'Modern Stories',3,'Fiction',2012);

 MySQL  localhost:3306 ssl  student  SQL > select * from books;
+--------+-----------------+----------+------------+-----------------+
| BookID | Title           | AuthorID | Category   | PublicationYear |
+--------+-----------------+----------+------------+-----------------+
|    101 | SQL Basics      |        1 | Fiction    |            2015 |
|    102 | Database Design |        1 | Fiction    |            2018 |
|    103 | Python Guide    |        2 | Technology |            2020 |
|    104 | Modern Stories  |        3 | Fiction    |            2012 |
+--------+-----------------+----------+------------+-----------------+

CREATE TABLE Sales
(
    SaleID INT PRIMARY KEY,
    BookID INT,
    SalesAmount DECIMAL(10,2),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Sales
VALUES
(1,101,5000),
(2,102,7000),
(3,103,4000),
(4,104,6000);

 MySQL  localhost:3306 ssl  student  SQL > select * from sale;
+--------+--------+-------------+
| SaleID | BookID | SalesAmount |
+--------+--------+-------------+
|      1 |    101 |     5000.00 |
|      2 |    102 |     7000.00 |
|      3 |    103 |     4000.00 |
|      4 |    104 |     6000.00 |
+--------+--------+-------------+

Write a SQL query to retrieve the titles of all books written by authors from the United States.
MySQL  localhost:3306 ssl  student  SQL > SELECT title
                                        -> FROM books
                                        -> WHERE authorid IN
                                        -> (
                                        ->     SELECT authorid
                                        ->     FROM authors
                                        ->     WHERE country = 'United States'
                                        -> );
+-----------------+
| title           |
+-----------------+
| SQL Basics      |
| Database Design |
| Modern Stories  |
+-----------------+
3 rows in set (0.0164 sec)
Write a SQL query to find the total sales of books in the fiction category.
SELECT SUM(SalesAmount) AS TotalSales
FROM Sale
WHERE BookID IN
(
    SELECT BookID
    FROM Books
    WHERE Category = 'Fiction'
);
                                        -> );
+------------+
| TotalSales |
+------------+
|   18000.00 |
+------------+
1 row in set (0.0126 sec)
Write a SQL query to retrieve the names of authors who have written more than one book.
 MySQL  localhost:3306 ssl  student  SQL > SELECT AuthorName
                                        -> FROM Authors
                                        -> WHERE AuthorID IN
                                        -> (
                                        ->     SELECT AuthorID
                                        ->     FROM Books
                                        ->     GROUP BY AuthorID
                                        ->     HAVING COUNT(*) > 1
                                        -> );
+------------+
| AuthorName |
+------------+
| John Smith |
+------------+
Create a SQL query to retrieve the title, publication year, and sales amount for all books published after 2010, sorted in descending order by sales amount.c
 MySQL  localhost:3306 ssl  student  SQL > SELECT Title,        PublicationYear,        (SELECT SalesAmount         FROM Sale s         WHERE s.BookID = b.BookID) AS SalesAmount FROM Books b WHERE PublicationYear > 2010 ORDER BY SalesAmount DESC;
+-----------------+-----------------+-------------+
| Title           | PublicationYear | SalesAmount |
+-----------------+-----------------+-------------+
| Database Design |            2018 |     7000.00 |
| Modern Stories  |            2012 |     6000.00 |
| SQL Basics      |            2015 |     5000.00 |
| Python Guide    |            2020 |     4000.00 |
+-----------------+-----------------+-------------+