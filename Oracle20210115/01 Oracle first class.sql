SET serveroutput ON;

--ORACLE PL/SQL 20210115 
-- SELECT 문

SELECT empno, ename INTO vempno, vename FROM emp WHERE ename='김사랑'; 
--into 뒤에 변수(various)를 붙임


문) pl/sql의 SELECT 문으로 emp테이블에서 사원번호와 이름을 출력하세요

DECLARE
	vempno emp.empno%TYPE; --레퍼런스 변수를 선언
	vename emp.ename%TYPE;
BEGIN
	SELECT empno, ename INTO vempno, vename FROM emp WHERE ename = '김사랑';
	DBMS_OUTPUT.PUT_LINE('            '  ||   vempno  ||  '            '  ||  vename);
END;
/


DECLARE
	VENAME EMP.ENAME%TYPE;
	VJOB EMP.JOB%TYPE;
	VMGR EMP.MGR%TYPE;
	VDEPTNO EMP.DEPTNO%TYPE;
BEGIN
	SELECT ENAME, JOB, MGR, DEPTNO INTO VENAME, VJOB, VMGR, VDEPTNO FROM EMP WHERE ENAME = '오지호';
	DBMS_OUTPUT.PUT_LINE('       '  || VENAME || '     ' || VMGR || '       ' || VJOB || '     ' || VDEPTNO || '       ' );
END;
/

--IF ~ THEN ~ END IF 구문
--IF ~ THEN ~ ELSE ~ END IF
--IF ~ THEN ~ ELSE IF ~ ELSE ~ END IF 

문) 부서번호로 부서명 알아내기

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
  END IF;
  
  IF ( VDEPTNO = 20) THEN
  VDNAME := '인사부';
  END IF;
  
  IF ( VDEPTNO = 30) THEN
  VDNAME := '영업부';
  END IF;
  
  IF ( VDEPTNO = 40) THEN
  VDNAME := '전산부';
  END IF;
  
  DBMS_OUTPUT.PUT_LINE(' 사번   이름  부서명 ');
  DBMS_OUTPUT.PUT_LINE('-------------------');
  DBMS_OUTPUT.PUT_LINE('  ' || VEMPNO || '  ' || VENAME || '   ' ||  VDEPTNO );
END;
/
    
    
    
SELECT * FROM EMP;
SELECT * FROM DEPT;
    
문) 김사랑의 연봉구하기
요구사항 : 커미션을 받는 직원은 급여 *12 + COMM 이고 커미션을 받지 않는 직원은 급여 * 12

DECLARE
    VEMP EMP%ROWTYPE;
    ANNSAL NUMBER(7,2);
BEGIN
    SELECT * INTO VEMP FROM EMP WHERE ENAME = '김사랑';
IF (VEMP.COMM IS NULL) THEN
    ANNSAL := VEMP.SAL * 12;
ELSE
    ANNSAL := VEMP.SAL * 12 + VEMP.COMM;
END IF;

DBMS_OUTPUT.PUT_LINE('사번   이름   연봉');
DBMS_OUTPUT.PUT_LINE('-----------------');
DBMS_OUTPUT.PUT_LINE('  ' || VEMP.EMPNO || '  ' || VEMP.ENAME || '   ' || ANNSAL);
END;
/








