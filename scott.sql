
-- DQL (���Ǿ�) : ������ ��ȸ�Ҷ� ��� 

-- select �÷��� from ���̺��;
-- ��ü ������ ��ȸ 
select empno,ename,job,mgr,hiredate,comm,sal,deptno from emp; 
select * from emp;

-- �κ��÷� ������ ��ȸ
select empno,ename,sal from emp;
select deptno from emp;

-- �ߺ� ������ ���� 
select DISTINCT deptno from emp;

select job from emp;
select DISTINCT job from emp;

-- �÷��� ���� ���� ( + , - , * , /  : 4������ ���� ������ �����ڴ� ����) �÷��� ������� ���� 
-- null �����ʹ� ������ �� ����. -> null ���� ���� �����͸� �����ϰԵǸ� ���� �����͵� null�� ���� �����  
-- nvl (�÷��� , null���϶� ������ �� ) : null���� ����ִ� �÷��� 0���� �����ؼ� ���� 
-- �÷��� ��Ī�� ����� �� �ִ�.  as ��Ī
select ename as ����̸� ,sal as ���� ,sal * 12 + nvl(comm,0)as ���� ,comm as �󿩱� from emp;
select nvl(comm+1,5) from emp; 


--------------------------------------------------------------------------------------------------
-- ������ ���� 
-- order by �÷���(���� ������ �Ǵ� ��) asc / desc 
-- ���������� �������� ���������� ����Ʈ

select * from emp order by sal asc; -- �������� ����
select * from emp order by sal desc; -- �������� ����
select * from emp order by hiredate asc;

-- ���� �˻�
-- select �÷��� from ���̺�� where ���ǽ�;     <, >, =, !=, /, <>, <=, >=, and, or  
-- and  : �ΰ��� ������ ��� ���϶� �� 
select * from emp where sal >= 3000;
select * from emp where deptno = 30 and job = 'SALESMAN' and empno = 7499; -- ���ڿ� ���ҋ��� ��ҹ��� ���� 
-- ���ڸ� �������� ����ҋ��� ��ҹ��ڸ� �����ϰ� �ݵ�� ' ' ����ؾ��� 
select * from emp where ename = 'FORD'; -- where ename = 'ford' ��ҹ��� �����ؼ� ��� 

--��¥�� �������� ����ҋ��� ' ' ��� 
-- Ex) 80/12/20 -> 1980�� 12�� 20�� �� �� �� ���� �� ��¥ ������ ���ԵǾ��ִ�.
select * from emp where hiredate < '1982/01/01';

-- or �� �ΰ��̻��� �����߿� �ϳ� �̻��� ���̸� ��� 
select * from emp where deptno = 10 or sal >= 2000;

-- not  �� ���� ������ 
select * from emp where not sal = 3000;
select * from emp where sal != 3000;

-- and or ���� ����
select * from emp where sal >= 1000 and sal <= 3000;
select * from emp where sal <= 1000 or sal >= 3000;

-- between and :  and ���ǽ� ����ȭ
select * from emp where sal >= 1000 and sal <= 3000;
select * from emp where sal between 1000 and 3000;

-- in : or ���ǽ� ����ȭ
select * from emp where sal = 800 or sal = 3000 or sal = 5000;
select * from emp where sal in(800,3000,5000);


--like ������ : ���� �Ϻθ� ������ �����͸� ��ȸ�Ѵ�.
-- ���̵� ī�带 ����Ѵ�. ( % : ��� ���ڸ� ��ü�Ѵ�. , _ : �ѹ��ڸ� ��ü�Ѵ�. ) 
select * from emp where ename = 'FORD';
select * from emp where ename like 'F%'; -- F �� �����ϴ� ��� ������ �˻�
select * from emp where ename like '%D'; -- D�� ������ ��� ������ �˻� 
select * from emp where ename like '%R%'; -- �߰��� R �� ���� ��� ������ �˻�

select * from emp where ename like '___D'; -- 000D �̷� �������� �Ǿ��ִ� ������ �˻� 

select * from emp where ename like 'S___%'; 

-- null ������ : null ���� �����̳� �񱳰� �ʿ��Ҷ� ��� 
-- is null : null ������ ��ȸ / is not null : null�� �ƴ� ������ ��ȸ 
select * from emp where comm is null;
select * from emp where comm is not null;


--------------------------------------------------------------------------------------------------
-- ���� ������ : ������ , ������ , ������ 
-- ���� �����ڸ� ����ϱ� ���ؼ��� �ΰ��� select ���� ����Ѵ� , �÷��� ������ �����ؾ��Ѵ�. , �÷��� Ÿ���� ���ƾ��Ѵ�. , �÷��� �̸��� ������� .  
-- union : ������ 
select empno , ename , sal , deptno from emp where deptno = 10 union
select empno , ename , sal , deptno from emp where deptno = 20;
 
select empno , ename , sal , deptno from emp where deptno = 10 union all -- �����Ͱ� �ߺ��ÿ��� �ϳ��� ��������� union all�� ����ϰ� �Ǹ� ��� �����͸� �����ش�. 
select empno , ename , sal , deptno from emp where deptno = 10;

-- minus : ������ 
select empno , ename , sal , deptno from emp minus
select empno , ename , sal , deptno from emp where deptno = 10;

-- intersect : ������
select empno , ename , sal , deptno from emp intersect
select empno , ename , sal , deptno from emp where deptno = 10;



--------------------------------------------------------------------------------------------------
-- upper('���ڿ� or �÷���')  ��ȣ �� ���� �����͸� ��� �빮�ڷ� ��ȯ 
-- lower ('���ڿ� or �÷���') : ��ȣ �� �����͸� ��� �ҹ��ڷ� ��ȯ 
select 'Welcome',upper('Welcome'),lower('Welcome') from dual; 
select lower(ename),upper(ename) from emp;
select * from emp where ename = 'FORD'; --> select * from emp where lower(ename) = 'ford'

-- length : ���ڿ��� ���̸� ���� 
select ename,lengthB(ename) from emp;
select 'Welcome to Oracle',length('Welcome to Oracle') from dual;

-- substr ( '���ڿ�' , ���� ��ġ , ���� ���� )  : ���ڿ� �ڸ���  : ������ġ�� ������ ������ġ���� ������ ���ڱ��� ���� 
select 'Welcome to Oracle',substr('Welcome to Oracle', 5 , 8) from dual;
select 'Welcome to Oracle',substr('Welcome to Oracle', -5,8) from dual;

-- instr('���ڿ�' , 'ã�� ����' , ������ġ , ã�� ������ ���� ) : ���� ã�� 
select instr('Welcome to Oracle','o')from dual;
select instr('Welcome to Oracle','o',3)from dual;
select instr('Welcome to Oracle','e',3,2)as instr from dual;

-- replace( '���ڿ�', 'ã�� ���ڿ�' , ' �ٲ� ���ڿ� ' ) : ��ġ ���� 
select 'Welcome to Oracle',REPLACE('Welcome to Oracle','to','of') from dual;
-- lpad ('���ڿ�' , ������ Ȯ���� �� , '��ü ����' ) 
select 'oracle',lpad('oracle',10,'#'),rpad('oracle',3,'*'),rpad('oracle',10) from dual;
select rpad('990101-' ,14 ,'*') from dual;

-- concat : ���ڿ� ���� 
select concat(empno,ename), empno || '' || ename from emp;
select concat('bbb','dddd') from dual;

--------------------------------------------------------------------------------------------------
-- ���� �Լ� 
-- round (���� , �ڸ��� ) : �ݿø� �ڸ����� �������������� �Ҽ��� ù°�ڸ����� 
select  round(1234.5678),
        round(1234.5678,0),
        round(1234.5678,1),
        round(1234.5678,2),
        round(1234.5678,-1), -- (-4-3-2-1.1234) 
        round(1234.5678,-2),
        round(1234.5678,-3)
from dual;

-- trunc (���� , �ڸ��� ) : ������ �ڸ��� ���� ���� ������  �ڸ����� �������������� �Ҽ��� ù°�ڸ�����
select  trunc(1234.5678),
        trunc(1234.5678,0),
        trunc(1234.5678,1),
        trunc(1234.5678,2),
        trunc(1234.5678,3),
        trunc(1234.5678,-1),
        trunc(1234.5678,-2),
        trunc(1234.5678,-3)
from dual;


-- ceil : �ڽź��� ū ���� ����� ���� 
-- floor : �ڽź��� ���� ���� ����� ���� 
select ceil(3.14) , floor(3.14) , ceil(-3.14),  floor(-3.14)
from dual;

