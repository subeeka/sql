create database library;
use library;
create table ageconstraint(
Fullname varchar(25),
age int check ( age between 18 and 65),
gender varchar(20),
salary int(8),
city varchar(20),
pan varchar(25));
select * from ageconstraint;
-- Task1
alter table ageconstraint drop column gender;
alter table ageconstraint add column gender varchar(20);

insert into ageconstraint values('subeeka',70,60000,'chennai','abc123der','female');
insert into ageconstraint values('subeeka',55,60000,'chennai','abc123der','female');

-- Task2
create table Genderconstraint(
Fullname varchar(25),
age int (10),
gender enum  ('Female','Male','other'),
salary int(8),
city varchar(20),
pan varchar(25));
select * from Genderconstraint;

insert into Genderconstraint values('subeeka',55,'unkown',60000,'chennai','abc123der');
insert into Genderconstraint values('Rebecka',65,'female',80000,'Theni','hvc123dhy');

-- Task3  #(error)#
create table Salaryconstraint(
Fullname varchar(25),
age int (10),
gender enum  ('Female','Male','other'),
salary int,
city varchar(20),
pan varchar(25)
check (salary>=5000));
select * from Salaryconstraint;
insert into Salaryconstraint values('Indhu',35,'female',9000,'Theni','hvc123dhy');
insert into salaryconstraint values('Reka',25,'female',3000,'Tirichy','khc923dmb');

-- Task4 
create table Panconstraint(
Fullname varchar(25),
age int (10),
gender enum  ('Female','Male','other'),
salary int (10),

pan varchar(25)unique
);
select * from panconstraint;
insert into panconstraint values('Rebecka',35,'female',10000,'chennai','khc923dmb');
insert into panconstraint values('Reka',25,'female',10000,'chennai','ABCDE1234F');
insert into panconstraint values('Robert',35,'male',15000,'chennai','ABCDE1234F');

-- Task5
create table Cityconstraint(
Fullname varchar(25),
age int (10),
gender enum  ('Female','Male','other'),
salary int (10),
city varchar(20)default'chennai',
pan varchar(25)
);
select * from cityconstraint;
insert into cityconstraint values('Rebecka',35,'female',10000,'chennai','khc923dmb');
insert into cityconstraint(Fullname, age, gender, salary, Pan)values('Reka',45,'female',15000,'khc923dmb');

-- Task6
create table emailconstraint(
Fullname varchar(25),
age int (10),
gender enum  ('Female','Male','other'),
salary int (10),
city varchar(20)default'chennai',
pan varchar(25),
email varchar(25) unique
);
select * from emailconstraint;
INSERT INTO emailconstraint (Fullname, age, gender, salary, city, Pan, email)
VALUES ('John Doe', 30, 'Male', 25000, 'Bangalore', 'ABCDE1234F', 'john@example.com');
INSERT INTO emailconstraint (Fullname, age, gender, salary, city, Pan, email)
VALUES ('Jane Smith', 32, 'Female', 27000, 'Mumbai', 'FGHIJ5678K', 'john@example.com');

-- Task7

create table Notnullconstraint(
Fullname varchar(25) not null,
age int (10),
gender enum  ('Female','Male','other'),
salary int (10),
city varchar(20),
pan varchar(25)
);
select*from notnullconstraint;

INSERT INTO notnullconstraint (age, gender, salary, city, Pan)
VALUES (25, 'Male', 20000, 'Chennai', 'KLMNO12345');

insert into notnullconstraint values('Rebecka',35,'female',10000,'chennai','khc923dmb');

-- Task8

create table defgenconstraint(
Fullname varchar(25) not null,
age int (10),
gender varchar(20)default'not specified',
salary int (10),
city varchar(20),
pan varchar(25)
);
select*from defgenconstraint;

INSERT INTO defgenconstraint (Fullname, age, salary, city, Pan)
VALUES ('Alice Brown', 28, 22000, 'Chennai', 'LMNOP67890');

-- Task9

create table mobnoconstraint(
Fullname varchar(25) not null,
age int (10),
gender varchar(20)default'not specified',
salary int (10),
city varchar(20),
pan varchar(25),
mobile int(10)
);
select*from mobnoconstraint;
INSERT INTO mobnoconstraint (Fullname, age, gender, salary, city, Pan, mobile)
VALUES ('Raj Patel', 35, 'Male', 28000, 'Ahmedabad', 'QRSTU98765', '123456789');

