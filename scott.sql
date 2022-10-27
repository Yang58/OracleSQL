
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


--------------------------------------------------------------------------------------------------
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


--------------------------------------------------------------------------------------------------
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



--------------------------------------------------------------------------------------------------
-- upper('문자열 or 컬럼명')  괄호 안 문자 데이터를 모두 대문자로 변환 
-- lower ('문자열 or 컬럼명') : 괄호 안 데이터를 모두 소문자로 변환 
select 'Welcome',upper('Welcome'),lower('Welcome') from dual; 
select lower(ename),upper(ename) from emp;
select * from emp where ename = 'FORD'; --> select * from emp where lower(ename) = 'ford'

-- length : 문자열의 길이를 리턴 
select ename,lengthB(ename) from emp;
select 'Welcome to Oracle',length('Welcome to Oracle') from dual;

-- substr ( '문자열' , 시작 위치 , 추출 길이 )  : 문자열 자르기  : 시작위치만 적으면 시작위치부터 마지막 문자까지 추출 
select 'Welcome to Oracle',substr('Welcome to Oracle', 5 , 8) from dual;
select 'Welcome to Oracle',substr('Welcome to Oracle', -5,8) from dual;

-- instr('문자열' , '찾는 문자' , 시작위치 , 찾는 문자의 순서 ) : 문자 찾기 
select instr('Welcome to Oracle','o')from dual;
select instr('Welcome to Oracle','o',3)from dual;
select instr('Welcome to Oracle','e',3,2)as instr from dual;

-- replace( '문자열', '찾는 문자열' , ' 바꿀 문자열 ' ) : 위치 변경 
select 'Welcome to Oracle',REPLACE('Welcome to Oracle','to','of') from dual;
-- lpad ('문자열' , 공간을 확보할 수 , '대체 문자' ) 
select 'oracle',lpad('oracle',10,'#'),rpad('oracle',3,'*'),rpad('oracle',10) from dual;
select rpad('990101-' ,14 ,'*') from dual;

-- concat : 문자열 연결 
select concat(empno,ename), empno || '' || ename from emp;
select concat('bbb','dddd') from dual;

--------------------------------------------------------------------------------------------------
-- 숫자 함수 
-- round (숫자 , 자리수 ) : 반올림 자리수를 정해주지않으면 소수점 첫째자리까지 
select  round(1234.5678),
        round(1234.5678,0),
        round(1234.5678,1),
        round(1234.5678,2),
        round(1234.5678,-1), -- (-4-3-2-1.1234) 
        round(1234.5678,-2),
        round(1234.5678,-3)
from dual;

-- trunc (숫자 , 자리수 ) : 지정한 자리수 외의 숫자 버리기  자리수를 정해주지않으면 소수점 첫째자리까지
select  trunc(1234.5678),
        trunc(1234.5678,0),
        trunc(1234.5678,1),
        trunc(1234.5678,2),
        trunc(1234.5678,3),
        trunc(1234.5678,-1),
        trunc(1234.5678,-2),
        trunc(1234.5678,-3)
from dual;


-- ceil : 자신보다 큰 가장 가까운 정수 
-- floor : 자신보다 작은 가장 가까운 정수 
select ceil(3.14) , floor(3.14) , ceil(-3.14),  floor(-3.14)
from dual;

-- mod : 나머지 구하기
select mod(5,2), mod(10,4) from dual;

select * from emp where mod(empno,2) = 0;

--------------------------------------------------------------------------------------------------
--날짜 함수 

select sysdate from dual; -- 오늘 날짜 
--          어제          오늘
select sysdate -1 , sysdate +1 from dual ;
select sysdate -hiredate as 근무일수 from emp;
select trunc((sysdate - hiredate) / 365 ) as 근속년수 from emp;


select sysdate, 
    round(sysdate, 'CC' ) as FORMAT_CC,     -- 세기 
    round(sysdate, 'YYYY') as FORMAT_YYYY,  -- 년도
    round(sysdate, 'Q') as FORMAT_Q,        -- 분기
    round(sysdate, 'DDD') as FORMAT_DDD,    -- 날짜
    round(sysdate, 'HH') as FORMAT_HH       -- 시간 
    from dual;

select sysdate, 
    trunc(sysdate, 'CC' ) as FORMAT_CC,
    trunc(sysdate, 'YYYY') as FORMAT_YYYY,
    trunc(sysdate, 'Q') as FORMAT_Q,
    trunc(sysdate, 'DDD') as FORMAT_DDD,
    trunc(sysdate, 'HH') as FORMAT_HH
    from dual;
    
    
--------------------------------------------------------------------------------------------------
-- 자료형 변환 함수 
-- TO_Char  : 숫자 또는 날짜를 문자로 변환, TO_Number: 문자를 숫자로 변환,  TO_DATE : 문자를 날짜로 변환  

-- to_char : 날짜를 문자로
select sysdate, to_char(sysdate,'YYYY/MM/DD HH12:MI:SS') as 현재시간 from dual;
select hiredate,to_char(hiredate,'YYYY/MM/DD HH12:MI:SS DAY')  from emp; 
--to_char : 숫자를 문자로   L : 현재 국가를 나타냄  9 or 0 9 는 빈자리를 채워주지않음 0은 빈자리를 0으로 채워줌 
select to_char(123456789,'L999,999,999') from dual;
select sal, to_char(sal,'L999,999') from emp;


--to_number : 문자를 숫자로 
select '20000' - 10000 from dual;
select '20000' - '10000' from dual;
select '20,000' - '10,000' from dual; -- 실행 X 형변환 필요
select to_number('20,000','999,999') - to_number('5,000' , '999,999') from dual; 

-- to_date : 문자를 날짜로 
select to_date('20221019','YY-MM-DD') from dual;
select * from emp where hiredate < to_date('19820101','YY-MM-DD');
select to_date(hiredate,'YY/MM/DD') from emp ;

-- null 데이터 처리  nvl(null, 바꾸고싶은 데이터)  
--                   -> nvl은 null 데이터의 타입과 같은 타입으로 변경 
-- Ex) nvl (숫자 , 숫자)  //  nvl( 문자 , 문자 )

