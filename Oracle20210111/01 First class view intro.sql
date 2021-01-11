-- VIEW 스터디
--뷰의 개념 : 뷰는 한마디로 물리적인 테이블을 근거한 논리적인 가상 테이블이라고 정의한다. 
--물리적 테이블에서 가상 테이블을 만들어 낸것.
--
--
--자주 사용하는 쿼리문을 뷰로 만들어서 편리하게 사용할 수 있다.
--
--view를 사용하는 이유
--
--복잡하고 긴 쿼리문을 뷰로 정의하면 접근을 단순화 시킬 수 있다. 
--보안에 유리하다

CREATE TABLE emp_copy
AS
SELECT * FROM emp;

SELECT * FROM emp_copy; --물리적 테이블

--deptno이 30인 사원의 사번, 이름, 부서번호를 검색 하는 것을 view에 넣기
CREATE VIEW emp_view30
AS
SELECT empno, ename, deptno FROM emp WHERE deptno = 30;

SELECT * FROM emp_view30;
SELECT  ename FROM emp_view30;

SELECT * FROM course;
SELECT * FROM course WHERE cou_id=20;


CREATE VIEW course_view_20 (cou_id, cou_name)
AS
SELECT cou_id, cou_name FROM course WHERE cou_id=20;

SELECT * FROM course_view_20;

DESC user_views;








