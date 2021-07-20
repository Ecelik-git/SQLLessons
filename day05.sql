CREATE TABLE words1
( 
  word_id number(10) UNIQUE,
  word varchar2(50) NOT NULL,
  number_of_letters number(6)
);
drop table words;
INSERT INTO words1 VALUES (1001, 'hot', 3);
INSERT INTO words1 VALUES (1002, 'hat', 3);
INSERT INTO words1 VALUES (1004, 'hbt', 3);
INSERT INTO words1 VALUES (1008, 'hct', 3);
INSERT INTO words1 VALUES (1005, 'adem', 4);
INSERT INTO words1 VALUES (1006, 'selena', 6);
INSERT INTO words1 VALUES (1007, 'yusuf', 5);
INSERT INTO words1 VALUES (1009, 'aababbbbc', 9);
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

--find all contain u and followed by any 2 chars and followed by f
select word
from words1
where regexp_like(word, '[u]..f');

-- all that double e in any position
select word
from words1
where regexp_like(word, '[b]{4}');--{4} 4 letters together bbbb cccc dddd

--NOT LIKE

-- find all words not start with h

select word
from words1
where word not like 'h%';


-- find all not ending with t
select word
from words1
where word not like '%t';

-- find all that don't have e in second psoition
select word
from words1
where word not like '_e%';

--find all that don't contain a in any position

select word
from words1
where word not like '%a%';

-- find all that start with any not folloed by e a d
select word
from words1
where not regexp_like(word, '[.ead](*)');

--(*) means any character or any characters or nothing. It is similar with ‘%’ in LIKE

-- ORDER BY
select *
from words1
order by word_id;

select *
from words1
order by word_id desc;

select *
from words1
order by 3 desc;--3 is column number

select *
from words1
order by 3 desc, 2 asc;

select *
from words1
order by number_of_letters desc, word asc;

--ALIASES

drop table workers purge;
CREATE TABLE addresses 
(  
  employee_id number(9), 
  street varchar2(20),
  city varchar2(20),
  state char(2),
  zipcode char(5)
);

CREATE TABLE workers 
(  
  worker_id number(9), 
  worker_first_name varchar2(20),
  worker_last_name varchar2(20)
);

INSERT INTO workers VALUES(14, 'Chris', 'Tae');
INSERT INTO workers VALUES(11, 'John', 'Walker');
INSERT INTO workers VALUES(12, 'Amy', 'Star');
INSERT INTO workers VALUES(13, 'Brad', 'Pitt');
INSERT INTO workers VALUES(15, 'Chris', 'Way');

INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');


--retrieve worker's first name last name and city name

select w.worker_first_name, w.worker_last_name, a.city
from workers w, addresses a
where w.worker_id = a.employee_id;










