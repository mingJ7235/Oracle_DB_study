--elsif 쓰기
DECLARE
   VEMPNO EMP.EMPNO%TYPE;
   VENAME EMP.ENAME%TYPE;
   VDEPTNO EMP.DEPTNO%TYPE;
   VDNAME VARCHAR2(20) := NULL;
BEGIN
  SELECT EMPNO, ENAME, DEPTNO
  INTO  VEMPNO,VENAME, VDEPTNO
  FROM EMP
  WHERE EMPNO = 1001;
  
  IF ( VDEPTNO = 10) THEN
  VDNAME := '경리부';
  ELSIF ( VDEPTNO = 20) THEN
  VDNAME := '인사부';
  ELSIF ( VDEPTNO = 30) THEN
  VDNAME := '영업부';
  ELSIF ( VDEPTNO = 40) THEN
  VDNAME := '전산부';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(' 사번   이름  부서명 ');
  DBMS_OUTPUT.PUT_LINE('-------------------');
  DBMS_OUTPUT.PUT_LINE('  ' || VEMPNO || '  ' || VENAME || '   ' ||  VDEPTNO );
END;
/


---FOR LOOP문
DECLARE
BEGIN 
    FOR N IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE( N );
    END LOOP;
END;
/
-- 1 2 3 4 5 5회 돌게 되는 반복문임


DECLARE
    N NUMBER :=1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE ( N );
        N := N+1;
        IF N > 10 THEN
            EXIT;
        END IF;
    END LOOP;
END;
/

-- 1~10까지 반복이돈다

---문) 1~100까지 합 구하기

DECLARE
    TOTAL NUMBER := 0;
BEGIN
    FOR N IN 1..100 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        TOTAL := TOTAL + N;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE(TOTAL);
END;
/

--WHILE문 
DECLARE
    N NUMBER := 1;
    TOTAL NUMBER := 0;
BEGIN
    WHILE N <=5 LOOP
        DBMS_OUTPUT.PUT_LINE (N);
        TOTAL := TOTAL + 1;
        N:= N+1;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE(TOTAL);
END;
/

--문) S_EMP테이블에서 김사랑 사원의 업무가 영업이면 급여를 10%인상하고, 그렇지 않으면 5%인상시키도록 한다.

--S_EMP테이블 만들기
DROP TABLE S_EMP;

CREATE TABLE S_EMP 
AS
SELECT * FROM EMP;

SELECT * FROM S_EMP WHERE ENAME='김사랑';
SELECT * FROM DEPT;
문제 S_EMP테이블에서 김사랑 사원의 업무가 영업이면 급여를 10%인상하고, 그렇지 않으면 5%인상시키도록 한다.

DECLARE
   VEMP S_EMP%ROWTYPE;
   VDEPTNO S_EMP.DEPTNO%TYPE;
   VPERCENT NUMBER(2);
BEGIN
   SELECT DEPTNO INTO VDEPTNO FROM DEPT WHERE DNAME LIKE ('%영업%');
   
   SELECT * INTO VEMP FROM S_EMP WHERE ENAME = '김사랑';
   
   IF VEMP.DEPTNO = VDEPTNO THEN 
       VPERCENT := 10;
   ELSE
       VPERCENT := 5;
   END IF;
/