select ename,job,nvl(to_char(mgr,'9999'),'CEO') from emp where mgr is null; 
-- nvl2(comm, null 이 아닐때  ,null 일떄) 
select comm, nvl2(comm,'O' ,'X') from emp;
select ename as 사원명,sal ,sal *12 +nvl(comm,0) as 연봉 ,comm from emp;

-- 조건문 함수  decode() -> switch , case -> if 컬럼뒤에 컬럼처럼 사용 
--                        decode( 데이터 = 데이터 ,'변경값' 마지막에 디폴트값입력 ) 단순 비교함수
select ename,job,deptno , decode(deptno, 10 ,'AAA' ,20 , 'BBB' ,30,'CCC' ,'기타') as 부서명 from emp ;

-- case 범위를 조건으로 설정 가능 
--  when 조건식    then 실행문 
--  else : when에서 조건을 만족하지 못할경우 else 실행 
--  end as 별칭

select ename,job,deptno,
    case
        when deptno = 10 then 'AAA'
        when deptno = 20 then 'BBB'
        when deptno = 30 then 'CCC'
        else '기타'
    end as 부서
    from emp;

select ename,job,sal,
    case
        when sal between 3000 and 5000 then '임원'
        when sal >=2000 and sal < 3000 then '관리자'
        when sal >=500 and sal < 2000 then '사원'
    else '기타' end as 직급 from emp;
    
--------------------------------------------------------------------------------------------------
-- 다중행 함수 -> sum , avg , count , max , min 
-- 일반 컬럼과 같이 사용 불가 (조회 데이터가 다르기때문), 크기 비교가 가능한 모든 타입에 사용가능
 -- sum (컬럼명) : 컬럼내 데이터를 모두 더한 값을 반환   
select sum(sal) from emp;
-- avg(컬럼명) : 컬럼내 데이터의 평균을 반환
select trunc(avg(sal),2) from emp;
-- count(컬럼명) : 전체 레코드의 개수를 반환   : 카운트에 null 데이터는 포함되지않음! 주의해서사용 
select count(*),count(comm) from emp;
-- max(컬럼명)  : 컬럼내 데이터중 가장 큰 값을 반환
-- min(컬럼명)  : 컬럼내 데이터중 가장 작은 값을 반환 
select max(sal),min(sal) from emp;

-- Error : 조회할 데이터의 개수가 다름 Miss Match 1대1 연결이 이루어져야함 
select ename , max(sal) from emp ;
-- 날짜도 대소비교가 가능함 
select min(hiredate) from emp where deptno = 20 ;
select max(hiredate) from emp where deptno = 20 ;


--------------------------------------------------------------------------------------------------
-- GROUP BY 절 
--                                                  !!!!!!!!!!!!!!!!!!!!!!! 문법 순서 !!!!!!!!!!!!!!!!!!!!!!!!!!
-- select 컬럼명  form 테이블명 where 조건식(그룹함수 사용 불가)  group by 기준 컬럼명  having 조건식 (그룹함수 사용가능) order by 컬럼명 정렬방식(맨 마지막에 작성) 
-- 컬럼 속 데이터의 개수는 같아야한다  -- group by 와 having의 조건문이 실행되기전에 where의 조건이 먼저 실행된다! 
select avg(sal) as d10 from emp where deptno = 10  union
select avg(sal) as d20 from emp where deptno = 20 union
select avg(sal) as d30 from emp where deptno = 30;

-- group by 함수를 사용해서 간소화 
select deptno,  avg(sal)  from emp group by deptno order by deptno asc;

select deptno, job , avg(sal) from emp group by deptno, job order by deptno , job desc;


--------------------------------------------------------------------------------------------------
--having 조건식 : group by에 대한 조건식을 선언 

select deptno , avg(sal) from emp group by deptno having avg(sal) > 2000;
-- group by 와 having의 조건문이 실행되기전에 where의 조건이 먼저 실행된다! 
select deptno , trunc(avg(sal),0) from emp where deptno != 10 group by deptno having avg(sal) > 2000;



--------------------------------------------------------------------------------------------------
-- 조인(Join) 
-- 2개 이상의 테이블에서 데이터를 조회
-- from절에 두개 이상의 테이블을 작성한다. 
-- where에 조인 조건을 작성한다.
-- cross join (where 절 없이 조인)
-- equi join (where 등가연산자: =)
-- non equi join (where 범위연산자: and , or )
-- self join  (where 하나의 테이블을 사용한다. )

--등가 비교를 할떄 등가비교가 되지않는 데이터는 누락된다 . 그럴떄 외부 조인(out join을 사용) 
-- out join ( 등가시 누락되는 데이터를 같이 조회할수있다. )

select ename, job, emp.deptno, dept.dname, loc -- 양쪽 테이블에 같은 이름의 컬럼이 존재 시 앞에 (테이블명.)을 붙여 구분해 줌
from emp,dept
where emp.deptno = dept.deptno; -- 조인 조건구문(등가조인)

select ename, job, e.deptno, d.dname, loc
from emp e,dept d  -- 테이블에 별칭 부여(별칭을 부여하면 원래 테이블 이름을 사용할 수 없다 - 오류발생) , (as는 컬럼에 별칭 부여 혼동 no)
where e.deptno = d.deptno
and sal >= 3000;

select ename, sal, grade , losal, hisal 
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
--where e.sal >= s.losal and e.sal<= s.hisal;

-- 테이블의 조건은 and로 연결 join할때 테이블은 하나 이상의 테이블과 관계를 맺어야한다 조건은 관계를 맺고있는 테이블당 조건식 작성  
-- 3개의 테이블이 필요                              emp , dept , salgrade  
select empno,ename,sal, d.deptno,dname,grade from emp e ,dept d , salgrade s
where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal;