-- mod : ������ ���ϱ�
select mod(5,2), mod(10,4) from dual;

select * from emp where mod(empno,2) = 0;

--------------------------------------------------------------------------------------------------
--��¥ �Լ� 

select sysdate from dual; -- ���� ��¥ 
--          ����          ����
select sysdate -1 , sysdate +1 from dual ;
select sysdate -hiredate as �ٹ��ϼ� from emp;
select trunc((sysdate - hiredate) / 365 ) as �ټӳ�� from emp;


select sysdate, 
    round(sysdate, 'CC' ) as FORMAT_CC,     -- ���� 
    round(sysdate, 'YYYY') as FORMAT_YYYY,  -- �⵵
    round(sysdate, 'Q') as FORMAT_Q,        -- �б�
    round(sysdate, 'DDD') as FORMAT_DDD,    -- ��¥
    round(sysdate, 'HH') as FORMAT_HH       -- �ð� 
    from dual;

select sysdate, 
    trunc(sysdate, 'CC' ) as FORMAT_CC,
    trunc(sysdate, 'YYYY') as FORMAT_YYYY,
    trunc(sysdate, 'Q') as FORMAT_Q,
    trunc(sysdate, 'DDD') as FORMAT_DDD,
    trunc(sysdate, 'HH') as FORMAT_HH
    from dual;
    
    
--------------------------------------------------------------------------------------------------
-- �ڷ��� ��ȯ �Լ� 
-- TO_Char  : ���� �Ǵ� ��¥�� ���ڷ� ��ȯ, TO_Number: ���ڸ� ���ڷ� ��ȯ,  TO_DATE : ���ڸ� ��¥�� ��ȯ  

-- to_char : ��¥�� ���ڷ�
select sysdate, to_char(sysdate,'YYYY/MM/DD HH12:MI:SS') as ����ð� from dual;
select hiredate,to_char(hiredate,'YYYY/MM/DD HH12:MI:SS DAY')  from emp; 
--to_char : ���ڸ� ���ڷ�   L : ���� ������ ��Ÿ��  9 or 0 9 �� ���ڸ��� ä���������� 0�� ���ڸ��� 0���� ä���� 
select to_char(123456789,'L999,999,999') from dual;
select sal, to_char(sal,'L999,999') from emp;


--to_number : ���ڸ� ���ڷ� 
select '20000' - 10000 from dual;
select '20000' - '10000' from dual;
select '20,000' - '10,000' from dual; -- ���� X ����ȯ �ʿ�
select to_number('20,000','999,999') - to_number('5,000' , '999,999') from dual; 

-- to_date : ���ڸ� ��¥�� 
select to_date('20221019','YY-MM-DD') from dual;
select * from emp where hiredate < to_date('19820101','YY-MM-DD');
select to_date(hiredate,'YY/MM/DD') from emp ;

-- null ������ ó��  nvl(null, �ٲٰ���� ������)  
--                   -> nvl�� null �������� Ÿ�԰� ���� Ÿ������ ���� 
-- Ex) nvl (���� , ����)  //  nvl( ���� , ���� )

select ename,job,nvl(to_char(mgr,'9999'),'CEO') from emp where mgr is null; 
-- nvl2(comm, null �� �ƴҶ�  ,null �ϋ�) 
select comm, nvl2(comm,'O' ,'X') from emp;
select ename as �����,sal ,sal *12 +nvl(comm,0) as ���� ,comm from emp;

-- ���ǹ� �Լ�  decode() -> switch , case -> if �÷��ڿ� �÷�ó�� ��� 
--                        decode( ������ = ������ ,'���氪' �������� ����Ʈ���Է� ) �ܼ� ���Լ�
select ename,job,deptno , decode(deptno, 10 ,'AAA' ,20 , 'BBB' ,30,'CCC' ,'��Ÿ') as �μ��� from emp ;

-- case ������ �������� ���� ���� 
--  when ���ǽ�    then ���๮ 
--  else : when���� ������ �������� ���Ұ�� else ���� 
--  end as ��Ī

select ename,job,deptno,
    case
        when deptno = 10 then 'AAA'
        when deptno = 20 then 'BBB'
        when deptno = 30 then 'CCC'
        else '��Ÿ'
    end as �μ�
    from emp;

select ename,job,sal,
    case
        when sal between 3000 and 5000 then '�ӿ�'
        when sal >=2000 and sal < 3000 then '������'
        when sal >=500 and sal < 2000 then '���'
    else '��Ÿ' end as ���� from emp;
    
--------------------------------------------------------------------------------------------------
-- ������ �Լ� -> sum , avg , count , max , min 
-- �Ϲ� �÷��� ���� ��� �Ұ� (��ȸ �����Ͱ� �ٸ��⶧��), ũ�� �񱳰� ������ ��� Ÿ�Կ� ��밡��
 -- sum (�÷���) : �÷��� �����͸� ��� ���� ���� ��ȯ   
select sum(sal) from emp;
-- avg(�÷���) : �÷��� �������� ����� ��ȯ
select trunc(avg(sal),2) from emp;
-- count(�÷���) : ��ü ���ڵ��� ������ ��ȯ   : ī��Ʈ�� null �����ʹ� ���Ե�������! �����ؼ���� 
select count(*),count(comm) from emp;
-- max(�÷���)  : �÷��� �������� ���� ū ���� ��ȯ
-- min(�÷���)  : �÷��� �������� ���� ���� ���� ��ȯ 
select max(sal),min(sal) from emp;

-- Error : ��ȸ�� �������� ������ �ٸ� Miss Match 1��1 ������ �̷�������� 
select ename , max(sal) from emp ;
-- ��¥�� ��Һ񱳰� ������ 
select min(hiredate) from emp where deptno = 20 ;
select max(hiredate) from emp where deptno = 20 ;


--------------------------------------------------------------------------------------------------
-- GROUP BY �� 
--                                                  !!!!!!!!!!!!!!!!!!!!!!! ���� ���� !!!!!!!!!!!!!!!!!!!!!!!!!!
-- select �÷���  form ���̺�� where ���ǽ�(�׷��Լ� ��� �Ұ�)  group by ���� �÷���  having ���ǽ� (�׷��Լ� ��밡��) order by �÷��� ���Ĺ��(�� �������� �ۼ�) 
-- �÷� �� �������� ������ ���ƾ��Ѵ�  -- group by �� having�� ���ǹ��� ����Ǳ����� where�� ������ ���� ����ȴ�! 
select avg(sal) as d10 from emp where deptno = 10  union
select avg(sal) as d20 from emp where deptno = 20 union
select avg(sal) as d30 from emp where deptno = 30;

-- group by �Լ��� ����ؼ� ����ȭ 
select deptno,  avg(sal)  from emp group by deptno order by deptno asc;

select deptno, job , avg(sal) from emp group by deptno, job order by deptno , job desc;


--------------------------------------------------------------------------------------------------
--having ���ǽ� : group by�� ���� ���ǽ��� ���� 

select deptno , avg(sal) from emp group by deptno having avg(sal) > 2000;
-- group by �� having�� ���ǹ��� ����Ǳ����� where�� ������ ���� ����ȴ�! 
select deptno , trunc(avg(sal),0) from emp where deptno != 10 group by deptno having avg(sal) > 2000;



--------------------------------------------------------------------------------------------------
-- ����(Join) 
-- 2�� �̻��� ���̺��� �����͸� ��ȸ
-- from���� �ΰ� �̻��� ���̺��� �ۼ��Ѵ�. 
-- where�� ���� ������ �ۼ��Ѵ�.
-- cross join (where �� ���� ����)
-- equi join (where �������: =)
-- non equi join (where ����������: and , or )
-- self join  (where �ϳ��� ���̺��� ����Ѵ�. )

--� �񱳸� �ҋ� ��񱳰� �����ʴ� �����ʹ� �����ȴ� . �׷��� �ܺ� ����(out join�� ���) 
-- out join ( ��� �����Ǵ� �����͸� ���� ��ȸ�Ҽ��ִ�. )

select ename, job, emp.deptno, dept.dname, loc -- ���� ���̺� ���� �̸��� �÷��� ���� �� �տ� (���̺��.)�� �ٿ� ������ ��
from emp,dept
where emp.deptno = dept.deptno; -- ���� ���Ǳ���(�����)

select ename, job, e.deptno, d.dname, loc
from emp e,dept d  -- ���̺� ��Ī �ο�(��Ī�� �ο��ϸ� ���� ���̺� �̸��� ����� �� ���� - �����߻�) , (as�� �÷��� ��Ī �ο� ȥ�� no)
where e.deptno = d.deptno
and sal >= 3000;

