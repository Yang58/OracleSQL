-- 잊기 전에 한번더 

-- Chapter 4
-- Q1 . SELECT 문의 기본 구성 중 하나인 SELECT 절에는 조회할 열 또는 여러 열의 조합 , 연산식을 지정합니다. 
--      그리고 FROM 절에는 조회할 데이터가 지정된 테이블 이름을 명시합니다. 
--      이름이 너무 길다면 별도 이름을 지정할 수 있으며 , 이를 별칭이라고 합니다. 

-- Q2 
select DISTINCT job from emp; -- DISTINCT 열 중복 제거 

-- Q3 
select * from emp order by deptno desc , ename asc;


-- Chapter 5
--Q1
select * from emp where ename like '%S';
--Q2 
select empno , ename , job , sal , deptno from emp where deptno = 30 and job = 'SALESMAN';
--Q3
select empno , ename , job , sal , deptno  from emp where deptno in(20 ,30 ) and sal > 2000;
select empno , ename , job , sal , deptno  from emp where deptno = 20 and sal > 2000 
union select empno , ename , job , sal , deptno  from emp  where deptno = 30 and sal > 2000;
--Q4 
select * from emp where sal >= 2000 or sal <= 3000;
--Q5 
select * from emp where ename like '%E%' and deptno = 30 and sal not between 1000 and 2000;
--Q6 
select * from emp where mgr is not null and job in('MANAGER','CLERK') and ename not like '_L%'; 

-- Chapter 6  
-- Q1 
select empno, rpad(substr(empno,1,2),4 ,'*') as MASKING_EMPNO , ename , rpad(substr(ename, 1,1),5,'*') as MASKIN_ENAME from emp where length(ename) between 5 and 5;

--Q2 
select empno , ename, sal , trunc(sal/21.5,2) as DAY_PAY , round(trunc(sal/21.5,2)/8,1) as TIME_PAY from emp;

--Q3
select empno , ename , hiredate , to_char(next_day(add_months(hiredate,3),'월요일'), 'YYYY/MM/DD') as R_job,
nvl(to_char(comm),'N/A') as COMM from emp;

--Q4 
select empno , ename ,decode(mgr , null ,'  ', mgr) as mgr , 
    decode(substr(mgr,1,2) , null ,'0000' , 75 , 5555 , 76 ,6666 , 77, 7777 , 78 , 8888 , mgr) as CHG_MGR
    from emp;
    
-- Chapter 7
--Q1 
select deptno , trunc(avg(sal)) , max(sal) , min(sal)  from emp group by deptno;
--Q2 
select job , count(*) from emp group by job having count(*) >= 3;
--Q3 
select To_char(hiredate, 'YYYY' ) , deptno , count(*) from emp group by to_char(hiredate,'YYYY'), deptno order by deptno;
--Q4 
select nvl2(comm,'O','X') , count(*)  from emp group by nvl2(comm,'O','X');
--Q5 
select deptno , to_char(hiredate,'YYYY') , count(*) , max(sal) , sum(sal) ,trunc( avg(sal)) from emp 
--group by deptno , to_char(hiredate,'YYYY');
 group by rollup (deptno,to_char(hiredate,'YYYY'));
    
-- Chapter 8 

--Q1
select d.deptno , d.dname ,e.empno, e.ename ,e. sal 
from emp e inner join dept d
on e.sal > 2000 and d.deptno = e.deptno order by e.deptno;

-- Q1-1
select deptno , d.dname ,e.empno, e.ename ,e.sal 
from emp e inner join dept d
using(deptno) where sal > 2000;

--Q2 -- dname  이 빠짐 
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

-- Chapter 9
--Q1 ( 다시 )
select e.job , e.empno , e.ename , e.sal , e.deptno, d.dname 
from emp e inner join dept d 
on e.deptno = d.deptno 
where job = ( select job from emp where ename = 'ALLEN');

--Q2 ( 중복 데이터 제거 ) 
select e.empno , e.ename , d.dname , e.hiredate , d.loc , e.sal , s.grade 
from emp e , dept d , salgrade s 
where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal
and sal > ( select avg(sal) from emp )
order by e.sal desc , e.empno;
--Q3 
select e.empno , e.ename , e.job, e.deptno , d.dname , d.loc 
from emp e right outer join dept d
on e.deptno = 10
where e.deptno != ( select d.deptno from dept where e.deptno = 30 );

-- Chapter 10

-- Chapter 11

-- Charter 12 
select * from emp_hw;
-- 1 
create table emp_hw(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

-- 2 
alter table emp_hw 
add bigo varchar2(20);

-- 3
alter table emp_hw
modify bigo number(30);

-- 4 
alter table emp_hw
rename column bigo to remark;

-- 5 
insert into emp_hw(empno , ename , job , mgr , hiredate , sal , comm ,deptno )
    select * from emp;
-- 5.1
insert into emp_hw
    select empno , ename , job , mgr , hiredate , sal , comm ,deptno , null from emp;
-- 6
drop table emp_hw;


--Chapter 14
--Q1 
create table dept_const(
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13) 
);

alter table dept_const
add constraint dept_const_deptno_pk primary key(deptno);

alter table dept_const 
add constraint dept_const_dname_uk unique(dname);

alter table dept_const
modify loc constraint dept_const_loc_nn not null;

--Q2
create table emp_const(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    tel varchar2(20),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
);

alter table emp_const
add constraint emp_const_empno_pk primary key(empno);

alter table emp_const
modify ename constraint emp_const_ename_nn not null;

alter table emp_const
add constraint emp_const_tel_uk unique(tel);

alter table emp_const
add constraint emp_const_sal_ch check(sal between 1000 and 9999);

alter table emp_const 
add constraint emp_const_deptno_fk foreign key(deptno) references dept_const(deptno);

