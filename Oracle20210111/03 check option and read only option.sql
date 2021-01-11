--with check option

CREATE OR REPLACE VIEW emp_view30
AS
SELECT empno, ename, sal, comm, deptno FROM EMP_COPY WHERE deptno=30;

SELECT * FROM  emp_view30;
SELECT * FROM emp;

UPDATE emp_view30 SET deptno = 20 WHERE sal>=400;

--with check option
CREATE OR REPLACE VIEW emp_view30
AS
SELECT empno, ename, sal, comm, deptno 
FROM EMP_COPY 
WHERE deptno=30
WITH CHECK OPTION;

UPDATE emp_view30 SET comm=100 WHERE empno = 1002; --이거는 가능
SELECT * FROM  emp_view30;

UPDATE emp_view30 SET deptno=20 WHERE sal >250; --불가능!
--불가능한 이유 : dept를 바꾸려고하니까 안된다. 왜? emp_view30
--ORA-01402: view WITH CHECK OPTION where-clause violation 오류가 나느것! 
--with check option 에서 deptno가 30인 경우를 한것이므로 바꿀수 없다!

UPDATE emp_view30 SET ename='홍길동' WHERE sal>250; --가능!

--결론 : view를 수정할 때 view를 생성할때 조건으로주었던 deptno가 with check option이 되었으므로 수정할 수 가없다!
--with check option : where에 있는 컬럼을 변경하지 못하도록 한다. 


SELECT * FROM MEMBER;

--view만들기

CREATE OR REPLACE VIEW v_m_a
AS 
SELECT NO, name, passwd, id FROM MEMBER WHERE passwd = 'a1234' WITH CHECK OPTION ;

--update하기 
UPDATE v_m_a SET name = 'aaa';


--모든 컬럼을 읽기로 변경하기
--with read only ! -> view를 수정,삭제, 삽입 자체가 다 안된다! 

CREATE OR REPLACE VIEW view_read30
AS
SELECT * FROM emp_copy WHERE deptno =30 WITH READ ONLY;

SELECT * FROM view_read30;

UPDATE VIEW_read30 SET ename='홍길동' WHERE deptno=30;
--오류남 : 왜? ORA-42399: cannot perform a DML operation on a read-only view 

INSERT INTO view_read30 (empno, ename) VALUES (1020, '김명수');
--오류남 : ORA-42399: cannot perform a DML operation on a read-only view 

DELETE FROM view_read30 WHERE deptno=30;
--오류남 : ORA-42399: cannot perform a DML operation on a read-only view













