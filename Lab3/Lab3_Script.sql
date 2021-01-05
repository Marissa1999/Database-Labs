--Lab3_Script.sql
--Name: Marissa Gonçalves
--Date: Thursday, September 13, 2018



--Step 0:

spool "D:\Semester III\Database I\Labs\Lab3\Lab3_Spool.txt"



--Step 1:


--a)

CREATE TABLE student
(s_id NUMBER(5), 
s_last VARCHAR2(30), 
s_first VARCHAR2(30),
s_class VARCHAR2(2), 
f_id NUMBER(5),
CONSTRAINT student_s_id_pk PRIMARY KEY (s_id));



--b)

INSERT INTO STUDENT VALUES
(1, 'Graham', 'Bill', 'JR', 4);

INSERT INTO STUDENT VALUES
(2, 'Sanchez', 'Jim', 'EX', 3);

INSERT INTO STUDENT VALUES
(3, 'White', 'Peter', 'EX', 3);

INSERT INTO STUDENT VALUES
(4, 'Phelp', 'David', 'JR', 1);

INSERT INTO STUDENT VALUES
(5, 'Lewis', 'Shelia', 'SR', 2);

INSERT INTO STUDENT VALUES
(6, 'James', 'Thomas', 'JR', 1);



--c)

CREATE TABLE vanier_enrollment
(s_id NUMBER(5),
course_no VARCHAR2(7),
grade CHAR(2),
CONSTRAINT enrollment_grade_cc CHECK ((grade = 'A+') or (grade = 'A-')));



--d)

INSERT INTO vanier_enrollment VALUES
(3, 'MIS 301', 'A-');

INSERT INTO vanier_enrollment VALUES
(4, 'MIS 303', 'D');







--Step 2:

SELECT constraint_name, constraint_type FROM user_constraints
WHERE table_name = 'VANIER_ENROLLMENT';







--Step 3:


--a)

ALTER TABLE student
ADD SocialSecurity CHAR(9);

ALTER TABLE student
MODIFY SocialSecurity CHAR(11);


--b)

ALTER TABLE vanier_enrollment
ADD CONSTRAINT vanier_enrollment_pk PRIMARY KEY (s_id, course_no);


--c)

ALTER TABLE vanier_enrollment
DROP PRIMARY KEY;

ALTER TABLE vanier_enrollment
DROP CONSTRAINT enrollment_grade_cc;


--d)

ALTER TABLE vanier_enrollment
ADD CONSTRAINT enrollment_grade_cc CHECK ((grade = 'A+') or (grade = 'A-'));


--e)

ALTER TABLE vanier_enrollment
RENAME COLUMN course_no TO "c_number"; 







--Step 4:

--a)

CREATE TABLE faculty
(f_id NUMBER(5),
f_last VARCHAR2(30),
f_first VARCHAR2(30),
CONSTRAINT faculty_f_id_pk PRIMARY KEY (f_id));



--b)

INSERT INTO faculty VALUES
(1, 'Robertson', 'Myra');

INSERT INTO faculty VALUES
(2, 'Smith', 'Neal');

INSERT INTO faculty VALUES
(3, 'Arlec', 'Lisa');

INSERT INTO faculty VALUES
(4, 'Fillipo', 'Paul');

INSERT INTO faculty VALUES
(5, 'Denver', 'Paul');




--c)


--a)
SELECT f_last "Faculty Last", f_first "FacultyFirst" FROM faculty;

--b)
SELECT f_last || f_first FROM faculty;

--c)
SELECT DISTINCT f_last FROM faculty;

--d)
SELECT f_last, f_first 
FROM faculty 
WHERE f_id=4;

--e)
SELECT f_id, f_last, f_first 
FROM faculty
WHERE f_id>=2 AND f_id<=4;

SELECT f_id, f_last, f_first 
FROM faculty
WHERE f_id BETWEEN 2 AND 4;

--f)
SELECT f_id, f_last, f_first
FROM faculty
WHERE f_id IN(2, 4, 6);

--g)
SELECT f_id, f_last, f_first
FROM faculty
WHERE f_id NOT IN(2, 4, 6);

--h)
SELECT f_id, f_last, f_first
FROM faculty
WHERE f_first LIKE 'P%';

--i)
SELECT f_id, f_last, f_first
FROM faculty
ORDER BY f_first DESC;

--j)
SELECT b_id, 
SUM(c_price) "SUMOFFICE" 
FROM chapter
GROUP BY b_id;





--Step 5:


spool off

