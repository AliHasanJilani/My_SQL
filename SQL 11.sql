use employees;

select * from employees;
select * from dept_emp;
select * from departments;

-- get the emp_no and the first_name and the dept_no from the empoyeels from 
-- employees table and the dept_emp table


select employees.emp_no, employees.first_name, dept_emp.dept_no
	from employees
	join dept_emp
	on employees.emp_no = dept_emp.emp_no;

-- get emp_no chiye jiski salary greater than 1000
select * from salaries;

select emp_no,avg(salary) from salaries
group by emp_no;

 select salary > (Select avg(Salary) from salaries as s
 
 where sal.emp_no= s.emp_no) ;
 
 create database regex1;
use regex1;
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

INSERT INTO Departments (DeptID, DeptName) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'HR');
select * from departments;


CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees (EmpID, EmpName, Salary, DeptID) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 60000, 1),
(3, 'Charlie', 50000, 1),
(4, 'Diana', 55000, 2),
(5, 'Eve', 65000, 2),
(6, 'Frank', 40000, 3);



select * from employees;
 
 
 
 select * from employees as emp
where emp.salary > (
    select avg(emp4.salary)
    from employees emp4
    where emp4.dept_id = emp.dept_id
);


select * from employees
as emp
where salary > ( select avg(salary)
from employees as emp4 where emp.deptid=emp4.deptid);

select distinct d.DeptName
from Employees as emp
join Departments d on e.DeptID = d.DeptID
where e.Salary > 60000;

select distinct d.DeptName
from Departments d
where exists (
    select deptid
    from Employees e
    group by deptid
    where e.DeptID = d.DeptID and e.Salary > 60000
);
select* from employees;

select deptid,max(salary)
from employees as emp4
group by deptid ;

select *
from employees as emp
where salary = (
    select max(salary)
    from employees as emp4
    where emp.deptid = emp4.deptid
);

use regex;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Students (StudentID, StudentName, Department) VALUES
(1, 'Alice', 'Computer Science'),
(2, 'Bob', 'Computer Science'),
(3, 'Charlie', 'Mathematics'),
(4, 'Diana', 'Mathematics'),
(5, 'Eve', 'Physics');


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Department VARCHAR(50)
);

INSERT INTO Courses (CourseID, CourseName, Department) VALUES
(101, 'Data Structures', 'Computer Science'),
(102, 'Algorithms', 'Computer Science'),
(201, 'Calculus', 'Mathematics'),
(202, 'Linear Algebra', 'Mathematics'),
(301, 'Quantum Mechanics', 'Physics');

CREATE TABLE Enrollments (
    StudentID INT,
    CourseID INT,
    Grade DECIMAL(5, 2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, Grade) VALUES
(1, 101, 88.5),
(1, 102, 92.0),
(2, 101, 76.0),
(2, 102, 81.5),
(3, 201, 85.0),
(3, 202, 90.0),
(4, 201, 78.0),
(4, 202, 82.5),
(5, 301, 91.0);

select * from Students;
select *  from Courses;
select * from Enrollments;
select studentname , studentid , coursename
from  students as s;


select * from
    enrollments as e
where grade >  (select avg(grade) from 
				enrollments as e1 where e.studentid=e1.studentid);


SELECT DISTINCT s.StudentID, s.StudentName
FROM Students s
JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.Grade = (
    SELECT MAX(e2.Grade)
    FROM Enrollments e2
    WHERE e2.CourseID = e.CourseID
);
