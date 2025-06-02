use sakila;

select * from payment;

select payment_id , customer_id , amount,
sum(amount) over(partition by customer_id),
rank() over(partition by customer_id order by amount desc) as rank1, 
dense_rank() over(partition by customer_id order by amount desc) as drank1
from payment;


-- find out the secound higest salary 


select * from 
(select payment_id , customer_id , amount,
dense_rank() 
	over(order by amount desc) as drank1
from payment) as tab where drank1=3;


use sakila;

create table xyz(id int , fname char(20));
insert into xyz(id,fname) values(10,"aman");
insert into xyz(id) values(11);

select* from xyz;


update xyz set fname="regex";
update xyz set fname="ali" where id=10;
select * from xyz;


delete from xyz where id=11;
delete from xyz where id=11;

select * from xyz;
