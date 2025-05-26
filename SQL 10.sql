use sakila;

select * from payment;
select*from payment where amount=4.99;

select * from payment where amount =(select amount from payment where payment_id=6);

select*from actor;
-- get all the columns for user where actor_id is greter than the actor_id of a person
-- whose first_name is ED and last_name is chase

select *
from actor
where actor_id > (select actor_id from actor 
where first_name = 'ed' and last_name = 'chase'
);

select*from payment;

-- Get all the payment details for those payment where the payment_mounth should be equal to month of the payment_id = 5 

select * from payment
where month(payment_date) = (select month(payment_date) 
from payment where payment_id = 5) ;

select * from payment;
-- get the customer_id the payment_id and the amount for the 
-- payment where the rental_id is less than the 
-- rental_id of payment_id = 7 and amount less than 5;

select customer_id,payment_id,amount from payment 
where rental_id < (select rental_id from payment where payment_id=7 and amount<5); 

-- get the amount and the total no. of payment 
-- done where the total no. of payment is greater 
-- than the total no. of paymnet done by amount 5.99

select amount, count(payment_id)
from payment
group by amount
having count(payment_id) > (
    select count(payment_id)
    from payment
    where amount = 5.99
);


-- in operator (2.99 , 5.99)

select * from  payment
where amount in(select amount from payment where payment_id in (3,1));

-- any operator

select * from  payment
where amount = any(select amount from payment where payment_id in (3,1));

-- "> any "  => greater than min value of subquery

select * from  payment
where amount > any(select amount from payment where payment_id in (3,1));

-- "< any"  => less than max value of subquery

select * from  payment
where amount < any (select amount from payment where payment_id in (3,1)); 

-- "> all" => subquery se bhi bada hota hai

select * from  payment
where amount > all (select amount from payment where payment_id in (3,1)); 

-- "< all" => less than subquery

select * from  payment
where amount < all (select amount from payment where payment_id in (3,1)); 
