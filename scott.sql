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

-- ������ ���� 


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



