drop table students;

create table students(
    id char(9),
    name varchar2(50),
    grade number(2),
    address varchar2(80),
    update_date date
);

INSERT INTO students VALUES(123456789, 'John Walker', 11, '1234 Texas', '14-Apr-2020');
INSERT INTO students VALUES(223456789, 'Johnny Walker', 12, '1234 Florida', '14-Apr-2020');

select * from students;


--that gives exception
declare
    student_id char(9);
    student_name varchar2(50);

begin
    select id, name
    into student_id, student_name
    from students;
end;

--handle exception

declare
    student_id char(9);
    student_name varchar2(50);

begin
    select id, name
    into student_id, student_name
    from students
    where grade=23;
    DBMS_OUTPUT.PUT_LINE('student id:' || student_id);
    
    exception
        when too_many_rows then 
        DBMS_OUTPUT.PUT_LINE('you cannot put multiple data into a single container');
end;

declare
    student_id char(9);
    student_name varchar2(50);

begin
    select id, name
    into student_id, student_name
    from students
    where grade=23;
    DBMS_OUTPUT.PUT_LINE('student id:' || student_id);
    
    exception
        when no_data_found then 
        DBMS_OUTPUT.PUT_LINE('Are you sure you have a data like this?');
end;

--zero-divide exception
declare
    num1 number(4):=12;
    num2 number(4):=0;
    result number(4,2);

begin
    result := num1/num2;
    DBMS_OUTPUT.PUT_LINE(num1 || '/' || num2 ||'='|| result);
    
    exception
    when zero_divide then
    DBMS_OUTPUT.PUT_LINE('do not make divizor 0');
end;
    
--invalid number exception
declare
    new_grade number(3);
begin
    insert into students(id, grade) values('456789000', 'A');
    select grade
    into new_grade
    from students
    where id=123456789;
    DBMS_OUTPUT.PUT_LINE('New grade is ' || new_grade);
    
    exception
    when invalid_number then
    DBMS_OUTPUT.PUT_LINE('Be carefull about data types');
end;


---USER DEFINED EXCEPTIONS---
                
--Create ILLEGAL_ENTRY Exception for ages if user enters Negative Values
​
--a)Do not get the age from user
DECLARE
    age NUMBER(3):=-23;
    ILLEGAL_ENTRY EXCEPTION;
BEGIN 
    IF(age<0) THEN
        RAISE ILLEGAL_ENTRY;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Youd did correct entrance ' || age); 
    END IF;
    
    EXCEPTION
    WHEN ILLEGAL_ENTRY THEN
        DBMS_OUTPUT.PUT_LINE('Age cannot be negative...'); 
END;
​
--b)Get the age from user
DECLARE
    age NUMBER(3);
    ILLEGAL_ENTRY EXCEPTION;
BEGIN 
    age:='&Age';
​
    IF(age<0) THEN
        RAISE ILLEGAL_ENTRY;
    ELSE
        DBMS_OUTPUT.PUT_LINE('You did correct entrance, the age is  ' || age); 
    END IF;
    
    EXCEPTION
    WHEN ILLEGAL_ENTRY THEN
        DBMS_OUTPUT.PUT_LINE('Age cannot be negative...'); 
END;
​
--How to multiple Exceptions after they occured
DECLARE
    new_grade students.grade%TYPE; --I got the data type from students table grade field.
    new_name students.name%TYPE; --I got the data type from students table name field.
    INVALID_NAME EXCEPTION;
    INVALID_GRADE EXCEPTION;
​
BEGIN
    new_grade:='&Grade';
    new_name:='&Name';
    
    IF(new_grade<=0 or new_grade>12) THEN
        RAISE INVALID_GRADE;
    ELSE
        DBMS_OUTPUT.PUT_LINE('You entered the grade correctly.The grade is ' || new_grade); 
    END IF;
    
    IF(new_name = 'Ali Can') THEN
        RAISE INVALID_NAME;
    ELSE
        DBMS_OUTPUT.PUT_LINE(new_name || ' is our student'); 
    END IF;
    
    EXCEPTION
    WHEN INVALID_GRADE THEN
        DBMS_OUTPUT.PUT_LINE('Grade should be between 1 and 12...'); 
    WHEN INVALID_NAME THEN
        DBMS_OUTPUT.PUT_LINE('Ali Can is not our student, he is master...'); 
END;







































