--날짜 관련 DB 예제
SELECT to_char(sysdate, 'yyyy-mm-dd') from dual;
SELECT to_char(hiredate, 'yyyy/mm/dd') as 입사일1, 
        to_char(trunc(hiredate, 'MONTH'), 'yyyy/mm/dd') 입사일2,
                        --trunc : 달을 기준으로 절삭함 ( 모든 일이 다 1일로나옴)
        to_char (round(hiredate, 'MONTH'), 'yyyy/mm/dd') 입사일3,
                        --round : 16일 이후로 월 기준으로 반올림이된다. 흠...MONTH썻으니까
        to_char(round(hiredate,'D'), 'yyyy/mm/dd') 입사일4 from emp;
                        
SELECT ename, sysdate 오늘, to_char(hiredate, 'yyyy/mm/dd') 입사일, 
        trunc(MONTHS_BETWEEN(SYSDATE, HIREDATE)) 근무달수 FROM emp;

SELECT ename, sysdate 오늘, to_char(hiredate, 'yyyy/mm/dd') 입사일, 
        round(MONTHS_BETWEEN(SYSDATE, HIREDATE)) 근무달수 FROM emp;

SELECT ename, to_char(add_months(hiredate, 6), 'yyyy/mm/dd') 입사6개월_후 from emp;

SELECT to_char(sysdate, 'yyyy/mm/dd') 오늘,
        to_char(NEXT_DAY(SYSDATE, 2),'yyyy/mm/dd')월요일
        from dual;

SELECT ename, to_char(hiredate, 'yyyy/mm/dd') 입사일,
    to_char(last_day(hiredate), 'yyyy/mm/dd') 마지막날짜 from emp;


-- comm이 null
INSERT INTO EMP VALUES(1020, '조이성', '사원', 1006, to_date('2020-12-29','yyyy-mm-dd'), 250, NULL, 10);

--날짜가 null
INSERT INTO EMP VALUES(1021, '조이성', '사원', 1006, NULL, 250, 500, 10);

-- 문자가 null
INSERT INTO EMP VALUES(1022, NULL, '사원', 1006, to_date('2020-12-29','yyyy-mm-dd'), 250, 500, 10);
INSERT INTO EMP VALUES(1023, '조이성', NULL, 1006, to_date('2020-12-29','yyyy-mm-dd'), 250, 500, 10);

-- Null 을 다른 값으로 변환하는 함수
SELECT comm, nvl(comm, 0) FROM emp;
SELECT hiredate, nvl(hiredate, to_date(sysdate, 'yyyy-mm-dd')) FROM emp;
SELECT ename, nvl(ename, '홍길동'), job, nvl(job, '사원') FROM emp;

--nvl2 함수
SELECT ename, sal, comm,
        NVL2(comm, sal*12+comm, sal*12)
        FROM emp ORDER BY deptno;
       
--nullif 함수

SELECT nullif('a', 'a'), nullif('a', 'b') FROM dual;

SELECT COALESCE(NULL, 'a','b','c','d') FROM dual;

SELECT * FROM emp;





