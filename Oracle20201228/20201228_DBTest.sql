--부서 테이블 생성하기
CREATE TABLE dept ( deptno NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
                    dname VARCHAR2(14),
                    loc VARCHAR2(13));

--사원테이블 생성하기
CREATE TABLE emp ( empno number(4) CONSTRAINT PK_EMP PRIMARY KEY,
                    ename varchar2(10),
                    job varchar2(9),
                    mgr number(4),
                    hiredate date,
                    sal number(7,2),
                    comm number (7,2),
                    deptno number (2) CONSTRAINT FK_DEPTNO REFERENCES DEPT );
--급여 테이블 생성하기
--gread 등급, losal급여 하한가 hisal  금급여 상한값
CREATE TABLE salgrade ( grade number, losal number, hisal number);

--사원 테이블에 샘플 데이터 넣기
INSERT INTO dept (deptno, dname, loc) VALUES (10, '경리부', '서울');
INSERT INTO dept (deptno, dname, loc) VALUES (20, '인사부', '인천');
INSERT INTO dept VALUES (30, '영업부', '용인');
INSERT INTO dept VALUES (40, '전산부', '수원');


--사원 테이블 안에 있는 레코드(행)을 검색하기
SELECT * FROM dept;

--사원 테이블 자료 삽입하기
INSERT INTO emp VALUES(1001, '김사랑', '사원', 1013, to_date('2007-03-01','yyyy-mm-dd'), 3000, NULL, 20);
INSERT INTO EMP VALUES(1002, '한예슬', '대리', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '오지호', '과장', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '이병헌', '부장', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '신동협', '과장', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '장동건', '부장', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '이문세', '부장', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '감우성', '차장', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '안성기', '사장', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '이병헌', '과장', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '조향기', '사원', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '강혜정', '사원', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '박중훈', '부장', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1015, '조인성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

SELECT * from emp;

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);


SELECT * from salgrade;

commit;
-----------------------------
SELECT empno, job FROM emp WHERE job='부장';
SELECT DISTINCT job FROM emp;
SELECT DISTINCT job 직위 FROM emp; --컬럼의 이름을 '직위'로 바꾸는 것임 (as생략 가능)

----------------------- 연산
SELECT sal FROM emp;
SELECT sal as 월급, sal*0.03 as 세금 FROM emp;

SELECT ename 이름, comm 커미션, sal*12+comm 연봉, NVL(comm, 0) 커미션, sal*12+NVL(comm, 0) 연봉 FROM emp; 
--nvl (컬럼, 0) : 컬럼이 null인경우 0을 넣어라 라는 의미임
--null 이란? 
--  null 은 0이 아니다 빈공간도 아니다. 미확정, 즉 알수 없는 값을 의미한다. value를 가지는 것이다!
--  어떤 값인지 알 수 없지만, 어떤 값이 존재하는 것이다. ? 또는 무한대를 의미한다. 
--  연산, 할당, 비교가 불가능하다. 

----------------------
SELECT ename || '의 직급은 ' || job || '입니다.' as 직급 from emp;
-- ||은 컬럼들을 연결할 때 쓰는 것이다. 


----where절 조건절
select * from emp;
select *from emp where sal >=500;
SELECT * FROM emp WHERE deptno =10;

---문자검색
SELECT * FROM emp WHERE ename ='한예슬';

---날짜검색 (2005년 1월 1일 이전에 입사한 사람 조회하고 싶을때)
SELECT * FROM emp WHERE hiredate < TO_DATE('2005/01/01', 'yyyy/mm/dd');
--문자형이 날짜화가 되어서 비교가 가능해진다 
SELECT * FROM emp WHERE hiredate >= TO_DATE('2005/01/01', 'yyyy/mm/dd');

--부서번호가 10이고 직급이 과장인 사람 (and, or, not)
SELECT * FROM emp WHERE deptno = 10 AND job ='과장';
--or, not 연습
SELECT * FROM emp WHERE deptno = 10 or job ='과장';
SELECT * FROM emp WHERE not deptno = 10 or job ='과장';

commit;

--급여가 400~500인경우
SELECT * FROM emp WHERE sal >= 400 AND sal<= 500;
--급여가 400미만이거나 500초과인경우
SELECT * FROM emp WHERE sal <400 or sal >500;
--between and 연산자 (급여가400~500) -> 컬렴명 between 숫자1 and 숫자2
SELECT * FROM emp WHERE sal between 400 and 500;

--in ~ : ~안에 
--ex> 커미션이 80 이거나 100이거나 200인 사원
SELECT * FROM emp WHERE comm=80 or comm=100 or comm=200;
SELECT * FROM emp WHERE comm in(80,100,200); --in 사용

--comm이 80이 아니고 100도 아니고 20도 아닌 사원
SELECT * FROM emp WHERE comm != 80 and comm != 100 and comm != 200;
SELECT * FROM emp WHERE comm not in (80,100,200);

--유사일치 (비슷하게 일치하는것 검색 EX> 김씨 인 사람 찾기) ->like
--와일드 카드 : % _
--  % : 문자가 없거나 하나 이상의 어떤 문자가 와도 상관 없다. (여러글자를 대신)
--  _ : 하나의 문자가 어떤 값이 와도 상관 없다. (한글자를 대신)
SELECT * FROM emp WHERE ename like '조%';
INSERT INTO EMP VALUES(1016, '조이성', '사원', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);
SELECT * FROM emp WHERE ename like '%이%';
SELECT * FROM emp WHERE ename like '__성';

SELECT * FROM emp WHERE job like '사%';
--not사용해서 직위에서 사로 시작하지 않는사람
SELECT * FROM emp WHERE job not like '사%';

SELECT * FROM emp WHERE ename not like '이%';

--comm이 null인 사람 찾기
--SELCET * FROM emp WHERE comm = null; null은 못찾음
--NULL을 찾기위해서는 IS NULL을 써야함
SELECT * FROM emp WHERE comm is null;
SELECT * FROM emp WHERE comm is not null;


--정렬을 해서 java로 가지고 가는것이 프로그램적으로 편하다 
--order by 를 사용하여 정렬한다

SELECT * FROM emp ORDER BY sal; --기본 정렬은 오름차순으로되어있다
SELECT * FROM emp ORDER BY sal DESC; --DESCENDING (내림차순)
SELECT * FROM emp ORDER BY sal DESC, deptno DESC; --어떤걸 먼저 쓰느냐에 따라 정렬이 달라짐 
SELECT * FROM emp ORDER BY deptno DESC, sal DESC;

SELECT * FROM emp ORDER BY ename DESC;

--사원중에서 급여를 오름차순으로 정렬
SELECT * FROM emp WHERE job ='사원' ORDER BY sal;

--최근에 입사한 사람 순서대로
SELECT * FROM emp WHERE NOT job ='사장' ORDER BY hiredate DESC;

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






