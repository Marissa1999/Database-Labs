--Lab2_Script.sql
--Name: Marissa Gonçalves
--Date: Thursday, August 30, 2018

--Step 1:

--Start Spooling Commands to Text Document
spool "D:\Semester III\Database I\Labs\Lab2\Lab2_Spool.txt"


--Step 2:

--Creating Faculty Table
CREATE TABLE faculty
(f_id NUMBER(5),
f_last VARCHAR2(30),
f_first VARCHAR2(30),
CONSTRAINT faculty_f_id_pk PRIMARY KEY (f_id));


--Creating Student Table
CREATE TABLE student
(s_id NUMBER(5),
s_last VARCHAR2(30),
s_first VARCHAR2(30),
s_class VARCHAR2(2),
f_id NUMBER(5),
CONSTRAINT studnet_s_id_pk PRIMARY KEY (s_id),
CONSTRAINT student_s_id_fk FOREIGN KEY (f_id) REFERENCES faculty(f_id));


--Creating Course Table
CREATE TABLE course
(course_no VARCHAR2(7),
course_name VARCHAR2(25),
credits NUMBER(2),
max_enr1 NUMBER(4) CONSTRAINT course_max_enr1_nn NOT NULL,
CONSTRAINT course_course_id_pk PRIMARY KEY(course_no));


--Creating Enrollment Table
CREATE TABLE enrollment
(s_id NUMBER(5),
course_no VARCHAR2(7),
grade CHAR(2),
CONSTRAINT enrollment_pk PRIMARY KEY (s_id, course_no),
CONSTRAINT enrollment_s_id_fk FOREIGN KEY (s_id) REFERENCES student(s_id),
CONSTRAINT enrollment_csecid_fk FOREIGN KEY (course_no) REFERENCES course(course_no));





--Step 3:

--Dropping All Created Tables
DROP TABLE faculty CASCADE CONSTRAINTS;
DROP TABLE student CASCADE CONSTRAINTS;
DROP TABLE course CASCADE CONSTRAINTS;
DROP TABLE enrollment CASCADE CONSTRAINTS;





--Step 4:

--Recreating Faculty Table
CREATE TABLE faculty
(f_id NUMBER(5),
f_last VARCHAR2(30),
f_first VARCHAR2(30),
CONSTRAINT faculty_f_id_pk PRIMARY KEY (f_id));


--Recreating Student Table
CREATE TABLE student
(s_id NUMBER(5),
s_last VARCHAR2(30),
s_first VARCHAR2(30),
s_class VARCHAR2(2),
f_id NUMBER(5),
CONSTRAINT studnet_s_id_pk PRIMARY KEY (s_id),
CONSTRAINT student_s_id_fk FOREIGN KEY (f_id) REFERENCES faculty(f_id));


--Recreating Course Table
CREATE TABLE course
(course_no VARCHAR2(7),
course_name VARCHAR2(25),
credits NUMBER(2),
max_enr1 NUMBER(4) CONSTRAINT course_max_enr1_nn NOT NULL,
CONSTRAINT course_course_id_pk PRIMARY KEY(course_no));


--Recreating Enrollment Table
CREATE TABLE enrollment
(s_id NUMBER(5),
course_no VARCHAR2(7),
grade CHAR(2),
CONSTRAINT enrollment_pk PRIMARY KEY (s_id, course_no),
CONSTRAINT enrollment_s_id_fk FOREIGN KEY (s_id) REFERENCES student(s_id),
CONSTRAINT enrollment_csecid_fk FOREIGN KEY (course_no) REFERENCES course(course_no));





--Step 5:

--Inserting Faculty Table Records
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



--Inserting Student Table Records
INSERT INTO student VALUES
(1, 'Graham', 'Bill', 'JR', 4);

INSERT INTO student VALUES
(2, 'Sanchez', 'Jim', 'EX', 3);

INSERT INTO student VALUES
(3, 'White', 'Peter', 'EX', 3);

INSERT INTO student VALUES
(4, 'Phelp', 'David', 'JR', 1);

