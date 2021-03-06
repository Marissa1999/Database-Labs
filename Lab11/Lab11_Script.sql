--Lab11_Script.sql
--Name: Marissa Gonçalves
--Date: November 22, 2018


CONNECT scott/tiger;
SET LINESIZE 200;
SET PAGESIZE 50;
SET ECHO ON;



SPOOL "D:\Semester III\Database I\Labs\Lab11\Lab11_Spool.txt";

START "D:\Marissa\EditionDB_Script.sql"
START "D:\Marissa\EducationDB_Script.sql"




--I: Application Using Education Database System


--a)

COLUMN S_LAST FORMAT A10;
COLUMN S_FIRST FORMAT A10;

SELECT S_ID, S_LAST, S_FIRST, F_ID
FROM STUDENT
WHERE F_ID IN (SELECT F_ID
                   FROM FACULTY
				   WHERE F_LAST = 'Robertson');
				   
				   
				   
--b)

SELECT S_ID, S_LAST, S_FIRST, BIRTHDAY
FROM STUDENT
WHERE BIRTHDAY < (SELECT BIRTHDAY
                   FROM STUDENT
				   WHERE S_LAST = 'White');
				   
				   

--c)

SELECT S_ID, S_LAST, S_FIRST, F_ID
FROM STUDENT
WHERE F_ID IN (SELECT F_ID
                   FROM FACULTY
				   WHERE F_LAST <> 'Robertson');



				   

--d)

SELECT S.S_ID, S.S_LAST, S.S_FIRST, S.F_ID, F.F_LAST
FROM STUDENT S, FACULTY F
WHERE S.F_ID = F.F_ID AND F.F_ID IN (SELECT F_ID
                                     FROM FACULTY
				                     WHERE F_LAST <> 'Robertson');




--e)

SELECT S_ID, COURSE_NO, GRADE
FROM ENROLLMENT
WHERE S_ID = (SELECT S_ID
              FROM STUDENT
			  WHERE F_ID = (SELECT F_ID
			                FROM FACULTY
							WHERE F_LAST = 'Fillipo'));




							

--f)

COLUMN F_LAST FORMAT A10;
COLUMN F_FIRST FORMAT A10;

CREATE TABLE TEMP
AS
SELECT F.F_ID, F.F_LAST, F.F_FIRST, F.BIRTHDAY, F.DEPTID, D.DEPTNAME, D.LOCATION
FROM FACULTY F, DEPARTMENT D
WHERE F.BIRTHDAY > TO_DATE('01-01-1950', 'DD-MM-YYYY') AND F.BIRTHDAY < TO_DATE('01-01-1972', 'DD-MM-YYYY')
AND F.DEPTID = D.DEPTID AND D.DEPTID IN (SELECT DEPTID
                                         FROM DEPARTMENT
				                         WHERE DEPTNAME = 'Telecommunication' OR DEPTNAME = 'Computer Science');



SELECT * FROM TEMP;






--g)

INSERT INTO TEMP (F_ID, F_LAST, F_FIRST, BIRTHDAY, DEPTID, DEPTNAME, LOCATION)
SELECT F.F_ID, F.F_LAST, F.F_FIRST, F.BIRTHDAY, F.DEPTID, D.DEPTNAME, D.LOCATION
FROM FACULTY F, DEPARTMENT D
WHERE F.DEPTID = D.DEPTID AND F.SOC_INS LIKE '___-___-789';


SELECT * FROM TEMP;




--h)

UPDATE STUDENT
SET S_CLASS = 'JR'
WHERE F_ID = (SELECT F_ID
              FROM FACULTY
              WHERE F_LAST = 'Smith');


SELECT * FROM STUDENT;





--i)

SELECT S_ID, S_LAST, S_FIRST, S_CLASS, F_ID, BIRTHDAY, SOC_INS
FROM STUDENT
WHERE F_ID IN (SELECT F_ID
               FROM FACULTY
			   WHERE DEPTID = (SELECT DEPTID
							   FROM DEPARTMENT 
							   WHERE DEPTNAME = 'Accounting'));





--j)

SELECT S_ID, COURSE_NO, GRADE
FROM ENROLLMENT
WHERE S_ID IN (SELECT S_ID
              FROM STUDENT
			  WHERE F_ID IN (SELECT F_ID
			                FROM FACULTY
							WHERE F_LAST = 'Arlec'));




--k)

SELECT S_ID, S_LAST, S_FIRST, F_ID
FROM STUDENT
WHERE F_ID IN (SELECT F_ID
               FROM FACULTY 
			   WHERE F_LAST <> 'Robertson' AND F_LAST <> 'Arlec');



			   


--l)

