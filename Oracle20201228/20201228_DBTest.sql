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

SELECT * FROM emp WHERE ename ='한예슬';


