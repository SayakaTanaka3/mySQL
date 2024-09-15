-- 1.Create a Database named bookstore
create database bookstore; 

-- 2.Create a table mybooks in the bookstore database with field names 
-- (bookid, title, date_published, category, cost) bookid as primary key.  
-- The category column should use these values (“Fiction”,” History”, ”Kids”, ”Business”, ”Computer”). Choose your datatypes to define the columns.
use bookstore;
create table mybooks (
bookid INT auto_increment primary key,
title VARCHAR(255),
date_published DATE,
category ENUM('Fiction', 'History', 'Kids', 'Business', 'Computer'),
cost Decimal (10,2)
);

-- 3.Create a table Authors with field names (authorid, bookid, firstname, lastname)
-- authorid as primary key and bookid is the foreign key. Choose your datatypes to define the columns.
create table Authors (
authorid INT auto_increment primary key,
bookid INT,
firstname varchar(100),
lastname varchar(100),
foreign key (bookid) references mybooks(bookid)
);

-- 4. Write SQL command to insert at least 8 records in mybooks table.
INSERT INTO mybooks (title, date_published, category, cost) VALUES
('War and Peace', '1869-01-01', 'Fiction', 39.99),
('Sapiens', '2011-01-01', 'History', 19.95),
('Harry Potter and the Sorcerer''s Stone', '1997-06-26', 'Kids', 24.99),
('The Lean Startup', '2011-09-01', 'Business', 29.95),
('Clean Code', '2008-08-01', 'Computer', 48.00),
('1984', '1949-06-08', 'Fiction', 22.90),
('The Hobbit', '1937-09-21', 'Fiction', 15.20),
('A Brief History of Time', '1988-06-01', 'History', 18.40);

-- 5. Write SQL command to insert at least 5 records in Author table.
INSERT INTO Authors (bookid, firstname, lastname) VALUES
(1, 'Leo', 'Tolstoy'),
(2, 'Yuval Noah', 'Harari'),
(3, 'J.K.', 'Rowling'),
(4, 'Eric', 'Ries'),
(5, 'Robert', 'Martin');

-- 6. Write SQL command to display all the records for mybooks table.
select * from mybooks;

-- 7. Display bookid, title, cost of books where category = 'Fiction'
select bookid, title, cost FROM mybooks where category = 'Fiction';

-- 8. Display all records from Authors table
select * from Authors;

-- 9. Display authorid and lastname from Authors table sorted by lastname.
select authorid, lastname From Authors order by lastname;

-- 10. Display title, category, cost, and lastname from mybooks joined with Authors.
select m.title, m.category, m.cost, a.lastname
from mybooks m
join Authors a ON m.bookid = a.bookid;

-- 11. Show category and "Total Cost" grouped by category, sorted by "Total Cost" in decending oder
select category, SUM(cost) AS 'Total Cost'
FROM mybooks
GROUP BY category
ORDER BY 'Total Cost' DESC;

-- 12. Display bookid, title, and calculate cost * 2.5 as "Retail Cost", sort by "Retail Cost".
select bookid, title, cost *2.5 AS 'Retail Cost'
FROM mybooks
ORDER BY 'Total Cost' DESC;

-- 13. Get the title of the cheapest book.
select title from mybooks
where cost = (select MIN(cost) FROM mybooks);
