-- Dql :=> window function
use sakila;
select * from payment;
select payment_id , customer_id , amount from payment;

select avg(amount) from payment;

-- Window functions perform calculations 
-- across a set of rows that are related to the current row, 
-- without collapsing rows like GROUP BY does.

-- over() function
SELECT 
  employee_no,
  salary,
  SUM(salary) OVER () AS total_salary,
  AVG(salary) OVER () AS avg_salary
FROM employees;



select payment_id , customer_id , amount,
avg(amount) over(),
sum(amount) over(),
max(amount) over()
from payment;

-- over(partition by) = >PARTITION BY is a clause used with 
-- window functions in SQL. It divides the result set 
-- into partitions (groups of rows) to apply 
-- the window function independently to each partition.

select payment_id , customer_id , amount,
avg(amount) over(partition by customer_id)
from payment;

select payment_id , customer_id , amount,
avg(amount) over(partition by customer_id )
from payment; 


-- running sum
-- A running sum (also called a cumulative sum)
-- adds up the values row by row, maintaining a total so far.
-- It’s commonly used in reports, time series, and financial data.



select payment_id , customer_id , amount,
avg(amount) over(),
avg(amount) over(order by payment_id)
from payment; 


select payment_id , customer_id , amount,
sum(amount) over(partition by customer_id),
sum(amount) over(partition by customer_id order by payment_id)
from payment; 

-- get the employee_no the salary the total_salary and the avgsalary for the employees table

-- get the emp no salary and the yr of hiring amoung with the average salary of that emp from salary table

-- get the emp_no salary and the running salary for each customer from employees table

use employees;
select * from salaries;


select emp_no , sum(salary), avg(salary) 
from salaries 
group by emp_no ;


select emp_no , salary , year(from_date) ,
avg(salary) over(partition by emp_no) from salaries;


select emp_no , salary ,sum(salary)
over(order by emp_no) from salaries;
