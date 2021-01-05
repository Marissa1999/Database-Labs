--Lab7_Script.sql
--Name: Marissa Gonçalves
--Date: October 25, 2018


CONNECT scott/tiger;
SET LINESIZE 160;
SET PAGESIZE 75;
SET ECHO ON;



--Activity 1:

SPOOL "G:\Semester III\Database I\Labs\Lab7\Lab7_Spool.txt";



--Activity 2:

START "G:\Marissa\EmployeesScript.sql"




--Activity 3:



--1:

SELECT POWER(2, 10)
FROM DUAL;



--2:

SELECT Lname, Fname, NVL(Commission, 0)
FROM EMPLOYEE
ORDER BY NVL(Commission, 0) DESC;




--3:

COLUMN SalaryFormat FORMAT $999,999
SELECT Lname||', '||Fname, Salary AS SalaryFormat
FROM EMPLOYEE
ORDER BY Salary DESC;




--4:

SELECT Lname, Fname, 
CASE  WHEN commission IS NULL THEN salary
      ELSE salary+commission
END "Salary/Commission"
FROM EMPLOYEE;





--5:

SELECT Lname, Fname, TO_CHAR(HireDate, 'YYYY')
FROM EMPLOYEE
ORDER BY TO_CHAR(HireDate, 'YYYY') ASC;





--6:

--a)

SELECT AVG(Commission)
FROM EMPLOYEE
WHERE Commission IS NOT NULL;


--b)

SELECT AVG(NVL(Commission, 0))
FROM EMPLOYEE;




--7:

COLUMN Years FORMAT 999
SELECT EmployeeId, Lname, Fname, FLOOR((SYSDATE - HireDate)/ 365) AS Years
FROM EMPLOYEE;




--8:

SELECT EmployeeId, COUNT(EmployeeId)
FROM DEPENDENT
GROUP BY EmployeeId
HAVING COUNT(EmployeeId) >= 2;




--9:

SELECT DeptId, AVG(Salary)
FROM EMPLOYEE
GROUP BY DeptId
HAVING AVG(Salary) >= 75000;




--10:

SELECT Lname, Fname, 
CASE  WHEN salary > 100000 THEN 'HIGH'
      WHEN salary >= 50000 AND salary <= 100000 THEN 'MEDIUM'
      WHEN salary < 50000 THEN 'LOW'
END "Salary Level"
FROM EMPLOYEE;






SPOOL OFF;