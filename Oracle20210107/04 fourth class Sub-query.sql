--sub query

--하나의 select 문장의 절 안에 포함된 또 하나의 select문장.
--그렇기에 서브쿼리를 포함하고 있는 쿼리문을 메인쿼리, 포함된 또 하나의 쿼리를 서브쿼리라고 한다. 

--select, insert, delete와 같은 dml문 모두에서 사용가능하다. 

-- 서브쿼리 규칙
-- 1. nesting : 서브쿼리안에 또 서브쿼리가 들어갈수있다. 무제한 중첩가능
-- 메인쿼리에서 서브쿼리의 결과값을 조건으로 사용 할 때 some, any 또는 all 연산자를 사용하지 않는 일반적인 경우에는
    --서브쿼리에서는 하나의 레코드값만 리턴해야한다. 그러므로 대부분의 경우 서브쿼리에는 group by, having 문을 사용할 수 없다.
-- 서브쿼리에서 order by 문은 top연 ... 

--이문세의 부서명 검색
--1. 이문세 deptno 찾기 
select * from emp where ename='이문세'
--2. 이문세의 deptno가 10이니까 10에 해당하는 부서명을 찾기
select dname from dept where deptno = 10;

--서브쿼리로 1과 2를 같이 쓰기 -> 즉, 결과값을 가져오는 것임
--Sub Query 부분은 WHERE 절에 연산자 오른쪽에 위치해야 하며 반드시 괄호로 묶어야 한다.
select dname from dept where deptno = (select deptno from emp where ename='이문세');


--단일행 서브쿼리 : 서브쿼리의 답이 하나인경우 
--평균 급여 구하기
select avg(sal) from emp;

--문제 ) 평균급여보다 더 많은 급여를 받는 사원은? 0> 서브쿼리로 표현
select ename, sal from emp where sal >= (select avg(sal) from emp);

--문제 ) student 테이블과 department테이블을 이용하여 'anthony hopkins' 학생과 전공 1이 동일한 학생들의 이름과 전공 1 이름을 출력

select * from student;
select * from department;
select deptno1 from student where name = 'Anthony Hopkins'; --이게 단일행 서브쿼리 서브쿼리의 답이 하나!
select dname from department where deptno=103;
   
select name, dname from student, department
    where deptno = (select deptno1 from student where name= 'Anthony Hopkins');

----다중행 서브 쿼리 (distinct : 중복제거) -- 즉 서브쿼리의 결과가 다중인 것임 즉, = 연산자를 사용못함
select distinct deptno from emp where sal>500;

--문제) 급여가 500을 초과하는 사원과 같은 부서에 근무하는 사원 구하기 

select deptno, ename, sal from emp where sal > 500; -- -> 10, 20인 부서코드가 나옴
select * from emp where deptno = 10 or deptno = 20; --> 10,20을알았으니까 여기서 이제 컬럼을 선택하는 것임 

--최종 다중행 서브쿼리
SELECT ename, sal, deptno FROM emp
    WHERE deptno IN (
    SELECT DISTINCT deptno
    FROM emp
    WHERE sal > 500
    );

--문제) 30번 부서의 최대급여 구하기
select max(sal) from emp where deptno =30; -- 500임

--문제) 30번 부서의 최대 급여보다 많은 급여를 받는 사원 출력
select ename,sal from emp where sal > (select max(sal) from emp where deptno =30);

--문제 30번 부서에 소속된 사원들의 급여를 출력하기
select sal from emp where deptno = 30;

— 30번 부서의 최대 급여보다 많은 급여를 받는 사원 출력
SELECT ename, sal FROM emp
    WHERE sal > (
    SELECT max(sal) FROM emp
    WHERE deptno = 30
    );
— ALL 연산자 (부등호가 중요)
SELECT ename, sal FROM emp
    WHERE sal > ALL (
    SELECT sal FROM emp
    WHERE deptno = 30
    );
    
-- any연산자 예 
--문제 ) 30번 부서에 소속된 사원들 중에서 가장 적은 급여 출력
select min(sal) from emp where deptno = 30;

--문제) 30번 부서의 최소급여보다 많은 급여를 받는 사원 출력

select ename, sal from emp where sal > (select min(sal) from emp where deptno =30);


--문제 ) 30번 부서에 소속된 사원들의 급여출력

select sal from emp where deptno =30;

--문제 ) 30번 부서의 최소급여보다 많은 급여를 받는 사원 출력
select ename, sal from emp where sal > all (select sal from emp where deptno = 30);
select ename, sal from emp where sal < all (select sal from emp where deptno = 30);

select ename, sal from emp where sal > any (select sal from emp where deptno = 30);
select ename, sal from emp where sal < any (select sal from emp where deptno = 30);

--다중행 연산자 보충 설명 > any : 서브 쿼리 결과 중에서 최소값을 반환한다. 
--                     < any : 서브 쿼리 결과 중에서 최대값을 반환한다. 
--                     > all : 서브 쿼리 결과 중에서 최대값을 반환한다. 
--                     < all : 서브 쿼리 결과 중에서 최소값을 반환한다. 
--                     exists : 서브쿼리의 값이 있을 경우 메인쿼리를 수행한다.
--                     in : 서브쿼리의 결과와 같은 값을 찾는다. 

--exists 연산자, not exists (서브쿼리가 존재하면 바로 메인쿼리를 수행하고 안하고 에관한 연산자)
select * from dept where exists (select * from emp where deptno=10);

select * from dept where not exists (select * from emp where deptno=180);
