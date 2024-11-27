create database employeemanagement1;
use employeemanagement1;

-- Creating Departments Table
CREATE TABLE Departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
select* from departments;
-- Inserting data into Departments Table
INSERT INTO Departments  VALUES (101,'Human Resources');
INSERT INTO Departments (name) VALUES ('Engineering');
INSERT INTO Departments (name) VALUES ('Marketing');
INSERT INTO Departments (name) VALUES ('IT');

-- Creating Employees Table
CREATE TABLE Employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    gender VARCHAR(10) NOT NULL,
    salary INT NOT NULL CHECK (salary > 30000),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);
select* from employees;

-- Inserting data into Employees Table
INSERT INTO Employees VALUES (1,'Alice', 30, 'Female', 40000, 101);
INSERT INTO Employees (name, age, gender, salary, department_id) VALUES 
('Bob', 35, 'Male', 50000, 102), 
('Charlie', 28, 'Male', 32000, 102), 
('Diana', 40, 'Female', 45000, 103);
INSERT INTO Employees (name, age, gender, salary, department_id) VALUES 
('Bob', 35, 'Male', 50000, 104);

-- Creating Projects Table
CREATE TABLE Projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    budget INT NOT NULL CHECK (budget > 10000)
);
select* from projects;

-- Inserting data into Projects Table
INSERT INTO Projects (name, budget) VALUES 
('Project Alpha', 15000), 
('Project Beta', 20000), 
('Project Gamma', 25000);

-- Creating Employee_Projects Table
CREATE TABLE Employee_Projects (
    employee_id INT,
    project_id INT,
     PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(id),
    FOREIGN KEY (project_id) REFERENCES Projects(id)
   
);
select* from Employee_Projects;
 -- Inserting data into Employee_Projects Table
INSERT INTO Employee_Projects (employee_id, project_id) VALUES 
(1, 1), 
(1, 2), 
(7, 3), 
(8, 1), 
(9, 2);
select * from employee_projects;



-- Creating Attendance Table
CREATE TABLE Attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'On Leave'),
    FOREIGN KEY (employee_id) REFERENCES Employees(id)
);
select* from Attendance;

-- Inserting data into Attendance Table
INSERT INTO Attendance (employee_id, date, status) VALUES 
(1, '2024-11-01', 'Present'), 
(7, '2024-11-01', 'Absent'), 
(7, '2024-11-01', 'On Leave'), 
(8, '2024-11-01', 'Present'),
(1, '2024-11-02', 'Absent'), 
(8, '2024-11-02', 'Present'), 
(9, '2024-11-02', 'Present'), 
(9, '2024-11-02', 'On Leave');

-- 4 queries
   -- Retrieve all employees in the 'IT' department.
   
SELECT e.id, e.name, e.age, e.gender, e.salary, d.name AS departments
FROM Employees AS e
JOIN Departments AS d ON e.department_id = d.id
WHERE d.name = 'IT';

-- List all projects with a budget greater than 50000.

select  name,budget from projects where budget>5000;

-- Show the names of employees and the projects they are working on.

SELECT e.name AS employee_name, p.name AS project_name
FROM Employees AS e
JOIN Employee_Projects AS ep ON e.id = ep.employee_id
JOIN Projects AS p ON ep.project_id = p.id;

   -- Count the number of employees in each department.

SELECT d.name AS department_name, COUNT(e.id) AS number_of_employees
FROM Employees AS e
JOIN Departments AS d ON e.department_id = d.id
GROUP BY d.name;

-- Find employees with a salary greater than 50000.

SELECT id, name, age, gender, salary, department_id
FROM Employees
WHERE salary >= 50000;
 -- (or)
select*from employees where salary>=50000;

-- Get attendance records for a specific employee.
select* from attendance where employee_id=7;

# update records5
-- Increase the salary of employees in the 'HR' department by 10%.
UPDATE Employees
SET salary = salary * 1.10
WHERE id = 8;
select* from employees;

-- Change the department of an employee.


update Employees
set department_id =104
where id =7;

# Delete Records:  
-- Remove an employee who has resigned.

DELETE FROM Attendance
WHERE employee_id = 1;
select*from attendance;
select*from Employee_Projects;
select*from projects;
delete from projects 
where id=1;
DELETE FROM Employee_Projects
WHERE project_id = 2;

--   Constraints and Modifications:  
-- Add a unique constraint to the `email` column in `Employees` table.
alter table employees add column email varchar(30)unique;
   
   
-- Ensure `age` is always greater than 18.
ALTER TABLE EMPLOYEES ADD constraint CHECK_AGE check(AGE> 18);
   
-- Add a default value 'Unknown' to `gender` if not specified.
ALTER TABLE EMPLOYEES ALTER COLUMN GENDER SET DEFAULT 'UNKNOWN';



