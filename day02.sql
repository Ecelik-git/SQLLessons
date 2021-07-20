--create suppliers table
drop table supliers;


--how to create primary key by using multiple columns
create table suppliers(
    supplier_id number(10),
    supplier_name varchar2(30),
    contact_name varchar2(30),
    constraint suppliers_pk primary key(supplier_id, supplier_name)
);



insert into suppliers values(1, 'IBM', 'John Walker');
insert into suppliers values(2, 'APPLE', 'Tom Hanks');
insert into suppliers values(3, 'SAMSUNG', 'JTae Shaun');
insert into suppliers values(4, 'IBM', 'JChris Tien');

--HOW TO UPDATE DATA IN A TABLE
update suppliers
set supplier_name = 'GOOGLE' where supplier_id = 4;
--HOW TO UPDATE MULTIPLE DATA IN A TABLE
update suppliers
set contact_name = 'Veli Han' where supplier_id <3 ;

update suppliers
set contact_name = 'Chris Tien' where supplier_id =4 ;


update suppliers
set supplier_name = 'Yahoo' where contact_name = 'Veli Han';

select * from suppliers;

update suppliers
    set supplier_name = 'Honda',
    contact_name='Angie Sun'
    where supplier_id = 3;
    
    
    
    
--create my_employees table and add 3 rows
create table my_employees(
    employee_id char(3),
    employee_name varchar2(30),
    employee_salary number(7,2)
);
select * from my_employees;

insert into my_employees values('101', 'Tom Hanks', 3000.00);
insert into my_employees values('102', 'Angelina Julie', 3500.75);
insert into my_employees values('103', 'Brad Pitt', 4500.75);


drop table my_employees;

create table my_positions(
    position_id char(3),
    position_name varchar2(20),
    position_salary number(7,2)
);
select * from my_positions;
insert into my_positions values('901', 'Hunior Worker', 2000.50);
insert into my_positions values('902', 'Senior Worker', 5000.00);
insert into my_positions values('902', 'Manager', 10000.00);

--how to update data by getting data from another table
update my_employees
set employee_salary = (
    select position_salary 
    from my_positions 
    where position_name ='Manager' 
    )
where employee_name = 'Angelina Julie';

--update bradpit name to brad pitt Julie and salary to senior
update my_employees
set employee_name='Brad Pitt Julie', 
    employee_salary = (
        select position_salary 
        from my_positions 
        where position_name ='Senior Worker' 
    )
    where employee_name = 'Brad Pitt';

--we need to make 10 % discount for senior position and manager position salaries for the
--employees
update my_employees
set employee_salary = (
        select position_salary
        from my_positions
        where position_name = 'Senior Worker'
        )*0.90
    where employee_name = 'Brad Pitt Julie';
    
update my_employees
set employee_salary = (
        select position_salary
        from my_positions
        where position_name = 'Manager'
        )*0.90
    where employee_name = 'Angelina Julie';
    
--change the salary to 6000 if the salary is less than 5000

update my_employees
set employee_salary = 4000 
    where employee_salary =6000;
    
--change the salary to 7000 if the salary is less than
--senior worker salary
select * from my_employees;

update my_employees
set employee_salary = 7000 
    where employee_salary < (
                            select position_salary
                            from my_positions
                            where position_name= 'Senior Worker'
                            );

--subqueries can be used after set keyword or where keyword

-- IS NULL condition


