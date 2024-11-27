create database studentdb;
use studentdb;
-- Create Tables: Students Table:  
create table students( id Int Primary Key Auto_Increment,
     name VARCHAR(50) Not Null,
     age INT Not Null,
     email VARCHAR(50) Not Null Unique);
     select*from students;
     insert into students (id,name,age,email) values(1,'raj',25,'raj234');
insert into students (name,age,email) values('rajesh',27,'frdj234');
insert into students (name,age,email) values('ravi',29,'sdfdr87');

-- Courses Table:  
create table courses (id INT Primary Key Auto_Increment,
     name VARCHAR(50) Not Null);
     select*from courses;
     insert into courses (id,name) values (1,'reka');
     insert into courses (name) values('rebecca');
     insert into courses(name) values('rithis');
     
     SET SQL_SAFE_UPDATES =0;

UPDATE courses
SET name = 'business management'
WHERE name = 'reka';


UPDATE courses
SET name = 'history'
WHERE name = 'new_name';

UPDATE courses
SET name = 'history'
WHERE name = 'new_name';

select*from courses;


     
-- Enrollments Table:    
create table enrollments (student_id INT,
                course_id INT,
                grade CHAR(2),
                PRIMARY KEY (student_id,course_id),
Foreign Key (student_id) References Students(id),
                Foreign Key( course_id ) References Courses(id));
select*from enrollments;
insert into enrollments (student_id,course_id,grade) values(1,1,'A');
insert into enrollments (student_id,course_id,grade) values(2,3,'B');
insert into enrollments (student_id,course_id,grade) values(4,2,'C');

--  List all students.
select*from students;
-- List all courses.
select*from courses;

-- Show the names of students and the courses they are enrolled in.
SELECT
    students.name AS student_name,
    courses.name AS course_name
FROM
    enrollments
JOIN
    students ON enrollments.student_id = students.id
JOIN
    courses ON enrollments.course_id = courses.id;


-- Count the number of students in each course.

SELECT
    courses.name AS course_name,
    COUNT(enrollments.student_id) AS student_count
FROM
    enrollments
JOIN
    courses ON enrollments.course_id = courses.id
GROUP BY
    courses.name;
