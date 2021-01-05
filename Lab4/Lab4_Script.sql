--Lab4_Script.sql
--Name: Marissa Gonçalves
--Date: September 20, 2018


connect scott/tiger
set linesize 200
set pagesize 50
set echo on



--Question 1:


start "D:\Semester III\Database I\Labs\Lab4\Lab4\EditionScript.sql"

spool "D:\Semester III\Database I\Labs\Lab4\Lab4_Spool.txt"







--Question 2:



--a)

select b_id||', '||b_author||' has written '||b_title
from book;




--b)

select b_id, b_author, b_title, b_price
from book
where b_type = 'EX';




--c)

select *
from book
where b_price between 40 and 100;





--d)

select b_id, b_author, b_title, b_price
from book
where b_id in (2, 4, 6);


select b_id, b_author, b_title, b_price
from book
where b_id not in (2, 4, 6);




--e)

select b_id, b_author, b_title, b_price
from book
where b_title like'P%';




--f)

select *
from publisher
order by p_id desc;




--g)

select b_id as "BookID", sum(c_price) as "SUMOFPRICE"
from chapter
group by b_id
order by b_id asc;

select * from chapter;





--h)

select b_author as "Book Author", b_price as "Book Price"
from book
order by b_price asc;


select b_author as "Book Author", b_price as "Book Price"
from book
order by b_price desc;





--i)

select b_author as "Book Author", b_title as "Book Title", b_price as "Book Price"
from book
where b_price between 40 and 70
order by b_price desc;




--j)

select *
from publisher;




--k)

select b_id as "BookID", sum(c_price) as "SUMOFPRICE"
from chapter
where b_id between 1 and 5
group by b_id
order by b_id desc;

select * from chapter;





--l)

select b_author as "Book Author", b_price as "Book Price"
from book
where b_author like 'Paul%'
order by b_price asc;



select b_author as "Book Author", b_title as "Book Title"
from book
where b_title like '%Programming'
order by b_author asc;






--m)

select b_id as "BookID", sum(c_price) as "SUMOFPRICE", (sum(c_price)*1.21) as "Price With Taxes * 1.21"
from chapter
group by b_id
order by b_id desc;

select * from chapter;






--n)


select count(c_no) as "Number of Chapter"
from chapter
where b_id = 2;





spool off;


