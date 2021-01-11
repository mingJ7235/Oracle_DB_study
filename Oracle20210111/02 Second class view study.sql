SELECT view_name, text FROM USER_VIEWS ;

--view의 동작 순서
--1.사람이 쿼리 문을 수행
SELECT * FROM course_view_20;
--2. 뷰의 text컬럼안에 자료인 select문을 수행한다. 
SELECT cou_id, cou_name FROM course WHERE cou_id=20;
--3. 물리적인 데이터 조회
--4. 물리적인 데이터 조회에 의한 결과 수행
--5. 1번으로 결과를 리턴함


--뷰를 사용하는 이유
--1. 긴 쿼리문, 많이 쓰는 쿼리문을 뷰로 만들기 
--2. 보안에 유리 (가상으로 만든 논리적 데이터를 주기때문에 보안에 유리하다. )

--뷰를 만드는 방법
--1. select문
CREATE VIEW emp_view30
AS
SELECT empno, ename, deptno FROM emp WHERE deptno = 30;

-- insert문으로 뷰 안에 데이터 추가 해보기
SELECT * FROM emp_view30;
INSERT INTO emp_view30 VALUES (2222, 'bbbb', 30); --뷰안에 데이터 넣기
--물리적 데이터는?
SELECT * FROM emp; 
--결론 : view에 insert를 하여도 물리적 데이터 emp에도 추가가된다. 

--view로 데이터 수정하기
UPDATE emp_view30 SET ename = 'cccc' WHERE empno=2222;

--view테이블을 이용하여 데이터 삭제 aaaa인 사람 삭제하기
DELETE FROM emp_view30 where empno = 2222;
DELETE FROM emp_view30 where empno = 1002;

COMMIT;

--join문도 view로 만들어보기

CREATE VIEW emp_view_dept
as
SELECT e.empno, e.ename, e.sal, e.deptno, d.dname, d.loc FROM emp_copy e, dept d
WHERE e.deptno = d.deptno;

SELECT * FROM emp_view_dept;

--view 테이블에서 text 내용 보기

SELECT * FROM USER_VIEWS WHERE view_name = 'EMP_VIEW_DEPT';

SELECT * FROM emp;

CREATE VIEW emp_view
AS
SELECT empno, ename, job, mgr, hiredate, deptno FROM emp;

--현재 데이터베이스에서 모든 뷰 보기
SELECT * FROM USER_VIEWS ;

SELECT * FROM emp_view;
--뷰를 삭제하기
DROP VIEW emp_view_dept;









