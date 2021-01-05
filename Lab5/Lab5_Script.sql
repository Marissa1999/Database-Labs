--Lab5_Script.sql:
--Name: Marissa Gonçalves
--Date: October 4, 2018


CONNECT scott/tiger
SET LINESIZE 200
SET PAGESIZE 50
SET ECHO ON





--Question 1:

START "D:\Semester III\Database I\Labs\Lab5\SchoolScript.sql"

SPOOL "D:\Semester III\Database I\Labs\Lab5\Lab5_Spool.txt"





--Question 2:


--a)

SELECT f_id, UPPER(f_last), LOWER(f_first),
INITCAP (f_last || ' ' || f_first)
FROM faculty;



SELECT f_last, f_first, f_id
FROM faculty
ORDER BY LENGTH(f_last);



SELECT course_no, INSTR(course_no, 'S') "The Position of S in Course_No", course_name
FROM course;







--b)

SELECT ROUND(28.7654, 2)
FROM dual;



SELECT POWER(2, 4)
FROM dual;



SELECT CEIL(28.7654)
FROM dual;



SELECT TRUNC(28.7654, 2)
FROM dual;








--c)

SELECT SYSDATE
FROM dual;


SELECT ADD_MONTHS('10-MAY-03', 3)
FROM dual;









--d)

SELECT TO_CHAR(SYSDATE, 'DY, MONTH DD, YYYY HH:MI:SS P.M.')
FROM dual;







--e)

SELECT course_no, course_name, max_enrl,
DECODE (max_enrl, 140, 'Extra Large Class',
        90, 'Large Class',
		30, 'Medium Class',
		35, 'Unique Class',
		'Small') "Class Desc"
FROM course;







--f)

SELECT SUM(max_enrl), AVG(max_enrl), MAX(max_enrl), MIN(max_enrl)
FROM course;






--Question 3




--a)

SELECT *
FROM faculty
WHERE f_last LIKE '&NAME';






--b)

SELECT *
FROM faculty
WHERE f_last LIKE '&&NAME';






--c)

DEFINE Last = Smith

SELECT * 
FROM faculty
WHERE f_last = '&Last';








--d)

UPDATE course SET max_enrl = CASE
WHEN course_no = 'MIS 101' THEN max_enrl * 2
WHEN course_no = 'MIS 301' THEN max_enrl * 1.5
WHEN course_no = 'MIS 441' THEN max_enrl * 3
ELSE max_enrl
END;

SELECT * FROM course;








SPOOL OFF;