-- self join
-- (하나의 테이블안에 사용할 데이터가 2번 있을때 같은 테이블을 두번 사용해야할때  
select e.empno, e.ename,e.mgr, m.ename ,m.empno from emp e, emp m --  반드시 테이블 별칭을 사용 
where e.mgr = m.empno ;

select work.deptno, work.ename , friend.ename
from emp work , emp friend 
where work.deptno = friend.deptno 
and work.ename = 'SCOTT' 
and friend.ename != 'SCOTT';

--out join : where 절에 누락되는 데이터가 있을때 누락 데이터를 조회하기 위해 // where 누락 데이터가 있는 테이블명(+) 
select e.empno, e.ename,e.mgr, m.ename ,m.empno from emp e, emp m --  반드시 테이블 별칭을 사용 
where e.mgr = m.empno(+); -- out join의 사용 방법  ( 데이터가 없는 테이블의 (+)를 붙여 사용 

select ename, sal, d.deptno ,d.dname from emp e , dept d
where e.deptno(+) = d.deptno;

--------------------------------------------------------------------------------------------------
-- ANSI - JOIN ( 표준 조인 방식 ) : 툴마다 조인방식이 다름 -> 조인 방식을 통일  
-- inner join : equal , non equal , self join  표현 가능 
-- outer join == ( (+) ) [ left or right or full ] outer join (셋중 하나 반드시 붙여야함 ) 
-- cross join natural join 은 거의 사용하지 않음 

--                             (,) 대신 inner join 사용  (where) 대신 on 사용
select ename , sal ,dname , loc 
from emp inner join dept 
on emp.deptno = dept.deptno;
--using(deptno)  ==  on emp.deptno = dept.deptno on 은 join조건 where 은 일반 조건 

--using(deptno)  =  on emp.deptno = dept.deptno // on 은 join조건 where 은 추가적인 조건 
select ename , sal ,dname , loc 
from emp inner join dept 
using(deptno) -- 컬럼의 이름이 동일한 경우에만 사용가능 
where ename = 'SCOTT'; -- join조건 외에 추가 조건  

-- self join -> ANSI-JOIN 방식 
select e.empno , e.ename , e.mgr , m.ename 
from emp e inner join emp m 
on e.mgr = m.empno;

select e.empno, e.ename ,e.sal , s.grade 
from emp e inner join salgrade s
on e.sal between s.losal and s.hisal;

-- out join -> outer join 
-- 자신의 상사와 연결시킨 결과를 보고싶다. 
select e.empno , e.ename   , e.mgr  ,m.ename 
from emp e left outer join emp m   -- 데이터가 존재하는 쪽의 테이블 방향 ( join 기준 )
 on e.mgr = m.empno
 order by m.mgr;

select e.empno , e.ename   , e.mgr  ,m.ename 
from emp e left outer join emp m   -- 데이터가 존재하는 쪽의 테이블 방향 ( join 기준 )
on m.mgr = e.empno;

select e.ename , e.job , m.ename , m.job
from emp e inner join emp m
on m.job = e.job; 

select e.* , m.*
from emp e left outer join emp m   -- 데이터가 존재하는 쪽의 테이블 방향 ( join 기준 )
on m.mgr = e.empno;

select e.deptno , e.ename   , e.mgr  ,m.deptno
from emp e left outer join emp m   -- 데이터가 존재하는 쪽의 테이블 방향 ( join 기준 )
on e.empno = m.mgr;



select e.empno , e.ename   , e.mgr, m.empno  ,m.ename 
from emp e right outer join emp m   -- 데이터가 존재하는 쪽의 테이블 방향 ( join 기준 )
on e.mgr = m.empno
order by e.empno;

select e.empno as 사원번호, e.ename as 이름  , e.mgr as 상사, m.ename as 상사이름
from emp e right outer join emp m   -- 데이터가 존재하는 쪽의 테이블 방향 ( join 기준 )
on m.empno = e.mgr 
order by e.empno;


-- 3개의 테이블을 사용할때 안시조인 
select empno,ename,sal, d.deptno,dname,grade
from emp e inner join dept d 
on e.deptno = d.deptno 
inner join salgrade s
on e.sal between s.losal and s.hisal;


select ename , sal , d.deptno, d.dname 
from emp e right outer join dept d
on e.deptno = d.deptno order by e.deptno;

--------------------------------------------------------------------------------------------------
-- 서브 쿼리 
-- select 문의 중첩을 서브쿼리라고 한다.  어디서든 중첩 가능 
-- select (select * ) 일반 서브 쿼리
-- from (select * ) 인라인뷰
-- where (select * )서브쿼리  

select deptno from emp where ename = 'SCOTT';
select dname from dept where deptno = 20;
-- 두 문장을 합치면 서브쿼리  
-- 단일행 서브쿼리 비교 연산자 사용 가능 / 다중행 서브쿼리 기본 연산자 사용 불가 (연산자 함수 제공)
--[  메인 쿼리                           (  서브 쿼리                                  ) ] 
select dname from dept where deptno = ( select deptno from emp where ename = 'SCOTT' );
select ename , sal from emp where sal = ( select max(sal) from emp );
select ename , deptno from emp where deptno = ( select deptno from dept where loc = 'DALLAS');
select ename , sal from emp where mgr = ( select empno from emp where ename = 'KING');

-- 다중행 서브쿼리 in( ) : 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있다면 true 
-- 결과중에 하나만 만족하면 된다. 
select * from emp where sal in(5000,3000,2850);
select * from emp where sal in 
    ( select max(sal) from emp group by deptno) ;
    
-- any( ), some( ) : 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true 
-- any 는 부등호와 같이 사용 /   결과중에 가장 작은값보다 크면 된다 
select * from emp where sal < any 
    ( select max(sal) from emp group by deptno) 
    order by sal;
    select max(sal) from emp group by deptno;
select * from emp where sal > any 
    ( select max(sal) from emp group by deptno) 
    order by sal;


--all ( ) : 메인쿼리의 조건식을 서브쿼리의 결과가 모두 만족하면 true 
-- 결과 중에 가장 큰 값 보다 크면 된다 .
select ename , sal , deptno
from emp where sal > all
    (select sal from emp where deptno = 30);
    
-- 다중열 서브쿼리 
select * from emp where (deptno,sal) in ( select deptno , min(sal) from emp group by deptno);



--------------------------------------------------------------------------------------------------
-- DML ( 데이터 조작어 ) : insert , update , delete 
-- insert : 테이블에 데이터 삽입 
-- Ex) insert into 테이블명 (컬럼명,  ... ) values ( 값 , ....) -> 컬럼의 개수와 값의 개수 데이터 타입이 동일해야한다. (작성 순서대로 1대1 매칭되어 저장)

create table dept_temp 
as select * from dept;

select * from dept_temp;

insert into dept_temp (deptno , dname , loc ) -- 데이터 삽입
values ( 50,'DATABASE', 'SEOUL');

insert into dept_temp -- 컬럼 생략 가능 ( 생략하게되면 모든 컬럼에 데이터를 저장하겠다는 의미 ) 
values ( 70,'HTML', 'SEOUL');

insert into dept_temp (deptno , dname ) -- 컬럼이 3개인 테이블에 데이터를 2개만 삽입하게되면 빈 컬럼에는 자동으로 null데이터가 삽입된다. 
values ( 60,'JSP' );

insert into dept_temp  -- 데이터 삽입
values ( 80,null, 'SEOUL');

--테이블 생성 
create table emp_temp
as select * from emp
where 1 != 1;

select * from emp_temp;

-- 테이블 삭제 
drop table emp_temp;

insert into emp_temp(empno, ename,job,mgr,hiredate,sal ,comm ,deptno)
values (9999,'HONG','PRESIDENT',NULL,'2001/01/01',5000,1000,10);

insert into emp_temp(empno, ename,job,mgr,hiredate,sal ,comm ,deptno)
values (9999,'SIM','MANAGER',9999,sysdate,4000,null,30);

-- update : 컬럼 내 데이터 수정 
-- Ex) update 테이블명 set 컬럼명 = 값, 컬럼명2 = 값2 .... where 조건식 
-- 조건절을 사용하지 않으면 해당 컬럼이 모두 변경 

