-- Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    age INT,
    gender CHAR(1) CHECK (gender IN ('M', 'F'))
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_code VARCHAR(20),
    semester INT,
    marks INT CHECK (marks BETWEEN 0 AND 100),
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Students (student_id, name, department, age, gender) VALUES
(1, 'Alice', 'CS', 21, 'F'),
(2, 'Bob', 'EE', 22, 'M'),
(3, 'Carol', 'ME', 20, 'F'),
(4, 'David', 'CS', 23, 'M'),
(5, 'Eva', 'EE', 21, 'F');

INSERT INTO Enrollments (enrollment_id, student_id, course_code, semester, marks) VALUES
(101, 1, 'CS101', 1, 85),
(102, 1, 'CS102', 2, 90),
(103, 2, 'EE101', 1, 75),
(104, 3, 'ME101', 1, 88),
(105, 4, 'CS101', 1, 95),
(106, 5, 'EE101', 2, 78),
(107, 5, 'EE102', 3, 82);


select * from students;
select * from enrollments;

-- Q1. List all students along with the courses they have enrolled in.
-- Ans.
select s.student_id , s.name , e.course_code 
	from students as s
    join enrollments as e 
    where s.student_id = e.student_id;
    
-- Q2 Find students who are not enrolled in any course
-- Ans. 
select * from students as s 
	join enrollments as e
	where enrollment_id is null;
    

-- Q3 Find students who scored above the average marks in their respective departments.
-- Ans
select s.name , avg(e.marks), e.course_code
	from students as s 
	join enrollments as e
    on s.student_id = e.student_id;
    
-- Q4. Rank students by marks within each course.
-- Ans
select e.course_code , s.name , e.marks,
Rank()over(partition by e.course_code order by e.marks DESC)
from enrollments as e join students as s on s.student_id = e.student_id;

-- Q5. Find running average of marks for each student ordered by semester.
-- Ans
select e.student_id , s.name , e.semester , e.marks,
round(avg(e.marks)over(partition by e.student_id order by e.semester))
from enrollments as e
join students as s on s.student_id = e.student_id;

-- Q6. Average marks per department across all enrolled courses.
-- Ans
select s.department, avg(e.marks) from students as s
join enrollments as e on s.student_id = e.student_id
group by s.department;
