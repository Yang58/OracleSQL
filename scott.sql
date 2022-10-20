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
select e.empno , e.ename , e.mgr , m.ename 
from emp e left outer join emp m   -- �����Ͱ� �����ϴ� ���� ���̺� ���� ( join ���� )
on e.mgr = m.empno;

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