SELECT S_ID, COURSE_NO, GRADE
FROM ENROLLMENT
WHERE S_ID IN (SELECT S_ID 
               FROM STUDENT
			   WHERE F_ID IN (SELECT F_ID 
			                  FROM FACULTY
			                  WHERE F_LAST <> 'Smith'));

							  
							  
		


		
--II: Application Using Edition Database System


--a)

SELECT B_TITLE, B_PRICE
FROM BOOK
UNION
SELECT C_TITLE, C_PRICE
FROM CHAPTER;





--b)

SELECT B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
FROM BOOK
WHERE B_ID IN (SELECT B_ID
               FROM BOOK
			   GROUP BY B_ID
			   HAVING AVG(B_PRICE) < (SELECT AVG(B_PRICE)
								      FROM BOOK));


SELECT AVG(B_PRICE)
FROM BOOK;







--c)

SELECT B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE, P_ID
FROM BOOK
WHERE P_ID IN (SELECT P_ID
               FROM PUBLISHER
			   WHERE P_NAME = 'Harvard Publishing' OR P_NAME = 'Course Technology');







--d)

SELECT ROWNUM, B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
FROM (SELECT B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
      FROM BOOK
      ORDER BY B_PRICE DESC)
WHERE ROWNUM <= 3;





--e)

SELECT ROWNUM, B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
FROM (SELECT B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
      FROM BOOK
      ORDER BY B_PRICE)
WHERE ROWNUM <= 3;






--f)

SELECT ROWNUM, S_ID, COURSE_NO, GRADE, S_LAST, S_FIRST
FROM(SELECT E.S_ID, E.COURSE_NO, E.GRADE, S.S_LAST, S.S_FIRST
           FROM ENROLLMENT E, STUDENT S
		   WHERE E.S_ID = S.S_ID
           ORDER BY E.GRADE)
WHERE ROWNUM <= 5;






--g)

SELECT ROWNUM, S_ID, COURSE_NO, GRADE, S_LAST, S_FIRST
FROM(SELECT E.S_ID, E.COURSE_NO, E.GRADE, S.S_LAST, S.S_FIRST
           FROM ENROLLMENT E, STUDENT S
		   WHERE E.S_ID = S.S_ID
           ORDER BY E.GRADE DESC)
WHERE ROWNUM <= 5;





--h)

SELECT B_TITLE "Title", B_PRICE "Price"
FROM BOOK
WHERE B_TYPE = (SELECT B_TYPE
                FROM BOOK
				WHERE B_TITLE LIKE '%p%');





--i)

SELECT B_ID, B_AUTHOR, B_TITLE, B_ISBN, P_NAME
FROM BOOK, PUBLISHER
WHERE BOOK.P_ID = PUBLISHER.P_ID
AND B_TYPE IN (SELECT B_TYPE 
               FROM BOOK
			   WHERE B_TITLE LIKE '%in%');




			   
			   
--j)

CREATE TABLE BOOKMONTREALSHOP
AS
SELECT B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
FROM BOOK
WHERE B_TYPE IN (SELECT B_TYPE
                  FROM BOOK
				  WHERE B_TYPE = 'EX')
ORDER BY B_ID;


				  
SELECT * FROM BOOKMONTREALSHOP;






CREATE TABLE BOOKNEWYORKSHOP
AS
SELECT B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
FROM BOOK
WHERE B_TYPE IN (SELECT B_TYPE
                  FROM BOOK
				  WHERE B_TYPE = 'EX' OR B_TYPE = 'BG')
ORDER BY B_ID;
			
				
			
SELECT * FROM BOOKNEWYORKSHOP;






CREATE TABLE BOOKVANCOUVERSHOP
AS
SELECT B_ID, B_AUTHOR, B_TITLE, B_PRICE, B_TYPE
FROM BOOK
WHERE B_TYPE IN (SELECT B_TYPE
                  FROM BOOK
				  WHERE B_TYPE = 'EX' OR B_TYPE = 'MD')
ORDER BY B_ID;
			
				
			
SELECT * FROM BOOKVANCOUVERSHOP;





--k)

SELECT * FROM BOOKMONTREALSHOP
INTERSECT
SELECT * FROM BOOKNEWYORKSHOP
INTERSECT
SELECT * FROM BOOKVANCOUVERSHOP;





--l)

SELECT * FROM BOOKNEWYORKSHOP
MINUS
SELECT * FROM BOOKMONTREALSHOP
MINUS
SELECT * FROM BOOKVANCOUVERSHOP;





--m)

SELECT * FROM BOOKVANCOUVERSHOP
MINUS
SELECT * FROM BOOKMONTREALSHOP;






SPOOL OFF;