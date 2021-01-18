--2) OUT 매개변수
CREATE OR REPLACE PROCEDURE SEL_EMPNO 
    (VEMPNO IN EMP.EMPNO%TYPE,
    VENAME OUT EMP.ENAME%TYPE,
    VSAL OUT EMP.SAL%TYPE,
    VJOB OUT EMP.JOB%TYPE)
IS
BEGIN
    SELECT ENAME,SAL,JOB INTO VENAME, VSAL, VJOB FROM EMP WHERE EMPNO = VEMPNO;
END;
/
--
----바운드 변수선언
VARIABLE VAR_ENAME VARCHAR2(15);
VARIABLE VAR_SAL NUMBER;
VARIABLE VAR_JOB VARCHAR2(9);
--
----저장 프로시저 실행
EXECUTE SEL_EMPNO(1002,:VAR_ENAME,:VAR_SAL,:VAR_JOB);
--
----바운드 변수의 값을 출력하기
PRINT VAR_ENAME
PRINT VAR_SAL
PRINT VAR_JOB

SELECT * FROM EMP;

--저장 프로시저 사용하는 이유 : 클라이언트 응용프로그램에서 반복적으로 같은 처리를 할 때 매번 같은 SQL문들을 서버에 보내는 대신에
                        --미리 그 정의를 서버에 저장해 두고 클라이언트에서는 단순히 이 프로시저를 적당한 매개변수와 함께 호출만 해주면
                        --서버에 해당 프로시저의 정의를 읽어서 곧바로 실행하게 되는 것
                        --저장 프로시저를 사용하면 클라이언트  / 서버 간 네트워크 트래픽이 줄어들면
                        -- 서버에서는 미리 복잡한 쿼리를 모아서 좀 더 실행하기 좋은 형식으로 관리할 수 있다. 
                        -- 즉 처리 속도가 빠르다. 

COMMIT;