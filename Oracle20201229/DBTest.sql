--복습

--사원 이름과 급여일 입사일자만 출력하기
SELECT ename, sal, hiredate FROM emp;
--부서번호는 dno로 부서명은 dname으로 정해져 별층을 붙여서 출력
SELECT deptno dno, dname 부서명 FROM dept;
--사원테이블에 존재하는 직급의 종류만 출력
SELECT job FROM emp;
--급여가 300 이하인 사원의 사원번호, 사원이름, 급여 출력
SELECT empno 사원번호, ename 이름, sal 급혀 FROM emp WHERE job = '사원' and sal <= 300;
--이름이 '오지호'인 사원의 사원번호, 사원명, 급여를 출력
SELECT empno, ename, sal FROM emp WHERE ename ='오지호';
--급여가 250 이거나 300이거나 500인 사원들의 사원번호, 사원명, 급여
SELECT empno, ename, sal FROM emp WHERE sal in (250, 300, 500);
-- 사원중에는 이름이 '김'으로 시작하는 사람과 이름중에 '기'를 포함하는 사원의 사원번호와 사원이름을 출력하세요
SELECT empno, ename FROM emp WHERE ename like '김%' or ename like '%기%' ;
-- 상급자가 없는 사원을 검색하세요 
SELECT * FROM emp WHERE mgr is null;
-- 사원테이블의 자료를 입사일을 기준으로 정렬하여 최근에 입사한 직원을 가장 먼저 출력하세요
--  (단, 사원번호, 사원명, 직급, 입사일) 컬럼만 출력
SELECT empno, ename, job, hiredate FROM emp ORDER BY hiredate desc;
-- 부서번호가 빠른 사원번호부터 출력하되 같은 부서 내의 사원을 출력할 경우 입사한지 가장 오래된 사원부터 출력하세요
SELECT * FROM emp ORDER BY deptno, hiredate;

----------------Oracle 집합-------------------------------
--집합 연산자
--UNION 합집합 DIFFERENCE 차집합 INTERSECT 교집합

CREATE TABLE group_star (name varchar2 (8) );

INSERT INTO group_star values ('A');
INSERT INTO group_star values ('B');
INSERT INTO group_star values ('C');

INSERT INTO group_star values ('D');
INSERT INTO group_star values ('E');
INSERT INTO group_star values ('F');
INSERT INTO group_star values ('G');
INSERT INTO group_star values ('H');

SELECT * FROM group_star;

CREATE TABLE single_star (name varchar2(8));

INSERT INTO single_star VALUES('E');
INSERT INTO single_star VALUES('F');
INSERT INTO single_star VALUES('G');
INSERT INTO single_star VALUES('H');
INSERT INTO single_star VALUES('I');
INSERT INTO single_star VALUES('J');
INSERT INTO single_star VALUES('K');
INSERT INTO single_star VALUES('L');

SELECT * FROM single_star;

--합집합 (중복은 나오지 않게)
SELECT * FROM group_star UNION SELECT *FROM single_star;
--합집합 (중복도 모두 나오게) => ALL사용
SELECT * FROM group_star UNION ALL SELECT *FROM single_star;

--교집합
SELECT * FROM group_star INTERSECT SELECT *FROM single_star;

--차집합 (교집합을 뺀것)
SELECT * FROM group_star MINUS SELECT *FROM single_star;
SELECT * FROM single_star MINUS SELECT *FROM group_star;

-------------3장 Oracle 함수------------------
















