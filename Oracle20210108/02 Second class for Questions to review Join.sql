--문 ) 사원 테이블에서 '영업부'인 사원 삭제하기
--서브쿼리 데이터 삭제
select deptno from dept where dname = '영업부'

select * from emp02;

delete from emp02 where deptno = 30; 
delete from emp02 where select deptno from dept where dname='영업부'

-----------------------------문제풀기------------------------------------------------
select * from emp;
select * from dept;
select ^ from loc;
--2. 경리부에서 근무하는 사원의 이름과 입사일을 출력하기
select e.ename, d.dname, e.hiredate from emp e
    join dept d on e.deptno = d.deptno and d.deptno = 10;
​
--2번 정답 
    select ename, e.hiredate from emp e, dept d 
        where e.deptno = d.deptno and d.dname ='경리부';

3. ANSI JOIN을 사용하여 인천에서 근무하는 사원이름과 급여를 출력하기
select deptno from dept where loc = '인천';
select ename, sal from emp where deptno = 20;
select e.ename, e.sal, d.loc from emp e
    join dept d on e.deptno = (select deptno from dept where loc='인천');​
    
--3번 정답
    select e.ename, e.sal from emp e 
        inner join dept d on e.deptno = d.deptno and d.loc='인천';    
    

4. 사원 테이블과 부서 테이블을 조인하여 사원이름과 부서번호, 부서명을 출력하시오
select e.ename, e.deptno, d.dname from emp e
    join dept d on e.deptno = d.deptno;
    
--4번 정답
    select e.ename, d.deptno, d.dname from emp e 
        inner join dept d on e.deptno = d.deptno;

5. 경리부 부서 소속 사원의 이름과 입사일을 출력하시오
select * from dept;
select e.ename, e.hiredate from emp e where deptno = 10;
select e.ename, e.hiredate, d.dname from emp e
    join dept d on e.deptno = d.deptno and d.deptno = 10;
​
--5번 정답
    select e.ename, d.hiredate, d.dname from emp e, dept d
        where e.deptno = d.deptno and d.dname= '경리부';

6. 직급이 과장인 사원이 이름, 부서명을 출력하시오
select * from emp;

select e.ename, d.dname from emp e
    join dept d on e.deptno = d.deptno and e.job = '과장';
​
--6번 정답
    select e.ename, d.dname from emp e, dept d 
        where e.deptno = d.deptno and e.job='과장';

7. 직속상관이 감우성인 사원들의 이름과 직급을 출력하시오

select e.ename, e.job, d.ename from emp e 
    join emp d on e.mgr = d.empno and d.empno=1008;
  select * from emp;  
--7번 정답
    select work.ename, work.job, manager.ename from emp work, emp manager 
        where work.mgr = manager.empno and manager.ename= '감우성';
    

8. 감우성과 동일한 근무지에서 근무하는 사원의 이름을 출력하시오
select * from emp where deptno = 30;
--8번 정답
    select work.ename, friend.ename from emp work, emp friend
        where work.deptno = friend.deptno and work.ename= '감우성' and friend.ename <> '감우성';
                                    --<>은 감우성의 이름은 빼야해서 감우성은 아니어야해! 라는 의미임

