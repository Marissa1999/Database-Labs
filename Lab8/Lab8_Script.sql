--Lab8_Script.sql
--Name: Marissa Gonçalves
--Date: November 1, 2018


CONNECT scott/tiger;
SET LINESIZE 200;
SET PAGESIZE 50;
SET ECHO ON;


SPOOL "D:\Semester III\Database I\Labs\Lab8\Lab8_Spool.txt";



--Question 1:

START "D:\Marissa\collegeScript.sql"




--Question 2:

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id = faculty.f_id;



--Question 3:

SELECT student.f_id "Student_f_id", student.s_last, student.s_first, faculty.f_last, faculty.f_first,
faculty.f_id "Faculty_f_id"
FROM student, faculty;




--Question 4:

INSERT INTO STUDENT VALUES (7, 'Daniel', 'Criag', 'JR', null, null);




--Question 5:

INSERT INTO STUDENT VALUES (8, 'Celine', 'Dion', 'JR', null, null);




--Question 6:

SELECT * FROM student;





--Question 7:

SELECT * FROM faculty;





--Question 8:

SELECT s.s_id, s.s_last, s.s_class, f.f_last, f.f_first
FROM student s, faculty f
WHERE s.f_id = f.f_id;





--Question 9:

SELECT s.s_id, s.s_last, s.s_class, f.f_last, f.f_first
FROM student s, faculty f
WHERE s.f_id = f.f_id AND s.s_class = 'EX';






--Question 10:

SELECT s.s_id, s.s_last, s.s_class, f.f_last, f.f_first
FROM student s, faculty f
WHERE s.f_id = f.f_id AND (s.s_class = 'EX' OR s.s_class = 'SR');





--Question 11:

SELECT * FROM levelclass;






--Question 12:

SELECT c.course_no, c.course_name, c.credits, c.max_enrl, l.lc_type, l.lc_desc
FROM course c, levelclass l
WHERE c.max_enrl BETWEEN l.lc_min AND l.lc_max;





--Question 13:

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id = faculty.f_id;






--Question 14:

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id (+) = faculty.f_id
ORDER BY student.s_id;





--Question 15:

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id = faculty.f_id (+);





--Question 16:

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id = faculty.f_id (+)
ORDER BY student.s_id;






--Question 17:

SELECT student.s_id, student.s_last, student.s_class, faculty.f_last, faculty.f_first
FROM student, faculty
WHERE student.f_id (+) = faculty.f_id (+);






--Question 18:

SELECT c.course_no, c.course_name, c.credits, c.max_enrl, c.prereq
FROM course c, course r
WHERE c.course_no = r.prereq;





--Question 19:

SELECT c.course_no ||', '|| c.course_name "Course", c.course_no ||', '|| r.course_name "Pre-Requiste Course"
FROM course c, course r
WHERE c.prereq = r.course_no;






--Question 20:

SELECT c.course_no ||', '|| c.course_name "Course", c.course_no ||', '|| r.course_name "Pre-Requiste Course"
FROM course c, course r
WHERE c.prereq = r.course_no (+);






--Question 21:

SELECT s_id, s_last, s_first FROM student
UNION
SELECT w_id, w_last, w_first FROM worker;





--Question 22:

SELECT s_id, s_last, s_first FROM student
UNION ALL
SELECT w_id, w_last, w_first FROM worker;





--Question 23:

SELECT s_id, s_last, s_first FROM student
INTERSECT
SELECT w_id, w_last, w_first FROM worker;





--Question 24:

SELECT s_id, s_last, s_first FROM student
MINUS
SELECT w_id, w_last, w_first FROM worker;






SPOOL OFF;