--Lab6_Script.sql
--Name: Marissa Gonçalves
--Date: October 25, 2018


CONNECT scott/tiger;
SET LINESIZE 200;
SET PAGESIZE 50;
SET ECHO ON;



SPOOL "G:\Semester III\Database I\Labs\Lab6\Lab6_Spool.txt";




--Question 1:

START "G:\Marissa\PublicationScript.sql"



--Question 2:


--a)

ALTER TABLE book
ADD PublishDate DATE;



--b)

UPDATE book
SET PublishDate = TO_DATE ('13-07-1997', 'DD-MM-YY')
WHERE b_id = 1;

UPDATE book
SET PublishDate = TO_DATE ('06-01-2005', 'DD-MM-YY')
WHERE b_id = 2;

UPDATE book
SET PublishDate = TO_DATE ('31-05-2010', 'DD-MM-YY')
WHERE b_id = 3;

UPDATE book
SET PublishDate = TO_DATE ('16-10-2011', 'DD-MM-YY')
WHERE b_id = 4;

UPDATE book
SET PublishDate = TO_DATE ('17-07-1997', 'DD-MM-YY')
WHERE b_id = 5;

UPDATE book
SET PublishDate = TO_DATE ('24-09-2007', 'DD-MM-YY')
WHERE b_id = 6;


SELECT * FROM book;



--Question 3:



--a)

UPDATE book SET b_type = '&b_type'
WHERE b_id = &b_id;




--b)

UPDATE book SET b_isbn = '123-456'
WHERE b_id = &b_id;




--c)

UPDATE book SET b_price =
(CASE  WHEN b_type='BG' THEN b_price*1.1
      WHEN  b_type='MD' THEN b_price*1.2
      WHEN  b_type='EX' THEN b_price*1.3
      ELSE  b_price
END);


SELECT * FROM book;





--d)

SELECT b_id, UPPER(b_author), LOWER(b_title), INITCAP(b_title) 
FROM book;





--e)

SELECT p_name, p_address, p_id, LENGTH(p_name) AS "Length of Pub Name"
FROM publisher
ORDER BY LENGTH(p_name);




--f)

SELECT p_name, INSTR(p_name, ' ') AS "The Blank Position of P_Name", p_address, p_id	
FROM publisher
ORDER BY p_name;




--g)

COLUMN FirstNameFormat HEADING "Pub_N_Part1" FORMAT A20
COLUMN LastNameFormat HEADING "Pub_N_Part2" FORMAT A20
SELECT p_name, SUBSTR(p_name, 1, INSTR(p_name, ' ') - 1) AS FirstNameFormat, SUBSTR(p_name, INSTR(p_name, ' ') + 1) AS LastNameFormat, p_id
FROM publisher;




--h)

SELECT b_id, UPPER(b_author), INITCAP(b_title), CEIL(b_price)
FROM book
ORDER BY CEIL(b_price) DESC;





--i)

COLUMN FirstNameFormat HEADING "Author F_name" FORMAT A20
COLUMN LastNameFormat HEADING "Author L_name" FORMAT A20
SELECT b_id, SUBSTR(b_author, 1, INSTR(b_author, ' ') - 1) AS FirstNameFormat, SUBSTR(b_author, INSTR(b_author, ' ') + 1) AS LastNameFormat, b_type,
DECODE (b_type, 'BG', 'Book for Beginners',
        'EX', 'Book for Expert',
        'MD', 'Book for Intermediate') "Book Level"
FROM book;






--j)

COLUMN PriceFormat HEADING "bPFormat" FORMAT $999.999
SELECT b_id, b_author, b_title, b_price AS PriceFormat
FROM book;






--k)

COLUMN PriceFormat HEADING "New Price" FORMAT $999.999
SELECT b_id, b_author, b_title,
CASE  WHEN b_type='BG' THEN b_price - (b_price * 0.15)
      WHEN  b_type='MD' THEN b_price - (b_price * 0.25)
      WHEN  b_type='EX' THEN b_price - (b_price * 0.35)
      ELSE  b_price
END PriceFormat
FROM book;





--l)

COLUMN AveragePrice HEADING "Average BOOK Price" FORMAT 999.999999
SELECT MAX(b_price) AS "Maximum BOOK Price", MIN(b_price) AS "Minimum BOOK Price", AVG(b_price) AS AveragePrice
FROM book;






--m)

SELECT b_id AS "BookID", c_no AS "Nb. Chapters", SUM(c_price) AS "Sum of Price", SUM(c_price) * 1.05 AS "Sum of Price * 1.05"
FROM chapter
GROUP BY b_id, c_no
HAVING c_no >= 3
ORDER BY b_id DESC;





--n)

COLUMN DateFormat HEADING "Publishing Date Format" FORMAT A37
SELECT b_id, UPPER(b_author) AS "Author's Name", LOWER(b_title) AS "Title in Lower Case", TO_CHAR(PublishDate, 'DY, MONTH DD, YYYY HH:MI:SS A.M.') AS DateFormat
FROM book;






--o)

COLUMN DateFormat HEADING "Publishing Date Format" FORMAT A38
COLUMN PriceFormat HEADING "bPFormat" FORMAT $999.999
SELECT b_id, UPPER(b_author), INITCAP(b_title), b_price AS PriceFormat, TO_CHAR(PublishDate, 'DY, MONTH DD, YYYY HH:MI:SS A.M.') AS DateFormat
FROM book;





SPOOL OFF;