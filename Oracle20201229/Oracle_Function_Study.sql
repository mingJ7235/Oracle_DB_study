-----3장 오라클 함수

select * from dual;
--2의 3승 계산
select power (2,3) from dual;
--반올림 (소수점 1자리까지)
select round (2.56, 1) from dual;
--나머지 구하기
select mod (10,3) from dual;

--문자 처리 함수
SELECT 'Welcome to Oracle' , upper ('Welcome to Oracle'), lower ('Welcome to Oracle'), initcap ('Welcome to Oracle') from dual;

--바이트 수 구하기 (b)
SELECT LENGTHB ('Welcome to Oracle 한글') FROM dual;
--글자수 구하기
SELECT LENGTH ('Welcome to Oracle 한글') FROM dual;
--2개의 문자열의 값 연결 (2가지만 가능함) concat
select concat('ab', 'cd') from dual;
--2번째 글자부터 3개만큼만 찍어라 -> substr이라는 함수
select substr('Welcom to Oracle',2,3) from dual;
select substr('안녕하세요!',2,3) from dual;
--바이트 단위로 계산해서 문자 떼기
select substrb('Welcom to Oracle',2,4) from dual;
select substrb('안녕하세요!',4,3) from dual;--한글1자는 3바이트를 차지하기 때문에 결과가 달라진다, 그리고 바이트로 계산해서 몇번째인지도 계산
select substrb('가나다라마바',7,6) from dual;--다라 만 출력하기
--instr 문자
SELECT instr('데이터베이스이','이',4,2) FROM dual; --instr은 한글을 1바이트로 본다 (b가 붙지않으니까)
--             대상자료    찾을문자 시작기준위치, 기준위치에서 몇번째인지
--날짜형 <-> 문자형
SELECT sysdate, to_char(sysdate, 'yyyy-mm-dd, AM HH:MI:SS') from dual;
SELECT to_date('2020/12/29', 'yyyy/mm/dd') from dual;

--숫자형 <->문자형
SELECT to_char(123400) from dual;
SELECT to_char(123400000.5786,'L999,999,999.9') from dual; --문자로 바꾸면서 형식을 바꾸는 것임
SELECT to_number('542') from dual;
SELECT to_char(542) from dual;

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













