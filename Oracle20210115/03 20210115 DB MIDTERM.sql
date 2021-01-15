
--문 1 
--테이블을 사용하여 사원 중에서 급여 EMP (SAL)과 보너스(COMM)을 합친 금액이 가장 많
--은 경우와 가장 적은 경우, 평균 금액을 구하세요. 단 보너스가 없을 경우 보너스를 0으로
--계산하고 출력 금액은 모두 소수점 첫째자리까지만 나오게 하세요.
SELECT * FROM emp;

SELECT max(sal+NVL(comm, 0)) AS max, min(sal+NVL(comm, 0)) AS min, round(avg(sal+NVL(comm, 0)), 1) AS avg
FROM EMP
WHERE job = '사원' ;

--문 2
--emp테이블에 데이터 2개를 입력하시오
INSERT INTO emp (empno, deptno, ename, sal) VALUES (1000, 10, '이경자', 3000);
INSERT INTO emp (empno, deptno, ename, sal) VALUES (2000, 10, '최병민', 4000);

--문 3
--emp테이블에서 모든 사람들의 sal을 10%씩 인상하세요.
UPDATE emp SET sal = sal*1.1;

--문 4
--트랜잭션관리을 위해 사용하는 명령어 2개를 쓰고 설명하세요.
COMMIT; : 모든 작업들을 정상적으로 처리하겠다고 확정하는 명령어입니다.
ROLLBACK; : 작업중 문제가 발생하여서 트랜잭션의 처리 과정에서 발생한 변경 사항을 취소하는 명령어입니다. 

-- 문 5
--데이터 무결성의 위한 제약 조건에 대하여 서술하세요.

데이터 무결성 제약조건이란 테이블에 부적절한 자료가 입력되는 것을 방지하기 위해서 테이블을 생성할 때
각 컬럼에 대해서 정의하는 여러가지 규칙을 말합니다.
그 종류에는 5가지가 있습니다. 
1. NOT NULL : COLUME의 NULL을 혀용하지 않습니다.
2. UNIQUE : 중복된 값을 허용하지 않는 다는 의미입니다. 즉 항상 유일한 값을 갖도록 합니다.
3. PRIMARY KEY :  NULL을 허용하지 않고 중복된 값을 허용하지 않습니다.
								NOT NULL 조건과 UNIQUE 조건을 결합한 것입니다.
4. FOREIGN KEY :  참조되는 테이블의 컬럽의 값이 존재하면 허용한다는 의미입니다.
5. CHECK : 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값만을 허용합니다. 

--문 6
--다음 ERD를 보고 데이터베이스를 구축하여라.
--학생, 교수, 학과 테이블만 만드세요.
CREATE TABLE DEPARTMENT_Q (
    deptno NUMBER(4) PRIMARY KEY,
    dname VARCHAR2(10),
    tel VARCHAR2(10)
    );
  
  CREATE TABLE SUBJECT_Q (
  	SUBNO NUMBER(4) PRIMARY KEY,
  	SUBNAME VARCHAR(20),
  	CREDIT VARCHAR(4),
  	PRONUM VARCHAR(20),
  	SUBTIME VARCHAR(20),
  	CLASS VARCHAR(20)
  );
 
 CREATE TABLE PROFESSOR_TEST (
    profno NUMBER(4) PRIMARY KEY,
    deptno NUMBER(4),
    subno NUMBER(4),
    id VARCHAR2(13),
    address VARCHAR2(20),
    name VARCHAR2(10),
    tel VARCHAR2(11),
    email VARCHAR2(20),
    photo VARCHAR2(20),
    CONSTRAINT PROF_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES department_Q(deptno),
    CONSTRAINT PROF_SUBNO_FK FOREIGN KEY (SUBNO) REFERENCES SUBJECT_Q(SUBNO)
    );

 CREATE TABLE STUDENT_Q (
 	STUNO NUMBER(4) PRIMARY KEY,
 	SNAME VARCHAR(20),
 	SJUMIN VARCHAR(20),
 	SYEAR VARCHAR(20),
 	SADDRESS VARCHAR(20),
 	SPHONE VARCHAR(20),
 	SEMAIL VARCHAR(20),
 	SPHONO VARCHAR(20),
 	PROFNO NUMBER(4),
 	DEPTNO NUMBER(4),
 	SUBNO NUMBER(4),
 	CONSTRAINT STUDENT_Q_PROFNO_FK FOREIGN KEY (PROFNO) REFERENCES PROFESSOR_TEST(PROFNO),
 	CONSTRAINT STUDENT_Q_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT_Q(deptno),
 	CONSTRAINT STUDENT_Q_SUBNO_FK FOREIGN KEY (SUBNO) REFERENCES SUBJECT_Q(SUBNO)
  );

 --문 7
 --서브쿼리문을 이용하여 ‘영업부’에서 근무하는 모든 사원의 이름과 급여를 출력하여라.
