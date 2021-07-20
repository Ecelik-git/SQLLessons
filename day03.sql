--IN condition

CREATE TABLE customers_products
( 
  product_id number(10),
  customer_name varchar2(50),
  product_name varchar2(50)
);

INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');

--select all orange or apple or appricot
select *
from customers_products
where product_name='Orange' or product_name='Apple' or product_name='Apricot';

--@. WAY
select *
from customers_products
where product_name in ('Orange', 'Apple', 'Apricot');

-- BETWEEN condition

select *
from customers_products
where product_id between 10 and 30;

-- Not BETWEEN

select *
from customers_products
where product_id not between 20 and 30;

--EXISTS conditions
--"EXISTS" is used before "SUBQUERIES"

CREATE TABLE customers_likes
( 
  product_id number(10),
  customer_name varchar2(50),
  liked_product varchar2(50)
);

INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');


select * from customers_likes;

--select customer names whose product id are same in customer product and likes table

SELECT customer_name
FROM customers_products
WHERE EXISTS (
                SELECT product_id
                FROM customers_likes 
                WHERE customers_products.product_id = customers_likes.product_id
              );

--subqueries in select statement
drop table customers_products;
drop table customers_likes;

drop table 

CREATE TABLE employees1 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);

INSERT INTO employees1 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees1 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees1 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees1 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees1 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees1 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees1 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

CREATE TABLE companies 
(  
  company_id number(9), 
  company varchar2(20),
  number_of_employees number(20)
);


INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(100, 'APPLE', 21000);

select * from employees1;
select * from companies;

--employee and companiy names in which number of employee is more tha 15000
select name, company
from employees1
where company in (
                    select company
                    from companies
                    where number_of_employees>15000
                    );       
                    
--find the stae names and company that has the least employees

select state, company
from employees1
where company in (select company
                    from companies
                    where companies.number_of_employees = (
                            select min(number_of_employees)
                            from companies)
                    );

--find the employee names of the company that has maximum employees
select name, company
from employees1
where company in(select company 
            from companies
            where number_of_employees = (
                        select max(number_of_employees)
                        from companies)
                        );

--find the average salary of the employees whose companies have more than 15000 employees
SELECT avg(salary) as average_salary
    
FROM employees1
where company in (select company
                        from companies
                        where number_of_employees>15000)
                        ;


--find the number of employees and average salary for every company
select company,number_of_employees, (
                            select avg(salary)
                            from employees1
                            where companies.company =employees1.company
                            )as average_salary
from companies 
order by number_of_employees
;





