INSERT INTO mobnoconstraint (Fullname, age, gender, salary, city, Pan, mobile)
VALUES ('Raj Patel', 35, 'Male', 28000, 'Ahmedabad', 'QRSTU98765', '12354567869');

-- Task 10 ### (ERROR)###

create table depforkeyconstraint1(
Fullname varchar(25) not null,
age int (10),
gender varchar(20)default'not specified',
salary int (10),
city varchar(20),
pan varchar(25),
id int,
foreign key(id) references departments(departments_id)
);

select*from depforkeyconstraint1;

create table departments(departments_id int primary key,
department_name varchar(30));
select* from departments;
insert into departments values(1,'marketing'),
(2,'sales'),
(3,'engineering');

INSERT INTO depforkeyconstraint (Fullname, age, gender, salary, city, Pan, id)
VALUES ('Ravi Kumar', 29, 'Male', 24000, 'Hyderabad', 'VWXYZ54321', 5);

-- Task11

create table posageconstraint(
Fullname varchar(25) not null,
age int check (age>0),
gender varchar(20)default'not specified',
salary int (10),
city varchar(20),
pan varchar(25)
);
select*from posageconstraint;
INSERT INTO posageconstraint VALUES ('Priya Singh', 25, 'Female', 30000, 'Delhi', 'ABCDE67890');

INSERT INTO posageconstraint VALUES ('Priya Singh', -25, 'Female', 30000, 'Delhi', 'ABCDE67890');

-- Task12

create table fulnamelenconstraint(
Fullname VARCHAR(25) CHECK (LENGTH(Fullname) BETWEEN 3 AND 20),
age int (10),
gender varchar(20)default'not specified',
salary int (10),
city varchar(20),
pan varchar(25)
);
select*from fulnamelenconstraint;
INSERT INTO fulnamelenconstraint (Fullname, age, gender, salary, city, Pan)
VALUES ('Jo', 32, 'Male', 25000, 'Chennai', 'PQRS123456');
INSERT INTO fulnamelenconstraint (Fullname, age, gender, salary, city, Pan)
VALUES ('Johnj', 32, 'Male', 25000, 'Chennai', 'PQRS123456');

-- Task13

create table citynotnulconstraint(
Fullname VARCHAR(25) ,
age int (10),
gender varchar(20),
salary int (10),
city varchar(20)not null,
pan varchar(25)
);
select*from citynotnulconstraint;
INSERT INTO citynotnulconstraint (Fullname, age, gender, salary, Pan)
VALUES ('Amit Shah', 40, 'Male', 32000, 'WXYZ987654');


ALTER TABLE citynotnulconstraint
DROP COLUMN city;
alter table citynotnulconstraint
add column city varchar(20) not null;
INSERT INTO citynotnulconstraint (Fullname, age, gender, salary, Pan)
VALUES ('Amit Shah', 40, 'Male', 32000, 'WXYZ987654');


-- Task14

create table agedefaultconstraint(
Fullname VARCHAR(25) ,
age int (10)default'25',
gender varchar(20),
salary int (10),
city varchar(20)not null,
pan varchar(25)
);
select*from agedefaultconstraint;
INSERT INTO agedefaultconstraint (Fullname, gender, salary, city, Pan)
VALUES ('Neha Verma', 'Female', 27000, 'Pune', 'ABCDE56789');
 
-- task15
create table salbtwnrangeconstraint(
Fullname VARCHAR(25) ,
age int (10)default'25',
gender varchar(20),
salary int check (salary between 15000 and 50000),
city varchar(20)not null,
pan varchar(25)
);
select*from salbtwnrangeconstraint;
INSERT INTO salbtwnrangeconstraint (Fullname, age, gender, salary, city, Pan)
VALUES ('Kiran Rao', 45, 'Male', 10000, 'Kolkata', 'HIJKL98765');
 # valid#
INSERT INTO salbtwnrangeconstraint (Fullname, age, gender, salary, city, Pan)
VALUES ('Kiran Rao', 45, 'Male', 16000, 'Kolkata', 'HIJKL98765');

-- Task16

create table countrydefaulconstraint(
Fullname VARCHAR(25) ,
age int (10)default'25',
gender varchar(20),
salary int check (salary between 15000 and 50000),
city varchar(20)not null,
pan varchar(25),
country varchar(20) default'India'
);
select*from  countrydefaulconstraint;

INSERT INTO countrydefaulconstraint (Fullname, age, gender, salary, city, Pan)
VALUES ('Rohit Sharma', 35, 'Male', 35000, 'Mumbai', 'MNO12345');




 



