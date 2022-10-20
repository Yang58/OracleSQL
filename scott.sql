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
select e.empno , e.ename , e.mgr , m.ename 
from emp e left outer join emp m   -- 데이터가 존재하는 쪽의 테이블 방향 ( join 기준 )
on e.mgr = m.empno;

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
