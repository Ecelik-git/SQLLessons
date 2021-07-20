drop table workers;
CREATE TABLE workers 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');


--find total salary per employee
SELECT name, SUM(salary) AS total_salary
FROM workers
GROUP BY name;

--find the total of workers per state
select state, count(name) as total_employee
from workers
group by state;

--Find the number of the workers whose salary is more than $2000 per company
select company, count(name) as num_of_workers
from workers
where salary>2000
group by company;

--find min and max salary for per company
select company, min(salary) as min_salary, max(salary) as max_salary
from workers
group by company;

--HAVING clause: t is used after group by to filter

--find the total salary if it is greater than 2500 per worker

--Note: After “WHERE”, group functions(SUM(), COUNT(), MIN(), MAX(), AVG()) CANNOT be used.
--Note: After “GROUP BY”,  “WHERE” CANNOT be used
--Note: After “GROUP BY”, if you need to filter, you have to use “HAVING”

select name, sum(salary) as total_salary
from workers
group by name 
having sum(salary)>2500;

--find the totla salary if the worker name is after brad pitt per worker

select name, sum(salary) as total_salary
from workers
group by name
having name > 'Brad Pitt';

--Find the number of employees if it is more than 1 per state
select state, count(name) as num_of_employees
from workers
group by state
having count(name) >1;


-- min salary if it is more than 2000 per company
select company, min(salary) as min_salary
from workers
group by company
having min(salary) >2000;

--max salary per state if less than 30000
select state, max(salary) as max_salary
from workers
group by state
having max(salary) <3000;

-- SET operation, kumeler
--union, intersect, minus, union all
-- set operations are used between two select queries

--Find the state or employee names whose salary is greater than 3000, less than 2000 without duplication. 
--UNION, no duplication
select state as state_or_worker, salary
from workers
where salary > 3000

union

select name as state_or_worker, salary
from workers
where salary<2000;

--UNION ALL, same data can be displayed more than once

select state as state_or_worker, salary
from workers
where salary > 3000

union all

select name as state_or_worker, salary
from workers
where salary<2000;


--INTERSECT
--find all common employee names whose salary is >1000 less than 2000
select name
from workers
where salary > 1000

intersect

select name 
from workers
where salary<2000;

--Find all common employee names whose salary is greater than 2000 
--and company name is IBM, APPLE or GOOGLE
select name
from workers
where salary > 2000

intersect

select name 
from workers
where company in('IBM', 'APPLE', 'GOOGLE');

--MINUS
--Find the employee names whose salary is less than 3000 and not working in GOOGLE

select name, state, salary
from workers
where salary < 3000

minus

select name, state, salary
from workers
where company = 'GOOGLE';