select ename, sal, grade , losal, hisal 
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal<= s.hisal;

-- ���̺��� ������ and�� ���� join�Ҷ� ���̺��� �ϳ� �̻��� ���̺�� ���踦 �ξ���Ѵ� ������ ���踦 �ΰ��ִ� ���̺�� ���ǽ� �ۼ�  
-- 3���� ���̺��� �ʿ�                              emp , dept , salgrade  
select empno,ename,sal, d.deptno,dname,grade from emp e ,dept d , salgrade s
where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal;

-- self join
-- (�ϳ��� ���̺�ȿ� ����� �����Ͱ� 2�� ������ ���� ���̺��� �ι� ����ؾ��Ҷ�  
select e.empno, e.ename,e.mgr, m.ename ,m.empno from emp e, emp m --  �ݵ�� ���̺� ��Ī�� ��� 
where e.mgr = m.empno ;

select work.deptno, work.ename , friend.ename
from emp work , emp friend 
where work.deptno = friend.deptno 
and work.ename = 'SCOTT' 
and friend.ename != 'SCOTT';

--out join : where ���� �����Ǵ� �����Ͱ� ������ ���� �����͸� ��ȸ�ϱ� ���� // where ���� �����Ͱ� �ִ� ���̺��(+) 
select e.empno, e.ename,e.mgr, m.ename ,m.empno from emp e, emp m --  �ݵ�� ���̺� ��Ī�� ��� 
where e.mgr = m.empno(+); -- out join�� ��� ���  ( �����Ͱ� ���� ���̺��� (+)�� �ٿ� ��� 

select ename, sal, d.deptno ,d.dname from emp e , dept d
where e.deptno(+) = d.deptno;

--------------------------------------------------------------------------------------------------
-- ANSI - JOIN ( ǥ�� ���� ��� ) : ������ ���ι���� �ٸ� -> ���� ����� ����  
-- inner join : equal , non equal , self join  ǥ�� ���� 
-- outer join == ( (+) ) [ left or right or full ] outer join (���� �ϳ� �ݵ�� �ٿ����� ) 
-- cross join natural join �� ���� ������� ���� 

--                             (,) ��� inner join ���  (where) ��� on ���
select ename , sal ,dname , loc 
from emp inner join dept 
on emp.deptno = dept.deptno;
--using(deptno)  ==  on emp.deptno = dept.deptno on �� join���� where �� �Ϲ� ���� 

--using(deptno)  =  on emp.deptno = dept.deptno // on �� join���� where �� �߰����� ���� 
select ename , sal ,dname , loc 
from emp inner join dept 
using(deptno) -- �÷��� �̸��� ������ ��쿡�� ��밡�� 
where ename = 'SCOTT'; -- join���� �ܿ� �߰� ����  

-- self join -> ANSI-JOIN ��� 
select e.empno , e.ename , e.mgr , m.ename 
from emp e inner join emp m 
on e.mgr = m.empno;

select e.empno, e.ename ,e.sal , s.grade 
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

-- out join -> outer join 
-- �ڽ��� ���� �����Ų ����� ����ʹ�. 
select e.empno , e.ename   , e.mgr  ,m.ename 
from emp e left outer join emp m   -- �����Ͱ� �����ϴ� ���� ���̺� ���� ( join ���� )
 on e.mgr = m.empno
 order by m.mgr;

select e.empno , e.ename   , e.mgr  ,m.ename 
from emp e left outer join emp m   -- �����Ͱ� �����ϴ� ���� ���̺� ���� ( join ���� )
on m.mgr = e.empno;

select e.ename , e.job , m.ename , m.job
from emp e inner join emp m
on m.job = e.job; 

select e.* , m.*
from emp e left outer join emp m   -- �����Ͱ� �����ϴ� ���� ���̺� ���� ( join ���� )
on m.mgr = e.empno;

select e.deptno , e.ename   , e.mgr  ,m.deptno
from emp e left outer join emp m   -- �����Ͱ� �����ϴ� ���� ���̺� ���� ( join ���� )
on e.empno = m.mgr;



select e.empno , e.ename   , e.mgr, m.empno  ,m.ename 
from emp e right outer join emp m   -- �����Ͱ� �����ϴ� ���� ���̺� ���� ( join ���� )
on e.mgr = m.empno
order by e.empno;

select e.empno as �����ȣ, e.ename as �̸�  , e.mgr as ���, m.ename as ����̸�
from emp e right outer join emp m   -- �����Ͱ� �����ϴ� ���� ���̺� ���� ( join ���� )
on m.empno = e.mgr 
order by e.empno;


-- 3���� ���̺��� ����Ҷ� �Ƚ����� 
select empno,ename,sal, d.deptno,dname,grade
from emp e inner join dept d 
on e.deptno = d.deptno 
inner join salgrade s
on e.sal between s.losal and s.hisal;


select ename , sal , d.deptno, d.dname 
from emp e right outer join dept d
on e.deptno = d.deptno order by e.deptno;

--------------------------------------------------------------------------------------------------
-- ���� ���� 
-- select ���� ��ø�� ����������� �Ѵ�.  ��𼭵� ��ø ���� 
-- select (select * ) �Ϲ� ���� ����
-- from (select * ) �ζ��κ�
-- where (select * )��������  

select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;
-- �� ������ ��ġ�� ��������  
-- ������ �������� �� ������ ��� ���� / ������ �������� �⺻ ������ ��� �Ұ� (������ �Լ� ����)
--[  ���� ����                           (  ���� ����                                  ) ] 
select dname from dept where deptno = ( select deptno from emp where ename = 'SCOTT' );
select ename , sal from emp where sal = ( select max(sal) from emp );
select ename , deptno from emp where deptno = ( select deptno from dept where loc = 'DALLAS');
select ename , sal from emp where mgr = ( select empno from emp where ename = 'KING');

-- ������ �������� in( ) : ���������� �����Ͱ� ���������� ��� �� �ϳ��� ��ġ�� �����Ͱ� �ִٸ� true 
-- ����߿� �ϳ��� �����ϸ� �ȴ�. 
select * from emp where sal in(5000,3000,2850);
select * from emp where sal in 
    ( select max(sal) from emp group by deptno) ;
    
-- any( ), some( ) : ���������� ���ǽ��� �����ϴ� ���������� ����� �ϳ� �̻��̸� true 
-- any �� �ε�ȣ�� ���� ��� /   ����߿� ���� ���������� ũ�� �ȴ� 
select * from emp where sal < any 
    ( select max(sal) from emp group by deptno) 
    order by sal;
    select max(sal) from emp group by deptno;
select * from emp where sal > any 
    ( select max(sal) from emp group by deptno) 
    order by sal;


--all ( ) : ���������� ���ǽ��� ���������� ����� ��� �����ϸ� true 
-- ��� �߿� ���� ū �� ���� ũ�� �ȴ� .
select ename , sal , deptno
from emp where sal > all
    (select sal from emp where deptno = 30);
    
-- ���߿� �������� 
select * from emp where (deptno,sal) in ( select deptno , min(sal) from emp group by deptno);



--------------------------------------------------------------------------------------------------
-- DML ( ������ ���۾� ) : insert , update , delete 
-- insert : ���̺� ������ ���� 
-- Ex) insert into ���̺�� (�÷���,  ... ) values ( �� , ....) -> �÷��� ������ ���� ���� ������ Ÿ���� �����ؾ��Ѵ�. (�ۼ� ������� 1��1 ��Ī�Ǿ� ����)

create table dept_temp 
as select * from dept;

select * from dept_temp;

insert into dept_temp (deptno , dname , loc ) -- ������ ����
values ( 50,'DATABASE', 'SEOUL');

insert into dept_temp -- �÷� ���� ���� ( �����ϰԵǸ� ��� �÷��� �����͸� �����ϰڴٴ� �ǹ� ) 
values ( 70,'HTML', 'SEOUL');

insert into dept_temp (deptno , dname ) -- �÷��� 3���� ���̺� �����͸� 2���� �����ϰԵǸ� �� �÷����� �ڵ����� null�����Ͱ� ���Եȴ�. 
values ( 60,'JSP' );

insert into dept_temp  -- ������ ����
values ( 80,null, 'SEOUL');

--���̺� ���� 
create table emp_temp
as select * from emp
where 1 != 1;

select * from emp_temp;

-- ���̺� ���� 
drop table emp_temp;

insert into emp_temp(empno, ename,job,mgr,hiredate,sal ,comm ,deptno)
values (9999,'HONG','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno, ename,job,mgr,hiredate,sal ,comm ,deptno)
values (9999,'SIM','MANAGER',9999,sysdate,4000,null,30);

-- update : �÷� �� ������ ���� 
-- Ex) update ���̺�� set �÷��� = ��, �÷���2 = ��2 .... where ���ǽ� 
-- �������� ������� ������ �ش� �÷��� ��� ���� 

create table dept_temp2 as select * from dept;

select * from dept_temp2;

update dept_temp2 set loc = 'SEOUL2';

drop table dept_temp2;

update dept_temp2 set dname = 'DATABASE' , loc = 'SEOUL' where deptno = 40;


-- delete : ������ ���� 
-- Ex) delete from ���̺��  where ���ǽ� ( �������� ������� ������ ��� �����Ͱ� ������ ) 

