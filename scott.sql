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
select 'Welcome',upper('Welcome') from dual; 
select lower(ename),upper(ename) from emp;
select * from emp where ename = 'FORD'; --> select * from emp where lower(ename) = 'ford'

-- length : ���ڿ��� ���̸� ���� 
select ename,length(ename) from emp;
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
select 'oracle',lpad('oracle',10,'#'),rpad('oracle',10,'*'),rpad('oracle',10) from dual;
select rpad('990101-' ,14 ,'*') from dual;

-- concat : ���ڿ� ���� 
select concat(empno,ename), empno || '' || ename from emp;


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