--‘영업부’에서 근무하는 모든 사원의 이름과 급여를 출력하려고 하는데, 사원 테이블에는 부서명에 대한 정보가 없습니다 
--단지 . 부서 번호만 있습니다. (emp, dept테이블 사용하기)

SELECT e.ename, e.SAL
FROM emp e
WHERE e.DEPTNO = (SELECT deptno FROM dept WHERE dname = '영업부');

--문 8
--경리부에서 근무하는 사원의 이름과 입사일을 출력하세요.(조인을 이용하기) (emp, dept테이블 사용하기)
 SELECT E.ENAME, E.HIREDATE, D.DNAME
 FROM EMP E
 JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
 WHERE DNAME = '경리부';

--문 9
--인천에 근무하는 사원의 이름과 급여를 출력하세요. (조인을 이용하기) (emp, dept테이블 사용하기)
SELECT E.ENAME, E.SAL, D.LOC
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = '인천';
 
--문 10
--부서테이블에서 부서번호를 자동으로 부여하여라. 2000, 2500, 3000, ... 5000까지 5000이후에는 다시 2000으로 시작됨
CREATE SEQUENCE DEPT_NAME_SEQ
START WITH 2000
INCREMENT BY 500
MAXVALUE 5000
MINVALUE 2000
CYCLE
CACHE 6;

CREATE TABLE DEPT_Q (
	DEPTNO NUMBER(4),
	DNAME VARCHAR2(20),
	DLOC VARCHAR2 (20)
)

INSERT INTO DEPT_Q VALUES (DEPT_NAME_SEQ.NEXTVAL, '경리부', '부산');
INSERT INTO DEPT_Q VALUES (DEPT_NAME_SEQ.NEXTVAL, '인사부', '서울');
INSERT INTO DEPT_Q VALUES (DEPT_NAME_SEQ.NEXTVAL, '총무부', '인천');

SELECT * FROM DEPT_Q;


--문 11
--조인의 종류에 대하여 나열하고 2개의 테이블을 임의로 만들고 예시를 만드세요

조인의 종류 : 조인 조건에 따라 조인의 종류가 결정이 됩니다. 
1. EQUI JOIN : 동일 COLUMN을 기준으로 조인합니다.
SELECT ENAME, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO 
AND ENAME = '김사랑';

2. NON-EQUI JOIN : 동일 COLUMN이 업이 다른 조건을 사용하여 조인합니다.
SELECT ENAME, SAL,GRADE 
FROM EMP E, SALGRADE S 
WHERE SAL >= LOSAL AND SAL <= HISAL;

3. OUTER JOIN : 조인 조건에 만족하지 않는 행도 나타냅니다.
SELECT * FROM EMP FULL OUTER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO;

4. SELF JOIN : 한 테이블 내에서 조인합니다. 
SELECT E.ENAME, E.JOB, D.ENAME
FROM EMP E
JOIN EMP D ON E.MGR = D.EMPNO AND D.EMPNO = 1008;











 
 
 