drop table emp_temp2;
create table emp_temp2 as select * from emp;

select * from emp_temp2;
-- ��� ������ ���� 
delete from emp_temp2;

delete from emp_temp2 where ename = 'SCOTT';



--------------------------------------------------------------------------------------------------
--Ʈ������ ( Transaction Control Language) TCL : Ʈ������� �����ϱ� ���� ����ϴ� ��ɾ� -> 
-- ALL OR NOTHING ( �������� ��� ���� �Ǵ� ��� ��� ) 
-- commit : �������� ���� ( ���̺� ������ �ݿ� ) -                create ������ ����� ��ü�����Ҷ� �ڵ����� Ŀ�� �߻� 
-- rollback : ������ ���� ��� (���̺� �����͸� �������� ���� )     õ������, ���� ���۽��� ��Ȳ�� �������� �ڵ����� �ѹ� �߻� 
-- savepoint : 

drop table dept01;
create table dept01 as select * from dept;
select * from dept01;
-- ������ ������ �ƴ� !! ���������� �Ⱥ��̰� ó�� �ܺο��� ������������ �����Ͱ� ���� 
delete from dept01;
     commit;   -- Ŀ���� �ϰԵǸ� ������ ������ �̷���� 
--      |  
--      |         �ѹ��� �̷������ �� ( Ŀ���� ���� �������� �̵� ) 
--      |
     rollback; -- Ŀ���� �̷���� ���Ŀ��� �ѹ��� �������� 

-- Ʈ������� ���� ���� 
delete from dept01;      -- �ѹ� ���� ( Ŀ���Ŀ� �ܺ��� �����Ͱ� ������ ) 
truncate table dept01;   -- �ѹ� �Ұ� ( �ڵ����� �ܺο����� ������ ������ �̷���� ) : �������� ������ �������� / ������ ���ÿ� Ŀ���� �̷����  


--------------------------------------------------------------------------------------------------
--DDL ������ ���Ǿ� (Data Definition Language) : Table�� ������ ��� ��ü�� ���� , ���� , �����ϴ� ��ɾ� 
-- create : ���� 
-- alter  : ����
-- drop   : ���� 

--   create table ���̺� ��(  // ���̺��� ��ü 
--       �÷���1 Ÿ�� ,       // �÷��� �Ӽ�
--       �÷���2 Ÿ�� ,
--       �÷���3 Ÿ�� .... 
--   );

-- ���̺� ����� 
create table emp_ddl (
    empno number(4), -- ������ �ڸ��� 
    ename varchar2(10), -- ����Ʈ �� 
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2), -- 7�ڸ��� 5�ڸ��� ���� 2�ڸ��� �Ҽ� ǥ��
    comm number(7,2),
    deptno number(2)
);

select * from emp_ddl;

insert into emp_ddl values (9999,'HONG','MANAGER',1111,sysdate,2000,null,10);

create table dept_ddl as select * from dept; -- ���̺� ���� ( ���� �������� ���� ) ���

select * from dept_ddl;
create table dept_30 as select * from dept where deptno = 30;
select * from dept_30;

create table dept_m as select dname, loc from dept;
select * from dept_m;

create table dept_d as select * from dept 
where 1 != 1 ; -- ���̺��� ����(�÷���) �� �����ҋ� 

select * from dept_d;

-- ���̺��� ���� ( �÷��� ���� ���� ) 
-- 1. ���ο� �÷� �߰� 2. �÷��� �̸� ���� 3. �ڷ����� ���� , �÷��� ���� 
-- add ,              rename ,            modify ,        drop 
-- alter 
create table emp_alter as select * from emp;
select * from emp_alter;

-- 1. ���ο� �÷��� �߰� 
alter table emp_alter 
add address varchar2(100);

-- 2. �÷��� �̸� ����
alter table emp_alter
rename column address to addr;

-- 3. �ڷ����� ���� 
alter table emp_alter 
modify empno number(10); -- �ڷ����� ũ�⸦ ���̴� ���� �Ұ�! �ø��� �͸� ���� / ���� �ڷ����� ���浵 ���� 

-- 4. �÷��� ���� 
alter table emp_alter 
drop column addr;


-- ���̺��� �̸� ���� 
rename emp_alter to emp_rename;

-- ���̺� ���� 
drop table emp_rename;

select * from emp_rename;


--------------------------------------------------------------------------------------------------
-- ������ ���� 
desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;

--------------------------------------------------------------------------------------------------
-- index( �˻��ӵ��� ����ϱ����� ����ϴ� ��ü )
-- select  ������ �˻��ӵ��� ��� ��Ų��. 
-- ��ü ���ڵ��� 3% ~ 5% ������ �˻��Ҷ� ���� ���� 
-- index��ü�� �÷��� �����ؼ� ����Ѵ� 

-- create index [index-name] on [table-name] ( [column-name] ) ;  = > [ ] �̸� 

create table emp01 
as select * from emp;

select * from emp01;

insert into emp01 
select * from emp01;

insert into emp01(empno , ename) 
values ( 1111, 'bts');

select empno,ename from emp01 where ename ='bts';
-- �ε��� ��ü ���� 
create index idx_emp01_ename on emp01(ename);
-- �ε��� ��ü�� ���� 
drop index idx_emp01_ename;

drop table emp01;
select * from emp01;
-- ���̺� ���� �� ���� 
-- show recyclebin; -> �����뿡 ������ ���̺��� ������ �����ִ� 
-- flashback table ���̺�� to before drop; --> �����뿡 ������ ���̺� ���� 
-- purge recyclebin; -- > ������ ���� 
show recyclebin; 
flashback table emp01 to before drop; 


--------------------------------------------------------------------------------------------------
insert into emp values (1111 , 'aaa' , 'MANAGER' , 9999 , sysdate , 1000 , null , 50); -- ���Ἲ ���� 
-- ���� ���� ( ���Ἲ ) : �߸��� ���� �����ͷ� ���Ǵ� ���� �����ϴ°� 
-- not null     : null ���� ���ü� ���� .
-- unique       : ���� ���� ���� ���� ���ü� ���� . �ߺ� ���� �� null �����ʹ� �ߺ� ��� 
-- primary key  : not null �� unique �� Ư���� �Ѵ� ���� ��, ���̺�� �ϳ��� �����ִ�.  (�⺻ Ű)
-- foreign key  :   (�ܷ� Ű / ���� Ű) 1 : n  ���� / �θ� �÷� primary key - �ڽ� �÷� foreign key 
 --                 1. �θ�� �ڽ��� ���踦 ���� �ڽ��� ���̺� �÷��� �����Ѵ�
 --                 2. �θ� �� ���̺��� �÷��� primary key �Ǵ� nuique �� �����ؾ��Ѵ�. 
 --                 3. foreign key�� ������ �÷����� null �����͸� ����Ѵ� 
 
-- check        : ���̺� ������ ������ ���ǽ��� �����ϴ� �����͸� �Է��Ҽ� �ִ�. 
-- dafault      

-- constraint : ���� ���ǿ� ��Ī �ο� ( constraint emp02_empno_pk : ���̺��_ �÷���_ ���������� ���� )
-- ���� �߻��� ���� ���뿡 ��Ī�� ��µ�  
create table emp02 ( 
    empno number (4) constraint emp02_empno_pk primary key ,  
    ename varchar2(10) constraint emp02_ename_nn not null,
    job varchar2(9),
    deptno number(2)
);

insert into emp02 
values ( 1111, 'HONG', 'MANAMER' , 30);

insert into emp02 
values ( 2222, 'HONG', 'MANAMER' , 30);

insert into emp02 
values ( null, 'KIM', 'SALESMAN' , 20);

insert into emp02 
values ( 2222, 'OOG' , 'SALESMAN' , 20);

select * from emp02;

drop table emp02;

