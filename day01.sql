--How to create a table
CREATE TABLE students (
    student_id CHAR(5),
    student_name VARCHAR2(30),
    student_age NUMBER(3, 0),
    date_of_birth DATE,
    CONSTRAINT student_id_fk FOREIGN KEY(student_id) REFERENCES employees(employee_id)
);

--create a table name: employees id, name, salary, state, company
CREATE TABLE employees (
    employee_id CHAR(5),
    employee_name VARCHAR2(30) UNIQUE,
    employee_salary NUMBER(10, 2) NOT NULL,
    employee_state CHAR(2),
    employee_company VARCHAR2(20),
    CONSTRAINT employee_id_pk PRIMARY KEY(employee_id)
     
);

--how to check values in a field
CREATE TABLE suppliers (
  supplier_id NUMBER(3), -- check between 200 and 500?
  supplier_name VARCHAR2(30),
  supplier_date DATE,
  CONSTRAINT supplier_id_check CHECK(supplier_id BETWEEN 200 AND 500)
);



--constraints- 1) primary key 2 unique, 3 not null 4 foreign keyy 5 check

CREATE TABLE my_suppliers (
  supplier_id NUMBER(3),
  supplier_name VARCHAR2(30),--check all names in upper case
  supplier_date DATE,
  CONSTRAINT supplier_name_check check(supplier_name = upper(supplier_name))
);

create table supliers(
supplier_id number(1),
supplier_name varchar2(30),
contact_name varchar2(40)
);

--how to enter a data into a table
--1. WAY
insert into my_suppliers values(101, 'ALI CAN', '07-Apr-21');
insert into my_suppliers values(102, 'VELI HAN', '07-Apr-21');

insert into employees values('10001', 'Veli Han', 123000.00, 'FL', 'Google');
insert into employees values('10002', 'Ali Can', 123100.00, 'FL', 'FaceBook');


--2. WAY
--insert into students(student_id, student_name) values('101', 'david steel');
--how to see table on the console
select * from my_suppliers;


--how to delete a table
DROP TABLE students;
DROP TABLE employees;
DROP TABLE my_suppliers;