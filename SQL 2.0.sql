show databases;

use sakila;

select * from payment;
select customer_id from payment where customer_id>3 group by customer_id;
select count(payment_id), customer_id from payment where customer_id>3 group by customer_id;

select count(payment_id), customer_id from payment 
	group by customer_id
	having count(payment_id);
    
-- Q1.get the no. of payments for each amount
-- Q2.count the total np. of the customer who have done the paymenet fro each amount expect amount 2.99 or 0.9
-- Q3.get the sum of rental_id and the total amount of payment only for the amount 2.99, 0.99 .5.99 
--    and the sum of rental_is should be greater than 1000

select amount, count(payment_id) from payment group by amount;

select amount , count(customer_id) , sum(amount) from payment 
	where amount not in(2.99,0.99)
    group by amount;
    
    
select amount , sum(rental_id) , sum(amount) 
	from payment 
	where amount in(2.99,0.99,5.99) 
    group by amount
    having sum(rental_id);
    
select * from actor;

select a.actor_id, a.first_name, fa.film_id
	from actor as a
	join film_actor as fa
	where a.actor_id = fa.actor_id;
    
    
select a.actor_id, count(film_id)
	from actor as a
	join film_actor as fa
	where a.actor_id = fa.actor_id
    group by a.actor_id;
    
    
select a.actor_id, count(film_id)
	from actor as a
	join film_actor as fa
	where a.actor_id = fa.actor_id
    group by ;