-- foreign key 
create table dept07( -- �θ����̺�
    deptno number(2) constraint dept07_deptno_pk primary key,
    dname varchar2(20)constraint dept07_dname_nn not null,
    loc varchar2(20) constraint dept07_loc_nn not null
);

create table emp03 ( -- �ڽ����̺�
    empno number(4) constraint emp03_empno_pk primary key,
    ename varchar2(9) constraint emp03_ename_nn not null,
    job varchar(9),
    deptno number(2) constraint emp03_deptno_fk references dept07(deptno)  -- foreign key ���� ���� ���� ��� 
);


-- ���������� �̿��� ������ ���� ( �θ� ���̺� ���� ������ ���� / ���̺� ������ �θ����̺� ���� ����  )
insert into dept07 
select * from dept;
select * from dept07;

insert into emp03 
select empno, ename , job , deptno 
from emp;
select * from emp03;

insert into emp03 values (1111 , 'HONG' , 'MANAGER' , 50); 


--check 
create table emp04(
    empno number(4) primary key,
    ename varchar(10) not null,
    sal number(7) constraint emp04_sal_ck check(sal between 500 and 5000),
    gender varchar(2) constraint emp04_gender_ck check(gender in ('M','F'))
);
select * from emp04;

insert into emp04
values ( 2222,'JO',202,'M');
insert into emp04
values ( 3333,'JO',2000,'A');


-- default :�����͸� ������ ��ĭ�̸� �ڵ����� �⺻������ ������ �����͸� �־��ش�. �� ���� null �� �����ؼ� ������ null �����Ͱ� ���Եȴ� 
create table dept08(
      deptno number(4) primary key,
      dname varchar2(10) not null,
      loc varchar(15) default 'SEOUL'
);

select * from dept08;

insert into dept08 (deptno, dname ,loc)
values( 30,'SALESMAN','BUSAN');

-- ���� ������ ���� ���
-- 1. �÷� ������ ���� ��� ( ������ ����ϴ� ��� ) 
-- 2. ���̺� ������ ���� ��� ( not null �� ����Ҽ� ����. �÷� ������ ��Ŀ����� ��� ���� )
--      2.1 ���̺� �ȿ��� �����ϴ� ���
--      2.2 alter ��ɾ� ��� ���

create table emp05( -- ���̺� ������ ���� ���� ���� 
    empno number(4),
    ename varchar2(20) constraint emp05_empno_nn not null,
    job varchar2(10),
    deptno number(20), 
    
    constraint emp05_empno_pk primary key(empno),
    constraint emp05_job_uk unique(job),
    constraint emp05_deptno_fk foreign key(deptno) references dept(deptno)
);

select * from emp05;

insert into emp05 
values( 1111 , 'HONG' , 'PERSIDENT' , '80');

-- ����Ű ( �⺻Ű�� �ΰ��� �÷��� ����ϴ� ���) 
-- ����Ű�� ���̺� ������ ������θ� ������ �� �ִ�. 

create table member(
    name varchar2(10),
    address varchar2(30),
    tel varchar2(10),
    
    constraint member_name_address_pk primary key ( name, address )
);


create table emp06 (
    empno number(4),
    ename varchar2(20),
    job varchar2(10),
    deptno number(20) 
);
select * from emp06;

-- ���̺� ���� �Ŀ��� ���������� ������ �� �ִ�. ( alter ��� ) 
alter table emp06 
add constraint emp06_empno_pk primary key(empno);

alter table emp06 
add constraint emp06_ename_fk foreign key(deptno) references dept(deptno);

-- not null �� ������ ���� ( null -> not null) add �� �ƴ� modify ���  
alter table emp06 
modify job constraint emp06_job_nn not null;

alter table emp06
modify ename constraint emp06_ename_nn not null;

-- ���� ���� ����  drop ���� ���� ��(constraint) or ���� ����(key name : ���� �������� ���� �� ��� ���̺� ���� ���������� ��� �����ȴ� ) 
alter table emp06 
drop constraint emp06_empno_pk;

select * from emp06;

-- �θ� ���̺�� �ڽ� ���̺��� ���� 
create table dept09( 
    deptno number(2),
    dname varchar(10),
    loc varchar2(15)
);
alter table dept09 
add constraint dept09_deptno_pk primary key(deptno);

insert into dept09
select * from dept;

create table emp09 (
    empno number(4),
    ename varchar2(20),
    job varchar2(10),
    deptno number(20) 
);
alter table emp09 
add constraint emp09_empno_pk primary key(empno);
alter table emp09
add constraint emp09_deptno_fk foreign key(deptno) references dept09(deptno);

insert into emp09 
select empno , ename , job , deptno from emp;


-- �ڽ� ���̺��� ������̹Ƿ� �θ� ���̺��� �����ʹ� ����� ���� ��� ���� ���� ��Ȱ��ȭ �� ���� �����ϴ�. 
delete from dept09 
where deptno = 10 ;

alter table dept09 
disable primary key cascade;  -- cascade : ���� ������ �Ǿ��ִ� ��� ���� ������ ��Ȱ��ȭ 

alter table dept09 
drop primary key cascade; -- cascade : �ڽ� ���̺��� foreign key �� ����� �θ� ���̺��� primary key �� �Բ� �����ȴ�  

select * from emp09 order by deptno;
select * from dept09;




--------------------------------------------------------------------------------------------------
-- �� : ���� ���̺� 
-- ��ü : table , index , view ( ��ü�� create�� ����� ���� ) 

-- view ���� 
-- create or replace view �����̺�� ( 1.alias )
-- as 
-- ��������(select) 
-- 2.with check option
-- 3.with read only 
-- 1, 2, 3 ���� ���� �������� �ʼ� 

create table dept_copy as
select * from dept;

create table emp_copy as
select * from emp;

alter table emp_copy 
add constraint empcopy_deptno_fk 
foreign key(deptno) references dept(deptno);

select * from emp_copy ;

create or replace view emp_view30 
as  
select empno , ename , mgr , deptno -- �信 ���� ������ ���� 
from emp_copy where deptno = 30; -- ���� ���� 

select * from emp_view30;

delete from emp_copy where empno = 2222;

insert into emp_view30 -- ���� ���̺� ������ ���� 
values (1111, 'HOHO', 7699 , 30);

insert into emp_view30 (empno, ename, mgr) 
values(3333,'hong' ,2000);

insert into emp_copy (empno, ename, mgr, deptno) -- ���� ���� ���� 
values(3334,'hong' ,2000 , 50 );

-- ��Ī�� �ο��ϰԵǸ� ������ �÷����� ����Ҽ� ����.
create or replace view emp_view(�����ȣ, ����� , ����ȣ , �μ���ȣ)
as select empno, ename, mgr, deptno from emp_copy;

select * from emp_view where �μ���ȣ = 20;

-- ���� �� 
create or replace view emp_dept_view 
as
select empno, ename , sal , e.deptno , dname , loc 
from emp e inner join dept d 
on e.deptno = d.deptno
order by e.empno desc , deptno;

select * from emp_dept_view;

create or replace view sal_view
as 
select d.dname , min(e.sal) as min_sal, max(e.sal) as max_sal 
from emp e right outer join dept d 
on e.deptno = d.deptno
group by d.dname;


select * from sal_view o;
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- option 
-- 1.with check option
create or replace view view_chk30
as
select empno , ename ,sal ,comm ,deptno
from emp_copy
where deptno = 30 with check option; -- ���� ������ �������� �÷��� �������� ���ϰ� �Ѵ�. 

select * from view_chk30;

update view_chk30 set deptno = 10; -- �並 �����ҋ� option�� �ɾ���� �÷��� �����Ҽ� ���� 


-- 2.with read only 
create or replace view view_read30
as
select empno , ename ,sal ,comm ,deptno
from emp_copy
where deptno = 30 with read only ; -- ��� �÷��� ���� ������ �Ұ����ϴ�(Create (insert)  Update  Delete �Ұ�) ���� �б�(��ȸ)�� ���� 

update view_read30 set deptno = 10 ;
select * from view_read30;

-- ���� Ȱ�� : TOP - N ��ȸ�ϱ�
-- ROWNUM ( �ǻ��÷� / sudo �÷�  : ���� ������ �÷��� �ƴ����� ����Ҽ� �ִ� �÷� ) 
-- Ư¡ : �������� ���� ���� �ݵ�� 1�� �����ϴ� ���ǽ��� �������Ѵ�. ( ���������� �Ҽ� ���� .) 
--        ��ȸ���� rownum�� �÷��� ��Ī�� ����� ���� �÷�ó�� ����Ҽ� �ִ�. ( ���� ���� ���� ) 
select * from emp;
-- �Ի����� ���� ������ 5���� ����� ��ȸ 
select * from emp order by hiredate asc;
select * from emp where hiredate <= '81/05/01'; -- �ܼ� �� ( ȿ������ ����� �ƴ� ) 

