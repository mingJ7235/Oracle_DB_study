--self join
--emp  테이블에서 사원명, 메니저명 출력
select e.ename, m.ename from emp e, emp m where e.mgr = m.empno;

select e.ename, m.ename from emp e join emp m on e.mgr = m.empno;