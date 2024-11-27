create database libraryDB;
use libraryDB;
create table books(id int primary key auto_increment,
title varchar(100) not null,
author varchar(50) not null,
published_year year not null,
genre varchar(30));
select* from books;

-- Insert data into the Books table
INSERT INTO Books  VALUES(1,'To Kill a Mockingbird', 'Harper Lee', 1960, 'Fiction');
INSERT INTO Books  VALUES(2,'George Orwell','austen lee', 1949, 'Dystopian');
INSERT INTO Books  VALUES(3,'Pride Prejudice', 'Jane Austen', 1913, 'Romance');
INSERT INTO Books  VALUES(4,'The Great Gatsby', 'F. Scott Fitzgerald', 1925, 'Novel');

create table members(id int primary key auto_increment,
name varchar(50) Not null,
membership_date date not null);
select* from members;

-- Insert data into the Members table
INSERT INTO Members (name, membership_date) VALUES 
('John Doe', '2024-01-15'), 
('Jane Smith', '2023-07-22'), 
('Alice Johnson', '2023-09-05'), 
('Bob Brown', '2024-03-10');

create table borrowing (id int primary key auto_increment,
book_id int,
member_id int,
borrow_date date not null,
return_date date,
 foreign key (book_id) References books(id),
 foreign key (member_id) References members(id));
 select*from borrowing;

-- Insert data into the Borrowing table

INSERT INTO Borrowing (book_id, member_id, borrow_date, return_date) VALUES
(1, 1, '2024-11-01', '2024-11-15'),
(2, 2, '2024-11-02', '2024-11-16'),
(3, 3, '2024-11-03', '2024-11-17'),
(4, 4, '2024-11-04', '2024-11-18');

-- 4 queries
-- list all books
select* from books;

-- list all members
select*from members;

--  Show borrowing records with member names and book titles

SELECT b.id AS borrowing_id, 
       m.name AS member_name, 
       bk.title AS book_title, 
       b.borrow_date, 
       b.return_date
FROM Borrowing AS b
JOIN Members AS m ON b.member_id = m.id
JOIN Books AS bk ON b.book_id = bk.id;



-- Count the number of books borrowed by each member.

select m.name as member_name, count(b.id) as books_borrowed
from borrowing as b
join members as m on b.member_id=m.id
group by m.name;