DESC emp;

select rownum, empno , ename , hiredate from emp
order by hiredate asc; -- rownum ��ȣ�� �ٰ� order by �� ������ �Ǳ⶧���� ��ȣ�� ���δ�

select rownum, empno , ename , hiredate 
from emp where rownum <= 5 
order by hiredate asc ;

-- �並 Ȱ���� ó������ �Ի��Ϸ� ���� �� rownum�� �̿��� ���� �� ��ȣ�� ������ �ֵ��� �� ���ִ�. 

create or replace view view_hire
as
select empno, ename , hiredate 
from emp where hiredate !=( select hiredate from emp where ename = 'SMITH') 
order by hiredate asc; 

-- �÷� ó�� ����ϱ� ���ؼ��� ��Ī�� �ο����־���Ѵ�. ��Ī�� ������� ������ ��ȸ�� / ��Ī�� ����ϰ� �Ǹ� ���� �÷� 
select rownum rm, v.* from view_hire v where rownum <= 4;

create or replace view view_hiredate_rm
as
select rownum rm , empno , ename , hiredate
from view_hire 
order by hiredate;

select * from view_hiredate_rm where rm between 2 and 7;

-- �ζ��� �� ( ��ȸ�� )
select rm , b.* 
from ( select rownum rm , a.*
    from ( select empno , ename ,hiredate from emp order by hiredate   ) a 
) b where rm between 2 and 5;

select empno , ename , hiredate 
from ( select rownum rm , a.* 
    from ( select empno , ename , hiredate from emp order by hiredate) a
) where rm <= 5;

select rownum , empno , ename , hiredate 
from (
    select empno , ename , hiredate 
    from emp 
    order by hiredate ) 
where rownum <= 5;

--------------------------------------------------------------------------------------------------

-- ������ 
-- �ڵ����� ��ȣ�� ������Ű�� ��� ���� create , drop

-- create sequence �������� ( �ɼ��� ������ �߿����� ���� ) 
-- start with : ���� �� ( �⺻ �� 1 ) 
-- increment by : ������ ( �⺻ �� 1 )
-- maxvalue : ���� �� �ִ밪 ( �⺻ �� 10�� 1027�� ) 
-- minvalue : ���� �� �ּҰ� ( �⺻ �� 10�� -1027�� )

-- ���� 
create sequence dept_deptno_seq
increment by 10 
start with 10;

-- ��� ���  
-- nextval : �����Ҷ����� �� ���� 
-- currval : ���� ���� Ȯ���ϴ� �뵵

select dept_deptno_seq.nextval
from dual;

select dept_deptno_seq.currval
from dual;

create sequence emp_seq 
start with 1
increment by 1 
maxvalue 1000;

drop table emp01;

create table emp01 
as
select empno , ename , hiredate from emp where 1 != 1;

select * from emp01;

insert into emp01
values ( emp_seq.nextval , 'HONG' ,sysdate );

create table product(
    pid varchar(10),
    pname varchar(10),
    price number(5),
    
    constraint product_pid_pk primary key(pid)
);

create sequence idx_product_id
start with 1000;

insert into product
values ('pid' || idx_product_id.nextval , 'mike' , 1000);

insert into product
values ('pid' || idx_product_id.nextval , 'ġ��' , 2000);

select * from product;
-- ������ ���� 
drop sequence idx_product_id;


-- �ٸ� ����ڿ��� ���� �ο�
-- grant [ ��ü ���� ���� ]
-- on  ��ü�� 
-- to ������ 
grant select  --, insert, update
on emp
to user01;
-- ���� ȸ�� 
revoke select
on emp
from user01;

----------------------------------------------------

grant select 
on emp
to mrole3;


--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------
-- PL/SQL (Ȯ��Ǿ��� SQL ���)
-- ���� , ���ǹ� ,�ݺ��� ��� 

-- ���� 
-- declare (���� ����)
-- begin ( SQL���� , ��¹� �ۼ�(�������� ���� ����� �ݵ�� ����Լ��� ���� Ȯ���ؾ��Ѵ�.)) 
-- exception( ����ó�� ���� ) 
-- end;
-- / 
-- set serveroutput on; - PL/SQL �ۼ� ���� �ݵ�� ���� ( ���� ����� ȭ�鿡 ��� ) 
set serveroutput on;

begin 
    dbms_output.put_line ('Hello world'); -- ��� �Լ� sysout 
end; 
/ 




declare 
    --vempno number(4); -- ������ ������ Ÿ�� / ������ ����
    --vename varchar2(10);
    
    -- ������ ����� �ʱ�ȭ ���ÿ� ���� 
    vempno constant number(4) := 7777; -- ( constant : ��� = fianl ������ ) ���� �Ұ� 
    vename varchar2(10) not null := 'SCOTT'; -- null ���� ������ ������ ����� �� ����. 
    
begin -- := ���Կ�����( ���� X)
    --vempno := 7777; -- ������ �ʱ�ȭ 
    --vename := 'SCOTT';
    -- ��¹� �ۼ� 
    dbms_output.put_line(' ��� / �̸� ');
    dbms_output.put_line(vempno || ' ' || vename);
end;
/



declare
    -- ��Į�� ���
    -- vempno number(2);
    -- ���۷��� ��� ( �ַ� ��� ) ���� ���̺��� �÷��� Ÿ���� �����Ѵ�
    vempno emp.empno%type := 7777; -- emp���̺� empno�� �÷��� Ÿ���� �����Ѵ� (%�� ������ �ǹ� ) 
    -- ���۷��� ����� ����ϴ� ������ ���� ���̺��� �����͸� ������ �����ؼ� ����ϱ� ���� 
    
begin
    -- vempno := 7777;
    dbms_output.put_line(' �����ȣ ');
    dbms_output.put_line(vempno);
end;
/




declare
    --���۷��� ��� 
    vempno emp.empno%type;
    vename emp.ename%type;
begin
    -- ��ȸ�� �����͸� �ݵ�� ������ �����ؼ� ����ؾ��Ѵ�. into �� ����� �����͸� ����. / ������� 1��1 ��Ī�Ǿ� �����. 
    -- �ݵ�� where ���� ����ؾ��Ѵ�. ������ �ϳ��� ���� ������ �ִµ� emp ���̺��� ������ ������ 14���̱⶧���� ���� �߻� 
    select empno, ename 
    into vempno, vename -- �ʼ� 
    from emp ; -- ORA-01422: ���� ������ �䱸�� �ͺ��� ���� ���� ���� �����մϴ� (where ���� ������ �߻��ϴ� ���� ) 
  --  where empno = 7788; -- �ʼ� 
    
    dbms_output.put_line(' �����ȣ / �̸�  ');
    dbms_output.put_line(vempno || ' ' || vename );
    
exception -- when (���� ����) then  ���� ���  // when other �� else�� ���� ���� 
    when too_many_rows then dbms_output.put_line('���� ���� �ʹ� �����ϴ�.');
    when others then dbms_output.put_line('��� ���� ó��'); 
end;
/

/* 
#  ������ ������ Ÿ���� �����ϴ� ��� 
1. ��Į�� ���    
    Ex)  vempno number(2); ( ������ ������ Ÿ��( ������ ũ��) ) 
    
2. ���۷��� ���   --  ���۷��� ����� ����ϴ� ������ ���� ���̺��� �����͸� ������ �����ؼ� ����ϱ� ���� 
    1. ������ emp.empno%type   (������ emp ���̺��� empno �� Ÿ���� ������ ) 
    2. ������ emp%rowtype ( ������ emp���̺��� ��� �÷��� �̸��� ������ Ÿ���� ������  ) 
    
#  ����� ���� ���� Ÿ�� ���� ���
1. ���̺� TYPE (�迭)    
    --  �迭�� ���� : ����� ���Ƿ� ������ Ÿ���� ���� 
    
    --  type ����������̸� is table of ������ Ÿ��(���۷��� ��� ��� ����) 
          type [ empno_table_type ] is table of [ emp.empno%type ] -> ���۷������ 
          index by binary_integer; -- �迭�� �����̱� ������ �ε��� ��ȣ�� �ο��� �迭�� �ε��������� �Ҽ� �ִ�. 
          
          
2. ���ڵ� TYPE (���� ����)
    --  �������� ������ ��� ����Ѵ�. : ����� ���� ���� Ÿ�� -> Ŭ������ ������
# ���ǹ� 
    if ( ���ǽ� )then
        ���๮ 
    end if;
    ------------------------------------------------------------------------------
    if ( ���ǽ� )then 
        ���๮
    else 
        ���๮ 
    end if; 
    ------------------------------------------------------------------------------
    if ( ���ǽ� )then elsif ( ���ǽ� ) then 
        ���๮ 
    end if; 
    ------------------------------------------------------------------------------
    
# �ݺ��� ( loop , while , for ) 
    loop  
    
        ( ���� �� : ���� �ݺ� )
        
        ���� �ݺ����� ����
        1. exit when ���ǽ�; 
        2. if then end if;
 
    end loop ;
    ------------------------------------------------------------------------------
    
    for n in 1 .. 10 loop  �ʱⰪ .. �ִ밪 1  �� ���� 1..10 : (10ȸ �ݺ�)  
            ���๮
    end loop;
    ------------------------------------------------------------------------------

    while ( ���ǽ� ) loop
        ���๮
    end loop;
*/

