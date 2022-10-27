-- outer join

create table join_emp(
    empno number(4),
    ename varchar(10),
    mgr number(4)
);

select * from join_emp;

insert into join_emp 
select empno , ename , mgr from emp ;

select e.* , m.* 
from join_emp e left join join_emp m
on e.mgr = m.empno;