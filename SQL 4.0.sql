show databases;

use sakila;

show tables;
select* from actor;

select actor_id, last_name from actor;

select actor_id, 
	actor_id*10 
	from actor;

-- select come in DQL
-- where is condition its is retrun 
-- after the table name
select * from actor where actor_id = 5; 
select * from actor where first_name = 'ED'; 

select * from actor 
	where first_name = 'ED' 
    and actor_id > 100; 
    
select * from actor 
	where first_name = 'ED' 
    or actor_id > 100; 
    
select * from actor
	where actor_id>10 
    and actor_id<25;
    
-- between oprator between lower and higher

select * from actor where actor_id between 11 and 24;
select * from actor where actor_id in (2,5,70000);

-- select statement
-- sql case-insenstative
-- sql multi-line query
-- and or operator

-- now like => pattern par kaam krta hai

select * from actor where first_name="NIcK";

select * from actor where first_name like 'NICK';

-- like % [zero or more character] [only 1 character]
select * from actor where first_name like "_A%";

select * from actor where actor_id in (3,4,5);

select * from actor where actor_id between 3 and 7;

select * from actor where actor_id >=3 and actor_id<7;

select actor_id, first_name from actor where actor_id not between 3 and 100;

select * from actor where first_name like '_E%R';

select * from actor where first_name like '%NN%';

select * from actor where first_name like '%S___';

select * from actor where first_name like '______';

select * from actor where first_name like '_A%T%H__';