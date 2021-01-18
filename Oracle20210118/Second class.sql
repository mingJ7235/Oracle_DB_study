--저장함수

--저장함수는 저장 프로시저와 거의유사한 용도. 차이점은 리턴값을 가진다. 

-- 모드 : in, out, inout

SELECT * FROM EMP;
--문) 특별 보너스를 지급하기 위한 저장 함수를 작성하기. 보너스는 그병의 200%를 지급한다.

--1. 저장함수를 만든다.

CREATE OR REPLACE FUNCTION CAL_BONUS(
    VEMPNO IN EMP.EMPNO%TYPE)
    RETURN NUMBER
IS
    VSAL NUMBER(7,2);
BEGIN 
    SELECT SAL INTO VSAL FROM EMP WHERE EMPNO = VEMPNO;
    RETURN VSAL + (VSAL * 2);
END;
/

--2. 바운드 변수 선언하기

VARIABLE VAR_RES NUMBER;

--3. 저장 함수 실행하기

EXECUTE :VAR_RES := CAL_BONUS(1001);


--4. 바운드 변수 출력하기

PRINT VAR_RES;

--5. 저장함수를 호출하는 SQL문장

SELECT SAL, CAL_BONUS(1001) FROM EMP WHERE EMPNO=1001;

