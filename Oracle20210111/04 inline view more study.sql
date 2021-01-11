--인라인 뷰란? 
-- - SQL문 내부에 뷰를 정의하고 이를 테이블처럼 사용하는 것
-- - 다른 쿼리에서 사용할 필요 없이 해당 SQL에서만 필요한 VIEW일 경우 번거럽게 뷰를 생성하지 말고
-- -SQL 문장의 FROM 절에 view의 서브쿼리를 바로 적어서 사용하는 것

--문 emp, dept테이블을 조회하여 부서번호와 부서별 최대급여 및 부서명을 출력하기
SELECT  e.deptno, d.dname, e.sal
	FROM 
	(Select deptno, max(sal) sal 	from emp group by deptno) e, dept d;

-- (Select deptno, max(sal) sal 	from emp group by deptno) -> 이거 자체가 view가 된거고, 하나의 테이블이 되어서 e 로 선언해줄수있다. 
-- 즉, 서브쿼리로 만들어진 부분이 테이블로 보게되는 것임. 
-- 서브쿼리에서 max(sal) 에 sal이라는 컬럼명을 지정해줘야 select 에서 e.sal로 지정해서 조회할 수 있다. 

--문) 인라인 뷰로 입사일이 빠른 사람 5명만 출력하기

SELECT * FROM emp;

SELECT rownum, empno, ename, hiredate 
	FROM (SELECT empno, ename, hiredate FROM emp ORDER BY hiredate)   --인라인 뷰로 만들어서 테이블처럼 쓰면댐 
	WHERE rownum <=5;

--위의 문제를 view로만들어서 실행해보기
--1. view만들기
CREATE OR REPLACE VIEW vv
AS
SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;
--2. 1에서만든 view에서 조회하기
SELECT rownum, empno, ename, hiredate
FROM vv
WHERE rownum <=5;
--3. view를 만들게 되면 따로 변수를 줄필요가 없게된다.

-------view 문제 풀기----------
-- 1. 사원 테이블을 기본 테이블로 하여 부서별 최대 급여와 최소급여을 출력하는 뷰를 SAL_VIEW란 이름으로 작성하시오

CREATE OR REPLACE VIEW sal_view
AS
SELECT d.dname, max(e.sal) AS max_sal, min(e.sal) AS min_sal
FROM emp e, dept d
WHERE e.deptno = d.deptno GROUP BY d.dname;

SELECT * FROM sal_view

--2. 인라인 뷰를 사용하여 급여를 많이 받는 순서대로 3명만 출력하시오

SELECT rownum AS ranking, empno , ename, sal
FROM
( SELECT empno, ename, sal FROM emp_copy WHERE sal IS NOT NULL ORDER BY sal DESC)
WHERE rownum<=3;

--3. professor테이블과 department테이블을 조인하여 교수번호와 교수이름, 소속 학과이름을 조회하는 view를 생성하시오. view 이름은 v_prof_dept2로 하세요

SELECT * FROM professor;
SELECT * FROM DEPARTMENT ;

CREATE OR REPLACE VIEW v_prof_dept2
AS
SELECT p.profno, p.name, d.dname FROM professor p 
	join department d 
	ON p.deptno = d.deptno;

--4. inline view를 사용하여 student테이블과 departmant테이블을 사용하여 학과별로 학생들의 최대키와 최대 몸무게, 학과 이름을 출력하세요.

SELECT * FROM student;
SELECT* FROM DEPARTMENT ;

SELECT  d.dname, s.mh, s.mw  FROM 
	(SELECT deptno1, max(height) mh, max(weight) mw FROM student  GROUP BY deptno1) s
	JOIN department d 
	ON s.deptno1 = d.deptno;

--5. student테이블과 departmemt테이블을 사용하여 학과 이름, 학과별 최대키, 학과별로 가장 키가 큰 학생들의 이름과 키를 inline view를 사용하여 출력하세요.

SELECT 














