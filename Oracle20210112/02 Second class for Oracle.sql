--8. 아래 화면과 같이 교수 테이블을 교수 번호로 정렬하되 3건씩 분리해서 급여 합계와 급여 평균을 출력하세요
--재 해석
SELECT * FROM PROFESSOR ;

--round는 반올림 
SELECT profno, name, pay, sum(pay), round(avg(pay), 1) 
FROM (SELECT profno, name, pay, rownum num FROM professor) 
GROUP BY ceil(num/3), ROLLUP ((profno, name, pay, num))
ORDER BY ceil(num/3);

--시퀀스와 인덱스
--시퀀스 : 테이블내의 유일한 숫자를 자동으로 생성하는 자동 번호 발생기 ! 
-- 시퀀스를 기본키로 사용하게되면 사용자의 부담을 줄일 수 있다. 

CREATE SEQUENCE sequence_name 
	START WITH 1 -- 시작하는 숫자
	INCREMENT BY 1 -- 늘어나는 단위
	MAXVALUE 10 --최대 숫자
	MINVALUE 2 -- 최소 숫자
	CYCLE / nocycle -- 사이클을 돌게하는지 마는지 (maxvalue에 도달하면 다시 처음으로 돌아가게하는지 말지)
	
CREATE SEQUENCE dept_deptno_seq
	START WITH 10
	INCREMENT BY 10 ;
	
SELECT * FROM user_sequences WHERE SEQUENCE_name IN ('DEPT_DEPTNO_SEQ');

--nextVal은 현재값의 다음 값을 보여준다. 
SELECT dept_deptno_seq.nextVal FROM dual;
--currVal = current value 즉, 현재 값을 보여줌
SELECT dept_deptno_seq.currVal FROM dual;

CREATE SEQUENCE sample_seq;

SELECT sample_seq.currVal FROM dual;

SELECT * FROM USER_SEQUENCES WHERE sequence_name IN ('SAMPLE_SEQ');

--활용하기

CREATE SEQUENCE emp_seq
	START WITH 1
	INCREMENT BY 1
	MAXVALUE 10;

DROP TABLE emp01;

CREATE TABLE emp01 (
	empno number(4) PRIMARY KEY,
	name varchar(10),
	hiredate date);

SELECT * FROM user_constraints WHERE table_name IN ('EMP01');

INSERT INTO emp01
	VALUES (emp_seq.nextval, '홍길동', sysdate);

SELECT * FROM emp01;
DROP SEQUENCE emp_seqno --시퀀스 삭제

CREATE SEQUENCE emp_seqno
	START WITH 1000
	INCREMENT BY 10
	MAXVALUE 1500;

ALTER SEQUENCE emp_seq
	INCREMENT BY 200
	MAXVALUE 2000
	CYCLE cache 10;

--cache는 미리 다음 시퀀스를 만들어 놓는것이다. 즉 맥스 벨류가 1600이고 100씩증가하면 캐쉬는 16이 최대한계치다. 
-- cache는 맥스값이 20이다. 





	
	
	
	
	
	
	
	
	