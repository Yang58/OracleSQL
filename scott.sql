-- DQL (질의어) : 데이터 조회할때 사용 

-- select 컬럼명 from 테이블명;
-- 전체 데이터 조회 
select empno,ename,job,mgr,hiredate,comm,sal,deptno from emp; 
select * from emp;


-- 부분컬럼 데이터 조회
select empno,ename,sal from emp;
select deptno from emp;


-- 중복 데이터 제거 
select DISTINCT deptno from emp;

select job from emp;
select DISTINCT job from emp;

-- 컬럼에 연산 가능 ( + , - , * , /  : 4가지만 제공 나머지 연산자는 없음) 컬럼을 대상으로 연산 
-- null 데이터는 연산할 수 없다. -> null 값과 기존 데이터를 연산하게되면 기존 데이터도 null값 으로 변경됨  
-- nvl (컬럼명 , null값일때 변경할 값 ) : null값이 들어있는 컬럼을 0으로 변경해서 연산 
-- 컬럼에 별칭을 사용할 수 있다.  as 별칭
select ename as 사원이름 ,sal as 월급 ,sal * 12 + nvl(comm,0)as 연봉 ,comm as 상여금 from emp;
select nvl(comm+1,5) from emp; 

-- 데이터 정렬 


-- 데이터 정렬 
-- order by 컬럼명(정렬 기준이 되는 값) asc / desc 
-- 오름차순은 생략가능 오름차순이 디폴트

select * from emp order by sal asc; -- 오름차순 정렬
select * from emp order by sal desc; -- 내림차순 정렬
select * from emp order by hiredate asc;

-- 조건 검색
-- select 컬럼명 from 테이블명 where 조건식;     <, >, =, !=, /, <>, <=, >=, and, or  
-- and  : 두가지 조건이 모두 참일때 참 
select * from emp where sal >= 3000;
select * from emp where deptno = 30 and job = 'SALESMAN' and empno = 7499; -- 문자열 비교할떄는 대소문자 구별 
-- 문자를 조건절에 사용할떄는 대소문자를 구별하고 반드시 ' ' 사용해야함 
select * from emp where ename = 'FORD'; -- where ename = 'ford' 대소문자 구별해서 사용 

--날짜를 조건절에 사용할떄도 ' ' 사용 
-- Ex) 80/12/20 -> 1980년 12월 20일 시 분 초 요일 등 날짜 정보에 포함되어있다.
select * from emp where hiredate < '1982/01/01';

-- or 는 두개이상의 조건중에 하나 이상이 참이면 출력 
select * from emp where deptno = 10 or sal >= 2000;

-- not  논리 부정 연산자 
select * from emp where not sal = 3000;
select * from emp where sal != 3000;

-- and or 범위 조건
select * from emp where sal >= 1000 and sal <= 3000;
select * from emp where sal <= 1000 or sal >= 3000;

-- between and :  and 조건식 간소화
select * from emp where sal >= 1000 and sal <= 3000;
select * from emp where sal between 1000 and 3000;

-- in : or 조건식 간소화
select * from emp where sal = 800 or sal = 3000 or sal = 5000;
select * from emp where sal in(800,3000,5000);


--like 연산자 : 값의 일부만 가지고 데이터를 조회한다.
-- 와이드 카드를 사용한다. ( % : 모든 문자를 대체한다. , _ : 한문자를 대체한다. ) 
select * from emp where ename = 'FORD';
select * from emp where ename like 'F%'; -- F 로 시작하는 모든 데이터 검색
select * from emp where ename like '%D'; -- D로 끝나는 모든 데이터 검색 
select * from emp where ename like '%R%'; -- 중간에 R 이 들어가는 모든 데이터 검색

select * from emp where ename like '___D'; -- 000D 이런 형식으로 되어있는 데이터 검색 

select * from emp where ename like 'S___%'; 

-- null 연산자 : null 값의 연산이나 비교가 필요할때 사용 
-- is null : null 데이터 조회 / is not null : null이 아닌 데이터 조회 
select * from emp where comm is null;
select * from emp where comm is not null;


-- 집합 연산자 : 합집합 , 교집합 , 차집합 
-- 집합 연산자를 사용하기 위해서는 두개의 select 문을 사용한다 , 컬럼의 개수가 동일해야한다. , 컬럼의 타입이 같아야한다. , 컬럼의 이름은 상관없다 .  
-- union : 합집합 
select empno , ename , sal , deptno from emp where deptno = 10 union
select empno , ename , sal , deptno from emp where deptno = 20;
 
select empno , ename , sal , deptno from emp where deptno = 10 union all -- 데이터가 중복시에는 하나만 출력하지만 union all을 사용하게 되면 모든 데이터를 보여준다. 
select empno , ename , sal , deptno from emp where deptno = 10;

-- minus : 차집합 
select empno , ename , sal , deptno from emp minus
select empno , ename , sal , deptno from emp where deptno = 10;

-- intersect : 교집합
select empno , ename , sal , deptno from emp intersect
select empno , ename , sal , deptno from emp where deptno = 10;



