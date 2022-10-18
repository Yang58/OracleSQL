-- 1
select * from emp where ename like '%S';

--2
select empno, ename, job, sal, deptno from emp where job ='SALESMAN';

--3.1
select empno, ename, job, sal, deptno from emp where sal > 2000 and deptno in(20,30);
select empno, ename, job, sal, deptno from emp where sal > 2000 and deptno between 20 and 30;

--3.2
select empno, ename , job,sal,deptno from emp where sal > 2000 INTERSECT
select empno, ename , job,sal,deptno from emp where deptno in(20,30);

--4
select * from emp where sal <2000 or sal >3000;

--5 
select ename, empno, sal, deptno from emp where ename like '%E%' and sal not between 1000 and 2000 and deptno = 30; 

--6 
select * from emp where comm is null and job in('CLERK','MANAGER') and mgr is not null and ename not like '_L%';




