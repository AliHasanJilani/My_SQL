-- Dual table => The dual table is a special one-row,one-column ,
-- table present by default in oracle and other database installation 

-- now() function show the current date and time

select now() from dual;
-- sysdate() same as the now() function

select curdate() from dual;
select curtime() from dual;
select adddate( now() , 2) from dual;

select now(), adddate( now(),interval 2 month ) from dual;
select now() , adddate( now(), interval 2 week) from dual;

select datediff(now(),'2025-07-17 14:00:48') from dual;

select last_day( now() ) from dual ;

select month(now()),year(now()) from dual;

select extract(year from now()) from dual;
select extract(minute from now()) from dual;

-- %Y => access modifiyer
select now(), date_format( now() , 'This year is %Y') from dual;

-- round() , truncate() , pow , floor() , cell()alter

select 24.659 , round(24.659) from dual;

-- order by , alia , multi-row funtions

use sakila;
select*from actor;
select*from actor order by first_name;

select * from actor order by first_name , actor_id desc;

select actor_id , actor_id*10 as "newactor" from actor;

-- multi-row function => multiple the rows apply and give one output
-- sun , count, min , max, avg 

select * from payment;

select distinct(customer_id) from payment;

select count(customer_id) from payment;

select count(distinct(customer_id))
	from payment;

select count(customer_id) as Totalcustomer,
	count(distinct(custome_id)) as uniqcust,
	count(customer_id)-count(distinct(customer_id)) as repetitivecust
from payment;

select count(amount) , avg(amount) , min(amount),
	max(amount) from payment;
    
    
-- count , avg , min  , max  => skip the null values

-- NORMAl FUNCTIONS ARE NOT USED WITH AGGREGATE FUNCTION !!!!!!
select sum(amount) , amount from payment;

-- GROUP BY = > similar values ka group
-- creating a Group with the same values

select * from payment where customer_id = 1;

select customer_id from payment group by customer_id;

-- in case we are using group by then you can use that coulmn in select function
-- it use agrreate functions onlu

select customer_id , sum(amount) , count(amount)
	from payment group by customer_id;
   
-- Q1.   
select amount ,count(amount) 
	from payment 
    group by amount;

-- find out the total payment rented the 
-- sum of amount and the maxmium rental_id
select * from payment ;
-- get the total time of rental id the sum of amount spended 
-- and the max retal value for each staff

select staff_id ,
	count(rental_id) , 
	sum(amount) , 
	max(rental_id)  
from payment group by staff_id ;

-- Get the total no. of cust saver with the max and min rental id with 
-- the avg amount spended for each mounth of payment date

select 
    extract(month from payment_date) as payment_month, 
    count(customer_id) as customer_count, 
    max(rental_id) as max, 
    min(rental_id) as min
from payment 
group by extract(month from payment_date);


select * from payment ;