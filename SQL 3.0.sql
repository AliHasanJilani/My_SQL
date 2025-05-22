-- self join => is a kind of join 

use sakila;

create table  employee1 ( eid int, ename varchar(20), manager_id int);
insert into employee1 values(10,"tushar",null),(11,"aman",12),
(12,"adi",10), (13,"sakshi",11);

select*from employee1;

select emp.eid , emp.ename , emp.manager_id, manager.eid ,manager.ename
from employee1 as emp join employee1 as manager 
where emp.manager_id = manager.eid;

-- natural join => its is one of the waste join