declare
    -- ���̺� Ÿ�� ( �迭�� ���� ) : ����� ���Ƿ� ������ Ÿ���� ���� 
    -- type ����������̸� is table of ������ Ÿ��(���۷��� ��� ��� ����) 
    type empno_table_type is table of emp.empno%type
    index by binary_integer;
    type ename_table_type is table of emp.ename%type
    index by binary_integer;
    type job_table_type is table of emp.job%type
    index by binary_integer;
    type mgr_table_type is table of emp.mgr%type
    index by binary_integer;
    type hire_table_type is table of emp.hiredate%type
    index by binary_integer;
    type sal_table_type is table of emp.sal%type
    index by binary_integer;
    type comm_table_type is table of emp.comm%type
    index by binary_integer;
    type deptno_table_type is table of emp.deptno%type
    index by binary_integer;
    
    empnoArr empno_table_type;
    enameArr ename_table_type ; -- �迭 ������ ���� ���� 
    jobArr job_table_type ;
    mgrArr mgr_table_type;
    hireArr hire_table_type;
    salArr sal_table_type;
    commArr comm_table_type;
    deptnoArr deptno_table_type;
    
    i binary_integer := 0 ; -- �ε����� ���� ���� ���� 
begin
    for k in ( select * from emp) loop 
        i := i+1; -- sql�� �ε����� ��ȣ�� 1������ ��� 
        empnoArr(i) := k.empno;
        enameArr(i) := k.ename;
        jobArr(i) := k.job;
        mgrArr(i) := k.mgr;
        hireArr(i) := k.hiredate;
        salArr(i) := k.sal;
        commArr(i) := k.comm;
        deptnoArr(i) := k.deptno;
    end loop;
    
    for j in 1..i loop
          dbms_output.put_line(empnoArr(j) || ' / ' || enameArr(j)
          || ' / ' || jobArr(j) || ' / ' || mgrArr(j)
          || ' / ' || hireArr(j) || ' / ' || salArr(j)
          || ' / ' || commArr(j) || ' / ' || deptnoArr(j));
    end loop;
end;
/



declare
    -- ���ڵ� Ÿ�� ( �������� ������ ��� ����Ѵ�.) : ����� ���� ���� Ÿ�� -> Ŭ������ ������
    type emp_record_type is record (
        v_empno emp.empno%type,
        v_ename emp.ename%type,
        v_job emp.job%type,
        v_deptno emp.deptno%type
    );
    emp_record emp_record_type; -- ���ڵ� Ÿ���� ���� ���� 
    
begin
    select empno , ename, job , deptno into emp_record
    from emp where empno = 7788;
    
    dbms_output.put_line(emp_record.v_empno || ' ' || emp_record.v_ename || ' '
    || emp_record.v_job || ' ' || emp_record.v_deptno);
    
end;
/

-- ���̺��� �̿��� ������ ���� insert
create table dept_record 
as
select * from dept;

select * from dept_record;


declare
    type rec_dept is record(
        v_deptno dept_record.deptno%type,
        v_dname dept_record.dname%type,
        v_loc dept_record.loc%type
    );
    dept_rec rec_dept;
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname := 'DEV';
    dept_rec.v_loc := 'BUSAN';
    
    insert into dept_record -- ���̺� �̸� 
    values dept_rec; -- ���� �� 
end;
/

-- ������ ���� update 
declare
    type rec_dept is record(
        v_deptno dept_record.deptno%type not null := 99 , -- �����͸� �����Ҷ� null�����Ͱ� ������ 9999�� �ʱ�ȭ 
        v_dname dept_record.dname%type ,
        v_loc dept_record.loc%type
    );
    
    dept_rec rec_dept;
begin
    dept_rec.v_deptno := 50;
    dept_rec.v_dname := 'UPD';
    dept_rec.v_loc :=  'SEOUL';
    
    update dept_record 
    set dname = dept_rec.v_dname , loc = dept_rec.v_loc
    where deptno = dept_rec.v_deptno;
end;
/

-- ������ ���� delete 
declare
    v_deptno dept_record.deptno%type := 50;
begin
    delete from dept_record 
    where deptno = v_deptno;
end;
/

declare 
    vempno number(4);
    vename varchar2(10);
    vdeptno number(10);
    vdname varchar2(10) := null ;
begin
    select empno , ename , deptno
    into vempno , vename , vdeptno 
    from emp 
    where empno = 7788;
    
   /* if ( ���ǽ� ) then 
        ���๮ 
    end if; */ 
    
    if ( vdeptno = 10 ) then 
        vdname := 'AAA';
    end if;
    if ( vdeptno = 20 ) then 
        vdname := 'BBB';
    end if;
    if ( vdeptno = 30 ) then 
        vdname := 'CCC';
    end if;
    if ( vdeptno = 40 ) then 
        vdname := 'DDD';
    end if;
    
    dbms_output.put_line( '�μ��� ' || ' : ' || vdname );
end;
/



declare 
    -- rowtype : ���̺��� ��� �÷��� �̸��� ������ �����Ѵ�
    -- �÷����� ���������� ���ǰ� �÷��� Ÿ���� ������ Ÿ������ ����Ѵ�.  ( ���� : ���̺� �̸�%rowtype ) 
    vemp emp%rowtype;
    
begin
    select *  
    into vemp from emp
    where empno = 7788;
    
    dbms_output.put_line(vemp.empno || '  ' || vemp.ename
    || '  ' || vemp.job|| '  ' || vemp.mgr
    || '  ' || vemp.hiredate|| '  ' || vemp.sal
    || '  ' || vemp.comm|| '  ' || vemp.deptno);
    
end;
/

select * from emp ;

 -- # ���ǹ� ( if , else , elsif ) 
declare 

    vemp emp%rowtype;
    annsal number(7,2);
    
begin
    dbms_output.put_line ( ' ���  /  �̸�  /  ���� ');
    dbms_output.put_line ( '----------------------- ');

    select *
    into vemp
    from emp
    where empno = 7788;
    -- �ش� ����� ������ ��� ��, Ŀ�̼��� null�ΰ�� 0���� ��� 
    if( vemp.comm is null ) then
        vemp.comm := 0;
    end if;
    annsal := vemp.sal *12 + vemp.comm;
    dbms_output.put_line(vemp.empno || '    ' || vemp.ename || '   ' || annsal);
end;
/

-- if else �� ����ϴ� ��� 
declare 
    vemp emp%rowtype;
    annsal number(7,2);
begin
    dbms_output.put_line ( ' ���  /  �̸�  /  ���� ');
    dbms_output.put_line ( '----------------------- ');

    select * into vemp
    from emp
    where empno = 7788;
    if( vemp.comm is null ) then
        annsal := vemp.sal * 12;
    else 
        annsal := vemp.sal * 12 + vemp.comm;
    end if;
    dbms_output.put_line(vemp.empno || '    ' || vemp.ename || '   ' || annsal);
end;
/


-- ���� if 
declare 
    vemp emp%rowtype;
    vdname varchar2(10);
begin
    select * into vemp
    from emp 
    where empno = 7788;
    
   /* if () then 
        elsif () then 
        elsif () then
        elsif () then ... */
        
    if (vemp.deptno = 10 ) then 
        vdname := 'AAA';
    elsif(vemp.deptno = 20 ) then
        vdname := 'BBB';
    elsif(vemp.deptno = 30 ) then
        vdname := 'CCC';
    elsif(vemp.deptno = 40 ) then
        vdname := 'DDD';
    end if;
    
    dbms_output.put_line(vdname);
