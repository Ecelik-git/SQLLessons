--Create  "my_employees1" table             
CREATE TABLE my_employees1 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);
​
INSERT INTO my_employees1 VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO my_employees1 VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO my_employees1 VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO my_employees1 VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO my_employees1 VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO my_employees1 VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO my_employees1 VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');
​
--Create  "companies" table
CREATE TABLE companies 
(  
  company_id number(9), 
  company varchar2(20),
  number_of_employees number(20)
);
​
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(100, 'APPLE', 21000);

drop table companies;
select * from my_employees1;
select * from companies;

--find company name, id number of states 
select company, company_id, (select count(state)
                    from my_employees1
                    where companies.company = my_employees1.company
                    ) as num_of_states_per_company
from companies;
                    
 -- fin the name of the companies company id maximum and minimum salaries per company
 
select company, company_id, (
                    select max(salary)
                    from my_employees1
                    where companies.company = my_employees1.company
                    ) as max_salary,
                    (
                    select min(salary)
                    from my_employees1
                    where companies.company = my_employees1.company
                    ) as min_salary
from companies;
 
--find the distinct state names 

select distinct state
from my_employees1;
 
 
 --find the distinct employee names 

select distinct name
from my_employees1;


--find the number of disticnt state  and distinct employee names
select count(distinct state) as Dstate, 
count(distinct name) as Dname
from my_employees1;
 
--like condition
--like is used with wildcard
--wildcard is 1) % sign 2) _ sign 3) regular expresssion regexp_like
--% means zero or more character
-- _ means single character



--find state names whose initial is F
select distinct state
from my_employees1
where state like 'F%';

--find the company names with last letter "E"
select distinct company
from my_employees1
where company like '%E';

--find company names starts with 'G' and last with 'E
select distinct company
from my_employees1
where company like 'G%E';
 
--record whose company names have 'OS' in any position

select *
from my_employees1
where company like '%OS%';
 
-- find the state names with second'e'
 
select distinct state
from my_employees1
where state like '_e%';
 
--state names length is 7 and thirds char is 'o'
 
select distinct state
from my_employees1
where length(state)=7 and state like '__o%';--or '__o____'


--Find the state names whose length is 5 and second character is ‘e’ and fourth character is ‘a’ 
select distinct state
from my_employees1
where state like '_e_a_';

--
select distinct state
from my_employees1
where state like '_e___%';
 
select distinct name
from my_employees1
where name like '_ra%';
 
--regexp_like
CREATE TABLE words
( 
  word_id number(10) UNIQUE,
  word varchar2(50) NOT NULL,
  number_of_letters number(6)
);

INSERT INTO words VALUES (1001, 'hot', 3);
INSERT INTO words VALUES (1002, 'hat', 3);
INSERT INTO words VALUES (1003, 'hit', 3);
INSERT INTO words VALUES (1004, 'hbt', 3);
INSERT INTO words VALUES (1008, 'hct', 3);
INSERT INTO words VALUES (1005, 'adem', 4);
INSERT INTO words VALUES (1006, 'selena', 6);
INSERT INTO words VALUES (1007, 'yusuf', 5);

select * from words;

select distinct word
from words
where REGEXP_LIKE (word, 'h[oai]t');
                    
select distinct word
from words
where REGEXP_LIKE (word, 'h[a-i]t');              
                    
--note ^ is for first char $ is for last char
--find word start with h and end with t
select word
from words
where regexp_like(word, '^[h].[t]$');
--find words end with a or a or p                    
select word
from words
where regexp_like(word, '[amp]$');

--note: . dot in regexp_like stands for single char
--'i' if this is thirds parameter that means case insensitive
--if you don't put 'i' as third parameter, pl/sql works as case sensitive as default

--retrieve all words contain a
select word
from words
where regexp_like(word, 'A', 'i');

select word
from words
where regexp_like(word, 'at');

--words that contain a b c d and followed by t
select word
from words
where regexp_like(word, '[a-d]t');

--words that contain d and then any charand followed by t
select word
from words
where regexp_like(word, 'd.m');