create table dept_temp2 as select * from dept;

select * from dept_temp2;

update dept_temp2 set loc = 'SEOUL2';

drop table dept_temp2;

update dept_temp2 set dname = 'DATABASE' , loc = 'SEOUL' where deptno = 40;


-- delete : 데이터 삭제 
-- Ex) delete from 테이블명  where 조건식 ( 조건절을 사용하지 않으면 모든 데이터가 삭제됨 ) 

drop table emp_temp2;
create table emp_temp2 as select * from emp;

select * from emp_temp2;
-- 모든 데이터 삭제 
delete from emp_temp2;

delete from emp_temp2 where ename = 'SCOTT';



--------------------------------------------------------------------------------------------------
--트렌젝션 ( Transaction Control Language) TCL : 트랜잭션을 제어하기 위해 사용하는 명령어 -> 
-- ALL OR NOTHING ( 데이터의 모두 실행 또는 모두 취소 ) 
-- commit : 데이터의 실행 ( 테이블에 데이터 반영 ) -                create 구문을 사용해 객체생성할때 자동으로 커밋 발생 
-- rollback : 데이터 변경 취소 (테이블에 데이터를 저장하지 않음 )     천재지변, 전기 갑작스런 상황이 생겼을때 자동으로 롤백 발생 
-- savepoint : 

drop table dept01;
create table dept01 as select * from dept;
select * from dept01;
-- 완전한 삭제는 아님 !! 내부적으로 안보이게 처리 외부에서 접속했을때는 데이터가 보임 
delete from dept01;
     commit;   -- 커밋을 하게되면 완전한 삭제가 이루어짐 
--      |  
--      |         롤백이 이루어지는 곳 ( 커밋의 시작 지점으로 이동 ) 
--      |
     rollback; -- 커밋이 이루어진 이후에는 롤백이 되지않음 

-- 트랜잭션의 적용 유무 
delete from dept01;      -- 롤백 가능 ( 커밋후에 외부의 데이터가 삭제됨 ) 
truncate table dept01;   -- 롤백 불가 ( 자동으로 외부에서도 데이터 삭제가 이루어짐 ) : 데이터의 완전한 영구삭제 / 삭제와 동시에 커밋이 이루어짐  


--------------------------------------------------------------------------------------------------
--DDL 테이터 정의어 (Data Definition Language) : Table을 포함한 모든 객체를 생성 , 삭제 , 변경하는 명령어 
-- create : 생성 
-- alter  : 변경
-- drop   : 삭제 

--   create table 테이블 명(  // 테이블은 객체 
--       컬럼명1 타입 ,       // 컬럼은 속성
--       컬럼명2 타입 ,
--       컬럼명3 타입 .... 
--   );

-- 테이블 만들기 
create table emp_ddl (
    empno number(4), -- 숫자의 자리수 
    ename varchar2(10), -- 바이트 수 
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2), -- 7자리중 5자리는 정수 2자리는 소수 표현
    comm number(7,2),
    deptno number(2)
);

select * from emp_ddl;

insert into emp_ddl values (9999,'HONG','MANAGER',1111,sysdate,2000,null,10);

create table dept_ddl as select * from dept; -- 테이블 복사 ( 기존 데이터의 보존 ) 백업

select * from dept_ddl;
create table dept_30 as select * from dept where deptno = 30;
select * from dept_30;

create table dept_m as select dname, loc from dept;
select * from dept_m;

create table dept_d as select * from dept 
where 1 != 1 ; -- 테이블의 구조(컬럼명) 만 복사할떄 

select * from dept_d;

-- 테이블의 변경 ( 컬럼의 정보 수정 ) 
-- 1. 새로운 컬럼 추가 2. 컬럼의 이름 변경 3. 자료형의 변경 , 컬럼의 삭제 
-- add ,              rename ,            modify ,        drop 
-- alter 
create table emp_alter as select * from emp;
select * from emp_alter;

-- 1. 새로운 컬럼의 추가 
alter table emp_alter 
add address varchar2(100);

-- 2. 컬럼의 이름 변경
alter table emp_alter
rename column address to addr;

-- 3. 자료형의 변경 
alter table emp_alter 
modify empno number(10); -- 자료형의 크기를 줄이는 것은 불가! 늘리는 것만 가능 / 기존 자료형의 변경도 가능 

-- 4. 컬럼의 삭제 
alter table emp_alter 
drop column addr;


-- 테이블의 이름 변경 
rename emp_alter to emp_rename;

-- 테이블 삭제 
drop table emp_rename;

select * from emp_rename;


--------------------------------------------------------------------------------------------------
-- 데이터 사전 
desc user_tables;

select table_name
from user_tables;

select owner, table_name
from all_tables;

--------------------------------------------------------------------------------------------------
-- index( 검색속도를 향상하기위해 사용하는 객체 )
-- select  구문의 검색속도를 향상 시킨다. 
-- 전체 레코드의 3% ~ 5% 정도를 검색할때 가장 빠름 
-- index객체를 컬럼에 생성해서 사용한다 

