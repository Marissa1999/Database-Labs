--Lab9_Script.sql
--Name: Marissa Gonçalves
--Date: November 5, 2018


CONNECT scott/tiger;
SET LINESIZE 200;
SET PAGESIZE 50;
SET ECHO ON;


SPOOL "D:\Semester III\Database I\Labs\Lab9\Lab9_Spool.txt";


--Question 1:

START "D:\Marissa\SchoolDB_Script.sql"



--Question 2:


--a)

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id = faculty.f_id;




--b)

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id = faculty.f_id;





--c)

SELECT student.s_last, student.s_first, faculty.f_last, faculty.f_first
FROM student, faculty;




--d)

SELECT s.s_id, s.s_last, s.s_class, f.f_last, f.f_first
FROM student s, faculty f
WHERE s.f_id = f.f_id;





--e)

SELECT s.s_id, s.s_last, s.s_class, f.f_last, f.f_first
FROM student s, faculty f
WHERE s.f_id = f.f_id AND s.s_class = 'EX';






--Question 3:

--a)

SELECT s.s_id, e.course_no, e.grade, s.s_last, s.s_first
FROM student s, enrollment e
WHERE s.s_id = e.s_id;





--b)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade
FROM student s, enrollment e, course c
WHERE s.s_id = e.s_id AND e.course_no = c.course_no
ORDER BY s.s_id;




--c)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade
FROM student s, enrollment e, course c
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND c.course_no = 'MIS 551';




--d)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade
FROM student s, enrollment e, course c
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND (e.grade = 'A+' OR e.grade = 'A-')
ORDER BY s.s_id;




--e)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade
FROM student s, enrollment e, course c
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND c.course_name LIKE '%Systems%'
ORDER BY s.s_id;





--f)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade, f.f_last
FROM student s, enrollment e, course c, faculty f
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND s.f_id = f.f_id AND (e.grade = 'C+' OR e.grade = 'B-')
ORDER BY s.s_id;





--g)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade, f.f_last
FROM student s, enrollment e, course c, faculty f
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND s.f_id = f.f_id AND (e.grade = 'A+' OR e.grade = 'A-') AND c.course_name LIKE '%Systems%'
ORDER BY s.s_id;





--h)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade, f.f_last
FROM student s, enrollment e, course c, faculty f
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND s.f_id = f.f_id AND (e.grade = 'B+' OR e.grade = 'B-') AND s.s_last = 'White' AND s.s_first = 'Peter'
ORDER BY s.s_id;





--i)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade, f.f_last
FROM student s, enrollment e, course c, faculty f
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND s.f_id = f.f_id AND (e.grade = 'A+' OR e.grade = 'B-') AND f.f_last = 'Arlec' AND f.f_first = 'Lisa'
ORDER BY s.s_id;






--j)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade, f.f_last
FROM student s, enrollment e, course c, faculty f
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND s.f_id = f.f_id AND s.s_class = 'JR' 
ORDER BY s.s_id;






--k)

SELECT s.s_id, s.s_last, s.s_first, e.course_no, c.course_name, e.grade, f.f_last, f.f_first, s.s_class
FROM student s, enrollment e, course c, faculty f
WHERE s.s_id = e.s_id AND e.course_no = c.course_no AND s.f_id = f.f_id AND (s.s_class = 'EX' OR s.s_class = 'SR') AND (f.f_last = 'Arlec' OR f.f_last = 'Smith') 
ORDER BY s.s_id, c.course_name;






SPOOL OFF;