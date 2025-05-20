use sakila;

select* from  actor;
select * from film_actor;

select f.film_id , f.actor_id from film_actor as f
join actor as a;

create database regex;
use regex;
create table product( pid int, pname varchar(20), price int);
insert into product values(10,"Iphone",20000), (11,"TV",10000),
(12,"LED",3000), (13,"Jeans",800);

select * from product;

create table orders1( oid int, city varchar(20), pid int);
insert into orders1 values(124111,"Jaipur",10), (124112,"GOA",11),
(145631,"Manali",12), (59869011,"Raipur",16);

select * from product;
select * from orders1;
-- cross join
select o.oid, o.city, o.pid, p.pname,p.pid from orders1 as o
join product as p;
-- comman condition
select o.oid, o.city, o.pid, p.pname,p.pid from orders1 as o
join product as p where o.pid = p.pid;

-- syntx
select o.oid, o.city, o.pid, p.pname from orders1 as o
inner join product as p where o.pid = p.pid ;

-- left join
select o.oid, o.city, o.pid, p.pname , p.pid from orders1 as o
left join product as p on o.pid = p.pid ;

-- right joim
select o.oid, o.city, o.pid, p.pname , p.pid from orders1 as o
right join product as p on o.pid = p.pid ;


use sakila;
select * from actor;
select * from film_actor;
select * from film;

-- combine film actor and film table to 
-- find out the actor_id , film_id , and the movie name done by each actor 

-- find out the actor id the movie 
-- name only for those movies which has a lenghth of 100

-- get the actor_id and the number of movies he have 
-- done in his hole carrier

-- get the title and the film id for those movies who's raating is NC-17
-- and sort this movies based on decesending of film _id

select fa.actor_id, fa.film_id, f.title as f
from film_actor fa
join film f on fa.film_id = f.film_id;

select fa.actor_id,f.title as movie_name
from film_actor as fa
join film as f on fa.film_id = f.film_id
where f.length > 100;

select film_id , title from film where rating = 'NC-17' order by  film_id desc;


select actor_id, count(film_id) as movie_count from film_actor group by actor_id order by movie_count desc;