-- create index [index-name] on [table-name] ( [column-name] ) ;  = > [ ] 이름 

create table emp01 
as select * from emp;

select * from emp01;

insert into emp01 
select * from emp01;

insert into emp01(empno , ename) 
values ( 1111, 'bts');

select empno,ename from emp01 where ename ='bts';
-- 인덱스 객체 생성 
create index idx_emp01_ename on emp01(ename);
-- 인덱스 객체의 삭제 
drop index idx_emp01_ename;

drop table emp01;
select * from emp01;
-- 테이블 삭제 후 원복 
-- show recyclebin; -> 휴지통에 버려진 테이블의 정보를 볼수있다 
-- flashback table 테이블명 to before drop; --> 휴지통에 버려진 테이블 복원 
-- purge recyclebin; -- > 휴지통 비우기 
show recyclebin; 
flashback table emp01 to before drop; 


--------------------------------------------------------------------------------------------------
insert into emp values (1111 , 'aaa' , 'MANAGER' , 9999 , sysdate , 1000 , null , 50); -- 무결성 위배 
-- 제약 조건 ( 무결성 ) : 잘못된 값이 데이터로 사용되는 것을 방지하는것 
-- not null     : null 값이 들어올수 없다 .
-- unique       : 같은 열에 같은 값이 들어올수 없다 . 중복 방지 단 null 데이터는 중복 허용 
-- primary key  : not null 과 unique 의 특성을 둘다 가짐 단, 테이블당 하나만 쓸수있다.  (기본 키)
-- foreign key  :   (외래 키 / 참조 키) 1 : n  관계 / 부모 컬럼 primary key - 자식 컬럼 foreign key 
 --                 1. 부모와 자식의 관계를 가진 자식쪽 테이블 컬럼에 선언한다
 --                 2. 부모 쪽 테이블의 컬럼은 primary key 또는 nuique 로 선언해야한다. 
 --                 3. foreign key가 설정된 컬럼에는 null 데이터를 허용한다 
 
-- check        : 테이블 생성시 설정한 조건식을 만족하는 데이터만 입력할수 있다. 
-- dafault      

-- constraint : 제약 조건에 별칭 부여 ( constraint emp02_empno_pk : 테이블명_ 컬럼명_ 제약조건의 약자 )
-- 오류 발생시 오류 내용에 별칭이 출력됨  
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
create table dept07( -- 부모테이블
    deptno number(2) constraint dept07_deptno_pk primary key,
    dname varchar2(20)constraint dept07_dname_nn not null,
    loc varchar2(20) constraint dept07_loc_nn not null
);

create table emp03 ( -- 자식테이블
    empno number(4) constraint emp03_empno_pk primary key,
    ename varchar2(9) constraint emp03_ename_nn not null,
    job varchar(9),
    deptno number(2) constraint emp03_deptno_fk references dept07(deptno)  -- foreign key 제약 조건 설정 방식 
);


-- 서브쿼리를 이용해 데이터 삽입 ( 부모 테이블 먼저 데이터 삽입 / 테이블 생성도 부모테이블 먼저 생성  )
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


-- default :데이터를 넣을때 빈칸이면 자동으로 기본값으로 설정한 데이터를 넣어준다. 단 직접 null 로 지정해서 넣으면 null 데이터가 삽입된다 
create table dept08(
      deptno number(4) primary key,
      dname varchar2(10) not null,
      loc varchar(15) default 'SEOUL'
);

select * from dept08;

insert into dept08 (deptno, dname ,loc)
values( 30,'SALESMAN','BUSAN');

-- 제약 조건의 설정 방식
-- 1. 컬럼 레벨의 설정 방식 ( 위에서 사용하던 방식 ) 
-- 2. 테이블 레벨의 설정 방식 ( not null 은 사용할수 없다. 컬럼 레벨의 방식에서만 사용 가능 )
--      2.1 테이블 안에서 정의하는 방식
--      2.2 alter 명령어 사용 방식

