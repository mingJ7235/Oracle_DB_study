SELECT * FROM emp;

SELECT deptno FROM emp WHERE sal > 500

select deptno from emp where sal > 500 group by deptno

SELECT * FROM emp e WHERE e.deptno = (SELECT deptno FROM emp WHERE sal > 500);

select * from emp where deptno in (select deptno from emp where sal > 500 group by deptno);

SELECT * FROM emp
    WHERE deptno IN (
    SELECT deptno FROM emp
    WHERE sal > 500
    );
    
select ename, sal, job from emp
    where sal > any (select sal from emp where job = '과장') and job <> '과장';
    
 
   update emp set sal = sal +100
    where deptno 
    in 
    (select deptno from dept 
    where JOB='과장'
    );
    
   UPDATE emp
    SET sal = sal + 100
    WHERE job IN (
    SELECT job FROM emp
    WHERE job = '과장'
    );
   
   SELECT * FROM EMP;
   SELECT * FROM EMP WHERE ENAME = '박중훈'
   
   SELECT * FROM EMP WHERE JOB = (SELECT JOB FROM EMP WHERE ENAME= '박중훈');
   
   ​select ename, sal, mgr from emp where mgr IN (select empno from emp where ename='감우성');
   
  
  SELECT ename, sal, job FROM emp
    WHERE mgr IN (
    SELECT empno FROM emp
    WHERE ename = '감우성'
    );
   
   
   ​select empno, ename, sal, deptno from emp e 
    where sal = (select MIN(sal) from emp where deptno = e.deptno)
    order by deptno;
  
  SELECT * FROM emp 
    WHERE (deptno, sal) IN (
    SELECT deptno, min(sal)
    FROM emp
    GROUP BY deptno
    );
    
   
   10번
   CREATE OR REPLACE VIEW EMP_VIEW20
   AS
   SELECT * FROM EMP 
   WHERE DEPTNO = 20;
   
  11번
  
  CREATE OR REPLACE VIEW MVIEW_EXAMPLE
  AS
  SELECT * 
  FROM EMP_COPY 
  WHERE DEPTNO = 30 WITH CHECK OPTION;
 
 
  CREATE OR REPLACE VIEW VIEW_EXAMPLE
  AS
  SELECT * 
  FROM EMP_COPY 
  WHERE DEPTNO = 10 WITH CHECK OPTION;
 
 SELECT * FROM EMP;
 
 UPDATE VIEW_EXAMPLE SET deptno = 30;
 
 
CREATE OR REPLACE VIEW view_hire
as
SELECT empno, ename, hiredate FROM emp ORDER BY hiredate DESC;

SELECT *
FROM (SELECT * FROM EMP ORDER BY HIREDATE DESC)
WHERE ROWNUM<=7;


CREATE SEQUENCE SEQ_EX
START WITH 10
INCREMENT BY 1
MAXVALUE 100;

CREATE TABLE DEPT_EX( 
	DEPTNO NUMBER(4) PRIMARY KEY,
	DNAME VARCHAR(20)
);


INSERT INTO DEPT_EX VALUES (SEQ_EX.NEXTVAL, '보안부');
INSERT INTO DEPT_EX VALUES (SEQ_EX.NEXTVAL, '인사부');
INSERT INTO DEPT_EX VALUES (SEQ_EX.NEXTVAL, '전산부');

SELECT * FROM DEPT_EX;
 
  CREATE USER KOREA IDENTIFIED 1234;
  GRANT 
  
  
  
  CREATE INDEX IDX_EMP_JOB_EX ON EMP(JOB);
  
  CREATE USER KOREA IDENTIFIED BY 1234;
 
GRANT CREATE USER, DROP USER, CREATE SESSION, CREATE TABLE, CREATE VIEW 
TO KOREA WITH ADMIN OPTION;


 CREATE USER KOREAIT IDENTIFIED BY 1234;
GRANT CREATE USER, CREATE VIEW TO KOREAIT;
  
  select index_name, table_name, column_name from user_ind_columns where table_name = 'EMP';
 
DECLARE
    STAR VARCHAR2(20);
BEGIN
    FOR I IN 1..5 LOOP
    STAR := STAR || '*';
    DBMS_OUTPUT.PUT_LINE(STAR);
    END LOOP;
END;
/

  