INSERT INTO student VALUES
(5, 'Lewis', 'Sheila', 'SR', 2);

INSERT INTO student VALUES
(6, 'James', 'Thomas', 'JR', 1);



--Inserting Course Table Records
INSERT INTO course VALUES
('MIS 101', 'Info to Info. Systems', 3, 140);

INSERT INTO course VALUES
('MIS 301', 'Systems Analysis', 3, 35);

INSERT INTO course VALUES
('MIS 441', 'Database Management', 3, 12);

INSERT INTO course VALUES
('CS 155', 'Programming in C++', 3, 90);

INSERT INTO course VALUES
('MIS 451', 'Web-Based Systems', 3, 30);

INSERT INTO course VALUES
('MIS 551', 'Advanced Web', 3, 30);

INSERT INTO course VALUES
('MIS 651', 'Advanced Java', 3, 30);



--Inserting Enrollment Table Records
INSERT INTO enrollment VALUES
(1, 'MIS 101', 'A+');

INSERT INTO enrollment VALUES
(5, 'MIS 301', 'B-');

INSERT INTO enrollment VALUES
(2, 'MIS 441', 'A-');

INSERT INTO enrollment VALUES
(3, 'CS 155', 'B-');

INSERT INTO enrollment VALUES
(5, 'MIS 451', 'A+');

INSERT INTO enrollment VALUES
(4, 'MIS 551', 'B+');

INSERT INTO enrollment VALUES
(6, 'MIS 651', 'C+');

INSERT INTO enrollment VALUES
(3, 'MIS 301', 'B-');

INSERT INTO enrollment VALUES
(4, 'MIS 441', 'A-');

INSERT INTO enrollment VALUES
(4, 'CS 155', 'B-');

INSERT INTO enrollment VALUES
(2, 'MIS 451', 'A+');

INSERT INTO enrollment VALUES
(6, 'MIS 551', 'B+');

INSERT INTO enrollment VALUES
(3, 'MIS 651', 'C+');




--Step 6:

--Displaying All Created Tables
SELECT * FROM faculty;

SELECT * FROM student;

SELECT * FROM course;

SELECT * FROM enrollment;




--Step 7:

--Edit Faculty Table by Adding Birthday Records
ALTER TABLE faculty
ADD birthday DATE;


DESCRIBE faculty


UPDATE faculty
SET birthday = to_date('30-07-1940', 'DD-MM-YYYY')
WHERE f_id = 1;


UPDATE faculty
SET birthday = to_date('12-05-1950', 'DD-MM-YYYY')
WHERE f_id = 2;


UPDATE faculty
SET birthday = to_date('24-03-1941', 'DD-MM-YYYY')
WHERE f_id = 3;


UPDATE faculty
SET birthday = to_date('11-02-1971', 'DD-MM-YYYY')
WHERE f_id = 4;


UPDATE faculty
SET birthday = to_date('09-10-1980', 'DD-MM-YYYY')
WHERE f_id = 5;


--Display New Faculty Table
SELECT * FROM faculty;





--Step 8:

--Edit Student Table by Adding Birthday Records
ALTER TABLE student
ADD birthday DATE;


DESCRIBE student


UPDATE student
SET birthday = to_date('30-07-1980', 'DD-MM-YYYY')
WHERE f_id = 1;


UPDATE student
SET birthday = to_date('12-05-1981', 'DD-MM-YYYY')
WHERE f_id = 2;


UPDATE student
SET birthday = to_date('24-03-1987', 'DD-MM-YYYY')
WHERE f_id = 3;


UPDATE student
SET birthday = to_date('11-02-1988', 'DD-MM-YYYY')
WHERE f_id = 4;


UPDATE student
SET birthday = to_date('09-10-1970', 'DD-MM-YYYY')
WHERE f_id = 5;


UPDATE student
SET birthday = to_date('07-12-1960', 'DD-MM-YYYY')
WHERE f_id = 6;


--Display New Student Table
SELECT * FROM student;



--Step 9: 

--Finish Spooling Commands to Text Document
spool off