CREATE TABLE people(
    ssn char(9),
    name varchar2(50),
    address varchar2(50)
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');
drop table people;
select * from people;

select * from people
where name is null or address is null;

--how to update null to more unserstandable data
--1.WAY
update people
set name = 'Data is not inserted yet'
where name is null;

update people
set address = 'Data is not inserted yet'
where address is null;

--2. WAY
update people
set name= coalesce (name, 'Name is not inserted yet'),
    address = coalesce(address, 'Address is not inserted yet')

drop table people;

--how to delete data from a table
--the difference between delete and drop
--drop removes the table from schema completely that is, 
--it removes table data and the structure
--DELETE does not touch the table structure,
--it removes hust the data from a table

CREATE TABLE people(
    ssn char(9),
    name varchar2(50),
    address varchar2(50)
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');


--how to delete all data
delete from people;

--how to delete specific data
delete from people
where name ='Mark Star';


select * from people;
--delete all records whose name is null or address is null

delete from people
where name is null or address is null;


--delete all records whose names are not null
delete from people
where name is not null;

--what is truncate

--it is used to remove just all records
--delete is used to delete all or specific records
--if you use truncate you cannot roll back the records
--you can use delete, you can get the data back
--you cannot use where clause in truncate
--but in delete you can use where


TRUNCATE TABLE people;
​
--How to prevent to roll a table back after using "DROP"?
--If you use "PURGE" together with "DROP", the table will 
--be removed from schema and to roll it back will be impossible

select * from people;

drop table people purge;

-- Using "SELECT" statement (DQL)
--1)How to get all records from a table
SELECT *
FROM people;


--2)How to select specific records from a table
--1. Example
SELECT *
FROM people
WHERE name = 'Maryy Tien';


--3. Example
--Select records whose name lengths are less than 10
SELECT * 
FROM people
WHERE LENGTH(name) < 10;


CREATE TABLE workers
(
    id CHAR(5),
    name VARCHAR2(50),
    salary NUMBER(5),
    CONSTRAINT id4_pk PRIMARY KEY(id)
);

INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);

SELECT *
FROM workers;

--4) Example
--Select the record whose salary is maximum
SELECT *
FROM workers
WHERE salary = (
                 SELECT MAX(salary)
                 FROM workers
                );

--5) Example
--Select the record whose salary is minimum
SELECT *
FROM workers
WHERE salary = (
                 SELECT MIN(salary)
                 FROM workers
                );

--6) Example
--Select the record whose salary is minimum or maximum
SELECT *
FROM workers
WHERE salary = (SELECT MIN(salary) FROM workers) 
OR salary = (SELECT MAX(salary) FROM workers);


--7) Example
--Select the record whose salary is the second maximum
SELECT *
FROM workers
WHERE salary = (
                SELECT MAX(salary)
                FROM workers
                WHERE salary < (
                                 SELECT MAX(salary) 
                                 FROM workers
                                )
                );
                
--8)Example
--Select minimum salary from the workers table
SELECT MIN(salary) AS minimum_salary 
FROM workers;


--9)Example
--Select maximum salary from the workers table by using alias
SELECT MAX(salary) AS maximum_salary
FROM workers;


--10)Example
--Select maximum and minumum salary from the workers table by using alias
SELECT MAX(salary) AS maximum_salary,
       MIN(salary) AS minimum_salary
FROM workers;

--11)Example
--Select second maximum salary from the workers table by using alias
SELECT MAX(salary) AS second_maximum_salary
FROM workers
WHERE salary < (SELECT MAX(salary) FROM workers);

--12)Example
--Select second minimum salary from the workers table by using alias
SELECT MIN(salary) AS second_minimum_salary
FROM workers
WHERE salary > (SELECT MIN(salary) FROM workers);

--13)Example
--Select all data about the worker who has second minimum salary from the workers table
--1.Way
SELECT *
FROM workers
WHERE salary = (
                SELECT MIN(salary)
                FROM workers
                WHERE salary > (SELECT MIN(salary) 
                                FROM workers)
                );

--2.Way
SELECT *
FROM workers
ORDER BY salary ASC
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY;

--14)Example
--Select all data of the worker whose salary is the third maximum salary from the workers table by using alias
--1. Way
SELECT *
FROM workers
WHERE salary = (
                SELECT MAX(salary)
                FROM workers
                WHERE salary < (
                                SELECT MAX(salary)
                                FROM workers
                                WHERE salary < (
                                                SELECT MAX(salary)
                                                FROM workers
                                                )
                                )
                );


--2.Way
--To sort records in SQL we use "ORDER BY" with field name. It puts the records in ascending order as default, if you want to put records in descending order
--you have to declare
​
--If you want to skip some records from the top use "OFFSET <number of rows> ROW"
​
--If you want to get some records from top use "FETCH NEXT <number of rows> ROW ONLY"
SELECT *
FROM workers
ORDER BY salary DESC
OFFSET 2 ROW
FETCH NEXT 1 ROW ONLY;






