select @@autocommit;

set @@autocommit=0;

create database tushar;
use tushar;
create table test(id int);
insert into test values(3),(4);
commit;  -- to save the data in the database
insert into test values(500);
update test set id=99;
rollback;
select * from test;

insert into test values(600);
create table y1(a int);
rollback;
select * from test;
insert into test values(90),(91);
delete from test where id=1;
savepoint test_chpoint;
update test set id=10000;
rollback to test_chpoint;
select * from test;

commit;

set @@autocommit=1;
select*from test;
delete from test;
select @@autocommit;
start transaction;
update test set id=9999999;
rollback;
 -- to save the data in the database

-- transaction
-- tracasaction start : DML , start
-- end => commit,rollback,DDl,DCL


-- view
-- complex query easy 
-- database( no data is store)
-- virtual data => query of the base table
-- data access()

use tushar;
create table t_actor as 
select * from sakila.actor limit 20;

select * from t_actor;

create view actor_view as select actor_id, first_name from t_actor;

select * from actor_view; 

create view actor_view2 as select actor_id, first_name from actor_view;
select * from actor_view2;

delete from actor_view where actor_id=1;
select * from actor_view;

create view actor_view3 as select lower(first_name) from t_actor where actor_id = 5;
select * from actor_view3;

drop view actor_view;