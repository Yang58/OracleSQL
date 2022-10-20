-- Chater 6  
-- Q1 
select empno, rpad(substr(empno,1,2),4 ,'*') as MASKING_EMPNO , ename , rpad(substr(ename, 1,1),5,'*') as MASKIN_ENAME from emp where length(ename) between 5 and 5;

--Q2 
select empno , ename, sal , trunc(sal/21.5,2) as DAY_PAY , round(trunc(sal/21.5,2)/8,1) as TIME_PAY from emp;

--Q4 
select empno , ename ,decode(mgr , null ,'  ', mgr) as mgr , 
    decode(substr(mgr,1,2) , null ,'0000' , 75 , 5555 , 76 ,6666 , 77, 7777 , 78 , 8888 , mgr) as CHG_MGR
    from emp;
    
-- Chater8 

--Q1
select d.deptno , d.dname ,e.empno, e.ename ,e. sal 
from emp e inner join dept d
on e.sal > 2000 and d.deptno = e.deptno order by e.deptno;

-- Q1-1
select deptno , d.dname ,e.empno, e.ename ,e.sal 
from emp e inner join dept d
using(deptno) where sal > 2000;

--Q2 -- dname  ÀÌ ÷üÁü 
select e.deptno,trunc(avg(e.sal),0),max(e.sal) , min(e.sal) ,count(e.deptno)
from emp e group by deptno order by e.deptno ; 

--Q2-2
select deptno , d.dname , trunc(avg(sal),0), max(sal), min(sal), count(*)
from emp inner join dept d
using(deptno)
group by deptno, dname;

-- Q3
select d.deptno , d.dname , e.empno, e.ename , e.job , e.sal 
from emp e right outer join dept d
on e.deptno = d.deptno order by e.deptno , e.ename; 

--Q4 
select deptno , d.dname , e.empno , e.ename , e.mgr , e.sal ,e.deptno , s.losal ,s.hisal , s.grade, m.empno , m.ename  
from emp e 
left outer join emp m       on e.mgr = m.empno
full outer join dept d      on e.deptno = d.deptno 
full outer join salgrade s  on e.sal between s.losal and s.hisal
order by e.deptno , e.empno;

--Q4-4
select d.deptno , d.dname , e.empno , e.ename , e.mgr , e.sal ,e.deptno , s.losal ,s.hisal , s.grade, m.empno , m.ename 
from emp e 
right outer join dept d     on e.deptno = d.deptno
full outer join salgrade s  on e.sal between s.losal and s.hisal
left outer join emp m       on e.mgr = m.empno 
order by e.deptno , e.empno;