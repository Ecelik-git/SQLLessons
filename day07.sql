


CREATE TABLE my_companies 
(  
  company_id number(9), 
  company_name varchar2(20)
);

INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');

CREATE TABLE orders 
(  
  order_id number(9),
  company_id number(9), 
  order_date date
);

INSERT INTO orders VALUES(11, 101, '17-Apr-2020');
INSERT INTO orders VALUES(22, 102, '18-Apr-2020');
INSERT INTO orders VALUES(33, 103, '19-Apr-2020');
INSERT INTO orders VALUES(44, 104, '20-Apr-2020');
INSERT INTO orders VALUES(55, 105, '21-Apr-2020');

--INNER JOIN or JOIN it is for common records

select m.company_id, m.company_name, o.order_id
from my_companies m inner join orders o
on o.company_id = m.company_id;

--LEFT JOIN 

select m.company_id, m.company_name, o.order_id
from my_companies m left join orders o
on o.company_id = m.company_id;


--RIGHT JOIN
select o.company_id, m.company_name, o.order_id
from my_companies m right join orders o
on o.company_id = m.company_id;

--FULL JOIN, all record from left and right table

select o.company_id, m.company_name, o.order_id
from my_companies m full join orders o
on o.company_id = m.company_id;


--SELF JOIN, join the table with itself

drop table workers;


CREATE TABLE workers 
(  
  id number(2), 
  name varchar2(20),
  title varchar2(60),
  manager_id number(2) 
);

INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;

--create a record that displays the workers and their managers
select w1.name as employee_name, w2.name as manager_name
from workers w1 inner JOIN workers w2
on w1.manager_id = w2.id;

--how to change table structure
--ALTER table it isused to add column modify column and delete column
--add a address column into workers table 

alter table workers
add address varchar2(50);

update workers
set address = 'Dallas Texas'
where id = 1;

update workers
set address = 'Oklahoma City Oklahoma'
where id = 2;


drop table workers;
select * from workers;


--add citizenship column into workers table with default value

alter table workers
add citizenship varchar2(50) default 'USA';

--change the name of adddress field to student_address

alter table workers
rename column address to student_address;


alter table workers
rename column student_address to workers_address;

--change the table name to my_workers
alter table workers
rename to my_workers;

select * from my_workers;


--change id not null
alter table my_workers
modify id number(4) not null;

--delete a column
alter table my_workers
drop column citizenship;









