--Lab10_Script.sql
--Name: Marissa Gonçalves
--Date: November 15, 2018


CONNECT scott/tiger;
SET LINESIZE 200;
SET PAGESIZE 50;
SET ECHO ON;



SPOOL "D:\Semester III\Database I\Labs\Lab10\Lab10_Spool.txt";

START "D:\Marissa\RegistrationDB_Script.sql"




--I: Single-Row Sub-Queries


--Query 1:

COLUMN s_last FORMAT A10;
COLUMN s_first FORMAT A10;

SELECT s_id, s_last, s_first, f_id
FROM student
WHERE f_id = (
               SELECT f_id 
               FROM faculty
			   WHERE f_last = 'Arlec'
			  );




		
		
--Query 2:

COLUMN s.s_last FORMAT A10;
COLUMN s.s_first FORMAT A10;
COLUMN facultyName FORMAT A20 HEADING "Faculty Name";

SELECT s.s_id, s.s_last, s.s_first, s.f_id, f.f_last || ' ' || f.f_first facultyName
FROM student s, faculty f
WHERE s.f_id = f.f_id AND f.f_last = 'Arlec';
			                      




		
		

--Query 3:

SELECT s_id, s_last, s_first, birthday
FROM student
WHERE birthday >=  (
                     SELECT birthday
                     FROM student
					 WHERE s_last = 'Sanchez'
					);


SELECT * FROM student;







--Query 4:

SELECT s_id, s_last, s_first, birthday
FROM student
WHERE birthday >=  (
                     SELECT birthday
                     FROM student
					 WHERE s_last = 'White'
					);





					


--Query 5:

COLUMN s_last FORMAT A10;
COLUMN s_first FORMAT A10;

SELECT s_id, s_last, s_first, f_id
FROM student
WHERE f_id != (
               SELECT f_id 
               FROM faculty
			   WHERE f_last = 'Arlec'
			  );


			  

			  
			  
			  
			  
--Query 6:

SELECT s_id, course_no, grade
FROM enrollment
WHERE s_id = (
                SELECT s_id
				FROM student
				WHERE f_id = (
				                SELECT f_id
								FROM faculty
								WHERE f_last = 'Smith'
				              )
             );



			 
			 


--Query 7:

SELECT s.s_id, s.s_last, s.s_first, e.course_no, e.grade, f.f_last
FROM student s, enrollment e, faculty f
WHERE s.s_id = e.s_id AND s.f_id = f.f_id AND f.f_last = 'Smith';







--Query 8:

CREATE TABLE temp
AS
SELECT s_id, s_last, s_first, s_class
FROM student
WHERE s_class = 'JR';


DESCRIBE temp;

SELECT * FROM temp;





--Query 9:

INSERT INTO temp(s_id, s_first, s_last)
SELECT s_id, s_first, s_last
FROM student
WHERE s_class = 'SR';

SELECT * FROM temp;






--Query 10:

UPDATE student SET s_class = 'EX'
WHERE f_id = (
                SELECT f_id
			    FROM faculty
			    WHERE f_last = 'Robertson'
             );


SELECT * FROM student;







--Query 11:

DELETE FROM student
WHERE f_id = (
                SELECT f_id
			    FROM faculty
			    WHERE f_last = 'Silcoff'
             );

			 
SELECT * FROM student;



			 


--Query 12:

SELECT course_no, course_name, max_enrl
FROM course
WHERE max_enrl < (
                    SELECT AVG(SUM(max_enrl))
					FROM course
					GROUP BY max_enrl
                 );







--II: Multiple-Row Sub-Queries




--Query 13:

COLUMN s_last FORMAT A10;
COLUMN s_first FORMAT A10;

SELECT s_id, s_last, s_first, birthday, f_id
FROM student
WHERE f_id IN (
                SELECT f_id
			    FROM faculty
			    WHERE f_id > 2
              );



			 
			 
			 

--Query 14:

SELECT *
FROM course
WHERE course_no IN  (
                       SELECT course_no
			           FROM enrollment
			           WHERE grade = 'A+'
                    );





					


--Query 15:

COLUMN s.s_last FORMAT A10;
COLUMN s.s_first FORMAT A10;

SELECT s.s_id, s.s_last, s.s_first, s.s_class
FROM student s, enrollment e
WHERE s.s_id = e.s_id AND e.grade = 'A+'
ORDER BY s.s_id;









--Query 16:

SELECT ROWNUM, course_no, course_name, max_enrl
FROM (SELECT course_no, course_name, max_enrl
      FROM course
	  ORDER BY max_enrl DESC)
WHERE ROWNUM <= 3;


SELECT * FROM course;






--Query 17:

SELECT ROWNUM, course_no, course_name, max_enrl
FROM (SELECT course_no, course_name, max_enrl
      FROM course
	  ORDER BY max_enrl)
WHERE ROWNUM <= 3;





SPOOL OFF;