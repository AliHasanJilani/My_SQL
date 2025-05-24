-- data type in SQL
-- data type
-- Number(int,float,double)
-- character (char , varchar ,string)
-- date ,timestamp
-- create statement
use sakila;
create table test (id int);

insert into test values(10);
select * from test;

create table test2 (id tinyint);

insert into test values(127);
select * from test;

create table test3 (id tinyint unsigned);

insert into test values(255);
select * from test;


create table test4 (id decimal(5,2));
insert into test4 values(845);
insert into test4 values(845.74123);
 -- insert intp test4 values(59.09);
select * from test4;

create table test6 ( fname varchar(5));
insert into test6 values('hi');
insert into test6 values('hey         ');
insert into test6 values('hjgdgsagdus');
select fname, char_length(fname)
 from test6;
 
 
create table test7( dob date );
insert into test7 values('2023-12-01');
insert into test7 values( now() );
select * from test7;

-- subquery
-- query within a query

select * from payment;

-- get the payment id customer id and rentenl id and the amount and staff id only for thoes 
-- paymenet where staff id is equla to rental id 1422

SELECT payment_id, rental_id, amount 
from payment
where staff_id = (
    select staff_id
    from payment
    where rental_id = 1422
);
