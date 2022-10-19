-- Chater 6 Question 
-- Q1 
select empno, rpad(substr(empno,1,2),4 ,'*') as MASKING_EMPNO , ename , rpad(substr(ename, 1,1),5,'*') as MASKIN_ENAME from emp where length(ename) between 5 and 5;

--Q2 
select empno , ename, sal , trunc(sal/21.5,2) as DAY_PAY , round(trunc(sal/21.5,2)/8,1) as TIME_PAY from emp;

--Q4 
select empno , ename ,decode(mgr , null ,'  ', mgr) as mgr , 
    decode(substr(mgr,1,2) , null ,'0000' , 75 , 5555 , 76 ,6666 , 77, 7777 , 78 , 8888 , mgr) as CHG_MGR
    from emp;