create table emp05( -- 테이블 레벨의 제약 조건 설정 
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

-- 복합키 ( 기본키를 두개의 컬럼이 사용하는 경우) 
-- 복합키는 테이블 레벨의 방식으로만 지정할 수 있다. 

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

-- 테이블 생성 후에도 제약조건을 설정할 수 있다. ( alter 사용 ) 
alter table emp06 
add constraint emp06_empno_pk primary key(empno);

alter table emp06 
add constraint emp06_ename_fk foreign key(deptno) references dept(deptno);

-- not null 은 변경의 개념 ( null -> not null) add 가 아닌 modify 사용  
alter table emp06 
modify job constraint emp06_job_nn not null;

alter table emp06
modify ename constraint emp06_ename_nn not null;

-- 제약 조건 삭제  drop 제약 조건 명(constraint) or 제약 조건(key name : 제약 조건으로 설정 할 경우 테이블에 같은 제약조건이 모두 삭제된다 ) 
alter table emp06 
drop constraint emp06_empno_pk;

select * from emp06;

-- 부모 테이블과 자식 테이블의 생성 
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


-- 자식 테이블에서 사용중이므로 부모 테이블의 데이터는 지울수 없다 대신 제약 조건 비활성화 후 삭제 가능하다. 
delete from dept09 
where deptno = 10 ;

alter table dept09 
disable primary key cascade;  -- cascade : 계층 구조로 되어있는 모든 제약 조건을 비활성화 

alter table dept09 
drop primary key cascade; -- cascade : 자식 테이블의 foreign key 와 연결된 부모 테이블의 primary key 도 함께 삭제된다  

select * from emp09 order by deptno;
select * from dept09;




--------------------------------------------------------------------------------------------------
-- 뷰 : 가상 테이블 
-- 객체 : table , index , view ( 객체는 create를 사용해 생성 ) 

-- view 문법 
-- create or replace view 뷰테이블명 ( 1.alias )
-- as 
-- 서브쿼리(select) 
-- 2.with check option
-- 3.with read only 
-- 1, 2, 3 번은 선택 나머지는 필수 

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
select empno , ename , mgr , deptno -- 뷰에 보일 데이터 정리 
from emp_copy where deptno = 30; -- 조건 설정 

select * from emp_view30;

delete from emp_copy where empno = 2222;

insert into emp_view30 -- 원본 테이블에 데이터 저장 
values (1111, 'HOHO', 7699 , 30);

insert into emp_view30 (empno, ename, mgr) 
values(3333,'hong' ,2000);

insert into emp_copy (empno, ename, mgr, deptno) -- 제약 조건 위반 
values(3334,'hong' ,2000 , 50 );

-- 별칭을 부여하게되면 원래의 컬럼명을 사용할수 없다.
create or replace view emp_view(사원번호, 사원명 , 상사번호 , 부서번호)
as select empno, ename, mgr, deptno from emp_copy;

select * from emp_view where 부서번호 = 20;

-- 복합 뷰 
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
where deptno = 30 with check option; -- 현재 설정된 조건절의 컬럼을 수정하지 못하게 한다. 

select * from view_chk30;

update view_chk30 set deptno = 10; -- 뷰를 생성할떄 option을 걸어놔서 컬럼을 수정할수 없음 


-- 2.with read only 
create or replace view view_read30
as
select empno , ename ,sal ,comm ,deptno
from emp_copy
where deptno = 30 with read only ; -- 모든 컬럼에 대한 수정이 불가능하다(Create (insert)  Update  Delete 불가) 오직 읽기(조회)만 가능 

update view_read30 set deptno = 10 ;
select * from view_read30;

-- 뷰의 활용 : TOP - N 조회하기
-- ROWNUM ( 의사컬럼 / sudo 컬럼  : 직접 정의한 컬럼은 아니지만 사용할수 있는 컬럼 ) 
-- 특징 : 조건절에 직접 사용시 반드시 1을 포함하는 조건식을 만들어야한다. ( 범위연산을 할수 없다 .) 
--        일회성인 rownum의 컬럼에 별칭을 사용해 고정 컬럼처럼 사용할수 있다. ( 범위 연산 가능 ) 
select * from emp;
-- 입사일이 가장 오래된 5명의 사원을 조회 
select * from emp order by hiredate asc;
select * from emp where hiredate <= '81/05/01'; -- 단순 비교 ( 효율적인 방법이 아님 ) 

DESC emp;

select rownum, empno , ename , hiredate from emp
order by hiredate asc; -- rownum 번호가 붙고 order by 로 정렬이 되기때문에 번호가 섞인다

select rownum, empno , ename , hiredate 
from emp where rownum <= 5 
order by hiredate asc ;

-- 뷰를 활용해 처음부터 입사일로 정렬 후 rownum을 이용해 정렬 후 번호가 붙을수 있도록 할 수있다. 

create or replace view view_hire
as
select empno, ename , hiredate 
from emp where hiredate !=( select hiredate from emp where ename = 'SMITH') 
order by hiredate asc; 

-- 컬럼 처럼 사용하기 위해서는 별칭을 부여해주어야한다. 별칭을 사용하지 않으면 일회성 / 별칭을 사용하게 되면 고정 컬럼 
select rownum rm, v.* from view_hire v where rownum <= 4;

create or replace view view_hiredate_rm
as
select rownum rm , empno , ename , hiredate
from view_hire 
order by hiredate;

select * from view_hiredate_rm where rm between 2 and 7;

-- 인라인 뷰 ( 일회성 )
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

-- 시퀀스 
-- 자동으로 번호를 증가시키는 기능 수행 create , drop

-- create sequence 시퀀스명 ( 옵션의 순서는 중요하지 않음 ) 
-- start with : 시작 값 ( 기본 값 1 ) 
-- increment by : 증가량 ( 기본 값 1 )
-- maxvalue : 증가 시 최대값 ( 기본 값 10의 1027승 ) 
-- minvalue : 감소 시 최소값 ( 기본 값 10의 -1027승 )

-- 생성 
create sequence dept_deptno_seq
increment by 10 
start with 10;

-- 사용 방식  
-- nextval : 실행할때마다 값 증가 
-- currval : 현재 값을 확인하는 용도

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
values ('pid' || idx_product_id.nextval , '치즈' , 2000);

select * from product;
-- 시퀀스 삭제 
drop sequence idx_product_id;


-- 다른 사용자에게 권한 부여
-- grant [ 객체 권한 종류 ]
-- on  객체명 
-- to 계정명 
grant select  --, insert, update
on emp
to user01;
-- 권한 회수 
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
-- PL/SQL (확장되어진 SQL 언어)
-- 변수 , 조건문 ,반복문 사용 

-- 형식 
-- declare (변수 정의)
-- begin ( SQL구문 , 출력문 작성(쿼리문의 수행 결과를 반드시 출력함수를 통해 확인해야한다.)) 
-- exception( 예외처리 구문 ) 
-- end;
-- / 
-- set serveroutput on; - PL/SQL 작성 전에 반드시 실행 ( 실행 결과를 화면에 출력 ) 
set serveroutput on;

begin 
    dbms_output.put_line ('Hello world'); -- 출력 함수 sysout 
end; 
/ 




declare 
    --vempno number(4); -- 변수명 데이터 타입 / 변수의 선언
    --vename varchar2(10);
    
    -- 변수의 선언과 초기화 동시에 가능 
    vempno constant number(4) := 7777; -- ( constant : 상수 = fianl 과같음 ) 변경 불가 
    vename varchar2(10) not null := 'SCOTT'; -- null 값을 변수의 값으로 사용할 수 없다. 
    
begin -- := 대입연산자( 띄어쓰기 X)
    --vempno := 7777; -- 변수의 초기화 
    --vename := 'SCOTT';
    -- 출력문 작성 
    dbms_output.put_line(' 사원 / 이름 ');
    dbms_output.put_line(vempno || ' ' || vename);
end;
/



declare
    -- 스칼라 방식
    -- vempno number(2);
    -- 레퍼런스 방식 ( 주로 사용 ) 기존 테이블의 컬럼의 타입을 참조한다
    vempno emp.empno%type := 7777; -- emp테이블에 empno의 컬럼의 타입을 참조한다 (%는 참조의 의미 ) 
    -- 레퍼런스 방식을 사용하는 목적은 기존 테이블의 데이터를 변수에 대입해서 사용하기 위해 
    
begin
    -- vempno := 7777;
    dbms_output.put_line(' 사원번호 ');
    dbms_output.put_line(vempno);
end;
/




declare
    --레퍼런스 방식 
    vempno emp.empno%type;
    vename emp.ename%type;
begin
    -- 조회된 데이터를 반드시 변수에 저장해서 사용해야한다. into 를 사용해 데이터를 저장. / 순서대로 1대1 매칭되어 저장됨. 
    -- 반드시 where 절을 사용해야한다. 변수는 하나의 값만 받을수 있는데 emp 테이블의 데이터 개수는 14개이기때문에 오류 발생 
    select empno, ename 
    into vempno, vename -- 필수 
    from emp ; -- ORA-01422: 실제 인출은 요구된 것보다 많은 수의 행을 추출합니다 (where 절이 없을때 발생하는 오류 ) 
  --  where empno = 7788; -- 필수 
    
    dbms_output.put_line(' 사원번호 / 이름  ');
    dbms_output.put_line(vempno || ' ' || vename );
    
exception -- when (예외 종류) then  구문 사용  // when other 은 else와 같은 역할 
    when too_many_rows then dbms_output.put_line('행의 수가 너무 많습니다.');
    when others then dbms_output.put_line('모든 예외 처리'); 
end;
/

/* 
#  변수에 데이터 타입을 선언하는 방식 
1. 스칼라 방식    
    Ex)  vempno number(2); ( 변수명 데이터 타입( 데이터 크기) ) 
    
2. 레퍼런스 방식   --  레퍼런스 방식을 사용하는 목적은 기존 테이블의 데이터를 변수에 대입해서 사용하기 위해 
    1. 변수명 emp.empno%type   (변수에 emp 테이블의 empno 의 타입을 가져옴 ) 
    2. 변수명 emp%rowtype ( 변수에 emp테이블의 모든 컬럼의 이름과 데이터 타입을 가져옴  ) 
    
#  사용자 정의 변수 타입 선언 방식
1. 테이블 TYPE (배열)    
    --  배열의 형식 : 사용자 정의로 변수의 타입을 정의 
    
    --  type 사용자정의이름 is table of 데이터 타입(레퍼런스 방식 사용 가능) 
          type [ empno_table_type ] is table of [ emp.empno%type ] -> 레퍼런스방식 
          index by binary_integer; -- 배열의 형식이기 때문에 인덱스 번호를 부여해 배열의 인덱스접근을 할수 있다. 
          
          
2. 레코드 TYPE (변수 묶기)
    --  여러개의 변수를 묶어서 사용한다. : 사용자 정의 변수 타입 -> 클래스와 유사함
# 조건문 
    if ( 조건식 )then
        실행문 
    end if;
    ------------------------------------------------------------------------------
    if ( 조건식 )then 
        실행문
    else 
        실행문 
    end if; 
    ------------------------------------------------------------------------------
    if ( 조건식 )then elsif ( 조건식 ) then 
        실행문 
    end if; 
    ------------------------------------------------------------------------------
    
# 반복문 ( loop , while , for ) 
    loop  
    
        ( 실행 문 : 무한 반복 )
        
        무한 반복문의 제어
        1. exit when 조건식; 
        2. if then end if;
 
    end loop ;
    ------------------------------------------------------------------------------
    
    for n in 1 .. 10 loop  초기값 .. 최대값 1  씩 증가 1..10 : (10회 반복)  
            실행문
    end loop;
    ------------------------------------------------------------------------------

    while ( 조건식 ) loop
        실행문
    end loop;
*/

declare
    -- 테이블 타입 ( 배열의 형식 ) : 사용자 정의로 변수의 타입을 정의 
    -- type 사용자정의이름 is table of 데이터 타입(레퍼런스 방식 사용 가능) 
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
    enameArr ename_table_type ; -- 배열 형식의 변수 선언 
    jobArr job_table_type ;
    mgrArr mgr_table_type;
    hireArr hire_table_type;
    salArr sal_table_type;
    commArr comm_table_type;
    deptnoArr deptno_table_type;
    
    i binary_integer := 0 ; -- 인덱스로 사용될 변수 선언 
begin
    for k in ( select * from emp) loop 
        i := i+1; -- sql은 인덱스의 번호를 1번부터 사용 
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
    -- 레코드 타입 ( 여러개의 변수를 묶어서 사용한다.) : 사용자 정의 변수 타입 -> 클래스와 유사함
    type emp_record_type is record (
        v_empno emp.empno%type,
        v_ename emp.ename%type,
        v_job emp.job%type,
        v_deptno emp.deptno%type
    );
    emp_record emp_record_type; -- 레코드 타입의 변수 선언 
    
begin
    select empno , ename, job , deptno into emp_record
    from emp where empno = 7788;
    
    dbms_output.put_line(emp_record.v_empno || ' ' || emp_record.v_ename || ' '
    || emp_record.v_job || ' ' || emp_record.v_deptno);
    
end;
/

-- 테이블을 이용한 데이터 삽입 insert
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
    
    insert into dept_record -- 테이블 이름 
    values dept_rec; -- 변수 명 
end;
/

-- 데이터 수정 update 
declare
    type rec_dept is record(
        v_deptno dept_record.deptno%type not null := 99 , -- 데이터를 삽입할때 null데이터가 들어오면 9999로 초기화 
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

-- 데이터 삭제 delete 
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
    
   /* if ( 조건식 ) then 
        실행문 
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
    
    dbms_output.put_line( '부서명 ' || ' : ' || vdname );
end;
/



declare 
    -- rowtype : 테이블의 모든 컬럼의 이름과 변수를 참조한다
    -- 컬럼명이 변수명으로 사용되고 컬럼의 타입을 변수의 타입으로 사용한다.  ( 형식 : 테이블 이름%rowtype ) 
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

 -- # 조건문 ( if , else , elsif ) 
declare 

    vemp emp%rowtype;
    annsal number(7,2);
    
begin
    dbms_output.put_line ( ' 사번  /  이름  /  연봉 ');
    dbms_output.put_line ( '----------------------- ');

    select *
    into vemp
    from emp
    where empno = 7788;
    -- 해당 사원의 연봉을 출력 단, 커미션이 null인경우 0으로 계산 
    if( vemp.comm is null ) then
        vemp.comm := 0;
    end if;
    annsal := vemp.sal *12 + vemp.comm;
    dbms_output.put_line(vemp.empno || '    ' || vemp.ename || '   ' || annsal);
end;
/

-- if else 를 사용하는 경우 
declare 
    vemp emp%rowtype;
    annsal number(7,2);
begin
    dbms_output.put_line ( ' 사번  /  이름  /  연봉 ');
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


-- 다중 if 
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

-- # 반복문 

-- loop 문 ( 루프 탈출 조건을 설정해주어야함 )
declare
    n number(10) :=1;
begin
    loop 
        dbms_output.put_line(n);
        n := n +1;
        exit when n > 10; --  조건이 참이면 종료   
    end loop;

end;
/

-- for 문  ( in 구문 뒤에 작성되는 값이 반복의 횟수를 결정한다. )  : 가장 활용도가 높음 
begin
--    for n in reverse 1..10 loop  --> 감소식
    for n in 1 .. 10 loop           --> 증가식
        dbms_output.put_line(n);
    end loop ;
end;
/

-- 반복문의 활용 ( 테이블의 전체 레코드 출력 ) 
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

-- while 문 
declare 
    n number(10) := 1;
begin
    while( n < 10 ) loop -- 조건이 참일때 반복 
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
-------저장 서브프로그램----
    한번만들어두면 언제든지 쓸수있음
         1, 생성(create)
         2, 실행(execute or exec)

저장 프로시저의 매개변수 유형  : in , out , in out 
    in       : 값을 전달받는 용도 
    out     : 프로시저 내부의 실행 결과를 요청한 쪽으로 전달 
    in out :  in + out 기능이 들어가있음 
        
        변수의 데이터 타입 앞에 작성 

    * 프로시저의 형식 
    create or replace procedure 프로시져명(매개변수)

    is or as
         변수 정의
    begin
          SQL
         출력구문
         조건문 , 반복문
    end;
     /
*/
create table emp01 -- 테이블의 복사 
as
select * from emp;

create or replace procedure emp01_print -- 프로시저 생성 
is
    vempno number(10); -- 변수 선언 
    vename varchar2(10);
begin
    vempno := 1111; -- 변수 초기화 
    vename := 'Hong';

    dbms_output.put_line(vempno || ' ' || vename); -- 출력문 
end;
/
-- 프로시저의 실행  
execute emp01_print; 

create or replace procedure emp01_del -- 테이블의 데이터를 삭제하는 프로시저 
is
begin
    delete from emp01;
end;
/

exec emp01_del;

select * from emp01;

-- 매개변수를 받아서 사용하는 프로시저 
create or replace procedure del_ename(vename emp01.ename%type) 
is
    
begin
    delete from emp01
    where ename = vename;
end;
/
-- SCOTT을 매개변수로 넘겨서 프로시저의 실행 -> begin 문이 SCOTT을 받아 delete 문을 실행한다. 
exec del_ename('SCOTT'); 

select * from emp01;

create or replace procedure sel_empno  -- 프로시저 생성 
(
    vempno in emp.empno%type, -- begin 절에서 값을 초기화 해주어야됨 
    vename out emp.ename%type, -- begin 절에서 emp 테이블의 컬럼의 값을 받아옴 
    vsal out emp.sal%type,
    vjob out emp.job%type
)
is  
    -- 변수 선언 공간 
    -- 위에서 out 타입으로 변수를 선언하게되면 이곳에서 변수를 선언 하지 않아도 된다. out으로 선언한 변수는 아래의 공간에서 사용가능 
 
begin
    select ename , sal , job 
    into vename,vsal,vjob
    from emp 
    where empno = vempno;
end;
/

--  바인드 변수는 out 타입으로 받아온 데이터를 지칭 
--  exec sel_empno(7499,바인드 변수 1, 바인드 변수 2 , 바인드 변수 3 );
-- 바인드 변수일때 number타입의 크기를 지정하면 안된다. 타입만 선언 // 기존의 데이터 타입보다 작으면안됨 
-- 바인드 변수를 사용할때는 앞에 : (콜론) 을 붙여야한다. 

variable var_ename varchar2(15);
variable var_sal number;
variable var_job varchar2(9);

exec sel_empno (7499 ,:var_ename,: var_sal ,: var_job);

-- print 출력 문 
print var_ename;
print var_sal;
print var_job;

drop table emp02;

-- 사원 정보를 저장하는 저장 프로시저 만들기 ( 저장 데이터 : 사번 , 이름 , 직책 , 상사 , 부서 ) 
-- 사원 정보는 매개변수를 사용해서 받아온다 .
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
-- 저장 함수 
-- 저장 함수와 저장 프로시저의 차이점 : return 값의 유무 
-- 실행 순서 1. 생성( create )   2. 실행 (exec / execute ) 

/* 저장 함수의 형식 
    create or replace funcion 함수명  ( 매개변수 ) 
        return 리턴할 값의 타입 ( 세미콜론 생략 ) 
    is 
        변수 정의 
    begin
    
        SQL / 출력문 / 조건문 ... 
    
        return 리턴 값 ; (세미콜론 사용)     
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

-- 함수를 호출할때 주의 할점 : exec 실행 전에 먼저  변수를 선언해야한다. 
-- exec 바인드 변수 :=  함수명 ( 매개변수 ) 
variable var_res number;
exec :var_res := cal_bouns(7788); 
print :var_res;

-- 프로시저와 함수의 삭제 
-- drop procedure 프로시저명
-- drop function 함수명 

-----------------------------------------------------------------
/*  커서  : select 구문이 실행하는 결과를 가르킨다.
    declare 
        커서 : 뒤의 select 구문을 참조 
        cursor 커서명 is  SQL 구문( select) ; 
    begin
        open 커서명 ;
        
        loop  / fectch 구문은 반복문과 함께 사용 
            fectch 커서명  into 변수명 ; 테이블로 부터 값을 가져와 변수에 저장 ( 한번 실행 시 레코드 하나 가져옴 ) 
            exit when 커서명%notfound -- 더이상 커서가 가르키는 값이 없다면 종료 
        end loop;
        
        close 커서명;
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

-- for 문 이용  cursor  간소화하여 사용 가능 
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