end;
/

-- # �ݺ��� 

-- loop �� ( ���� Ż�� ������ �������־���� )
declare
    n number(10) :=1;
begin
    loop 
        dbms_output.put_line(n);
        n := n +1;
        exit when n > 10; --  ������ ���̸� ����   
    end loop;

end;
/

-- for ��  ( in ���� �ڿ� �ۼ��Ǵ� ���� �ݺ��� Ƚ���� �����Ѵ�. )  : ���� Ȱ�뵵�� ���� 
begin
--    for n in reverse 1..10 loop  --> ���ҽ�
    for n in 1 .. 10 loop           --> ������
        dbms_output.put_line(n);
    end loop ;
end;
/

-- �ݺ����� Ȱ�� ( ���̺��� ��ü ���ڵ� ��� ) 
declare
    vdept dept%rowtype;    
begin
    for n in 1.. 4 loop
        select *
        into vdept
        from dept
        where deptno = n*10;
        
        dbms_output.put_line(vdept.deptno || '  /  ' || vdept.dname || '  /  ' || vdept.loc);
        dbms_output.put_line('------------------------------------');
    end loop;
end;
/

-- while �� 
declare 
    n number(10) := 1;
begin
    while( n < 10 ) loop -- ������ ���϶� �ݺ� 
        n:= n+1;
        dbms_output.put_line( n );
    end loop;
end;
/


declare
    vdept dept%rowtype;    
    n number := 1;
begin
    while(n <= 4) loop
        select *
        into vdept
        from dept
        where deptno = n*10;
        n := n+1;
        dbms_output.put_line(vdept.deptno || '  /  ' || vdept.dname || '  /  ' || vdept.loc);
        dbms_output.put_line('------------------------------------');
    end loop;
end;
/

select 'ABCDEFG' , substr('ABCDEFG',3 , 2) from dual;

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
/*
-------���� �������α׷�----
    �ѹ������θ� �������� ��������
         1, ����(create)
         2, ����(execute or exec)

���� ���ν����� �Ű����� ����  : in , out , in out 
    in       : ���� ���޹޴� �뵵 
    out     : ���ν��� ������ ���� ����� ��û�� ������ ���� 
    in out :  in + out ����� ������ 
        
        ������ ������ Ÿ�� �տ� �ۼ� 

    * ���ν����� ���� 
    create or replace procedure ���ν�����(�Ű�����)

    is or as
         ���� ����
    begin
          SQL
         ��±���
         ���ǹ� , �ݺ���
    end;
     /
*/
create table emp01 -- ���̺��� ���� 
as
select * from emp;

create or replace procedure emp01_print -- ���ν��� ���� 
is
    vempno number(10); -- ���� ���� 
    vename varchar2(10);
begin
    vempno := 1111; -- ���� �ʱ�ȭ 
    vename := 'Hong';

    dbms_output.put_line(vempno || ' ' || vename); -- ��¹� 
end;
/
-- ���ν����� ����  
execute emp01_print; 

create or replace procedure emp01_del -- ���̺��� �����͸� �����ϴ� ���ν��� 
is
begin
    delete from emp01;
end;
/

exec emp01_del;

select * from emp01;

-- �Ű������� �޾Ƽ� ����ϴ� ���ν��� 
create or replace procedure del_ename(vename emp01.ename%type) 
is
    
begin
    delete from emp01
    where ename = vename;
end;
/
-- SCOTT�� �Ű������� �Ѱܼ� ���ν����� ���� -> begin ���� SCOTT�� �޾� delete ���� �����Ѵ�. 
exec del_ename('SCOTT'); 

select * from emp01;

create or replace procedure sel_empno  -- ���ν��� ���� 
(
    vempno in emp.empno%type, -- begin ������ ���� �ʱ�ȭ ���־�ߵ� 
    vename out emp.ename%type, -- begin ������ emp ���̺��� �÷��� ���� �޾ƿ� 
    vsal out emp.sal%type,
    vjob out emp.job%type
)
is  
    -- ���� ���� ���� 
    -- ������ out Ÿ������ ������ �����ϰԵǸ� �̰����� ������ ���� ���� �ʾƵ� �ȴ�. out���� ������ ������ �Ʒ��� �������� ��밡�� 
 
begin
    select ename , sal , job 
    into vename,vsal,vjob
    from emp 
    where empno = vempno;
end;
/

--  ���ε� ������ out Ÿ������ �޾ƿ� �����͸� ��Ī 
--  exec sel_empno(7499,���ε� ���� 1, ���ε� ���� 2 , ���ε� ���� 3 );
-- ���ε� �����϶� numberŸ���� ũ�⸦ �����ϸ� �ȵȴ�. Ÿ�Ը� ���� // ������ ������ Ÿ�Ժ��� ������ȵ� 
-- ���ε� ������ ����Ҷ��� �տ� : (�ݷ�) �� �ٿ����Ѵ�. 

variable var_ename varchar2(15);
variable var_sal number;
variable var_job varchar2(9);

exec sel_empno (7499 ,:var_ename,: var_sal ,: var_job);

-- print ��� �� 
print var_ename;
print var_sal;
print var_job;

drop table emp02;

-- ��� ������ �����ϴ� ���� ���ν��� ����� ( ���� ������ : ��� , �̸� , ��å , ��� , �μ� ) 
-- ��� ������ �Ű������� ����ؼ� �޾ƿ´� .
create table emp02
as
select empno , ename , job , mgr , deptno
from emp 
where 1 != 1;

create or replace procedure pro_emp02
(
    vempno in emp02.empno%type,
    vename in emp02.ename%type,
    vjob in emp02.job%type,
    vmgr in emp02.mgr%type,
    vdeptno in emp02.deptno%type
)
is 
begin
    
    insert into emp02
    values (vempno , vename , vjob, vmgr , vdeptno);
    
end;
/

exec pro_emp02( 1111,'JJJJ', 'HI' , 2222, 10);
select * from emp02;

-----------------------------------------------------------------
-- ���� �Լ� 
-- ���� �Լ��� ���� ���ν����� ������ : return ���� ���� 
-- ���� ���� 1. ����( create )   2. ���� (exec / execute ) 

/* ���� �Լ��� ���� 
    create or replace funcion �Լ���  ( �Ű����� ) 
        return ������ ���� Ÿ�� ( �����ݷ� ���� ) 
    is 
        ���� ���� 
    begin
    
        SQL / ��¹� / ���ǹ� ... 
    
        return ���� �� ; (�����ݷ� ���)     
    end; 
    /
*/

create or replace function cal_bouns (vempno emp.empno%type)
    return number
is
    vsal number(7,2);
begin
    select sal 
    into vsal 
    from emp 
    where empno = vempno ;
    
    return vsal * 200;
end;
/

-- �Լ��� ȣ���Ҷ� ���� ���� : exec ���� ���� ����  ������ �����ؾ��Ѵ�. 
-- exec ���ε� ���� :=  �Լ��� ( �Ű����� ) 
variable var_res number;
exec :var_res := cal_bouns(7788); 
print :var_res;

-- ���ν����� �Լ��� ���� 
-- drop procedure ���ν�����
-- drop function �Լ��� 

-----------------------------------------------------------------
/*  Ŀ��  : select ������ �����ϴ� ����� ����Ų��.
    declare 
        Ŀ�� : ���� select ������ ���� 
        cursor Ŀ���� is  SQL ����( select) ; 
    begin
        open Ŀ���� ;
        
        loop  / fectch ������ �ݺ����� �Բ� ��� 
            fectch Ŀ����  into ������ ; ���̺�� ���� ���� ������ ������ ���� ( �ѹ� ���� �� ���ڵ� �ϳ� ������ ) 
            exit when Ŀ����%notfound -- ���̻� Ŀ���� ����Ű�� ���� ���ٸ� ���� 
        end loop;
        
        close Ŀ����;
    end;
    /
*/

declare 
    cursor c1 is select * from emp;
    vemp emp%rowtype;
begin
    open c1;
    loop 
        fetch c1  into vemp;
        exit when c1%NOTFOUND;
        dbms_output.put_line(vemp.empno || '   ' || vemp.ename);  
    end loop;
    close c1;
end;
/

-- for �� �̿�  cursor  ����ȭ�Ͽ� ��� ���� 
declare 
    cursor c1 is select * from dept;
    vdept dept%rowtype ;
begin
    for vdept in c1 loop
        exit when c1%notfound;
        dbms_output.put_line(vdept.deptno || '   ' || vdept.dname || '   ' || vdept.loc );  
    end loop;
end;
/