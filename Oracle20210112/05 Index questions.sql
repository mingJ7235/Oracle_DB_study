--인덱스 문제

1. 부서 번호를 생성하는 시퀀스 객체를 생성하여 시퀀스 객체를 이용하여 부서 번호를 자동으로 생성하도록 해보세요.

​1) 부서테이블에 부서 번호를 자동으로 부여하기 위해서 부서 테이블을 생성합니다.
CREATE TABLE emp_quetion(
	empno number(4) PRIMARY KEY,
	name varchar(10),
	sal number(5),
	hiredate date);

2) 생성된 부서 테이블에 기본키 제약 조건이 설정되었는지 살펴 보기

SELECT * FROM USER_CONSTRAINTS WHERE table_name IN ('EMP_QUETION');

​3) 부서 번호를 저장하는 deptno 컬럼을 기본키로 설정하였으므로 중복된 값을 가질 수 없습니다.
새로운 row를 추가할 때마다 시퀀스에 의해서 부서 번호가 자동으로 부여되도록 하기
CREATE SEQUENCE emp_no_seq
	START WITH 1
	INCREMENT BY 1;

DROP SEQUENCE emp_no_seq

4) 사원 정보 삽입해 보기
INSERT INTO EMP_QUETION VALUES (emp_no_seq.nextVal, '김민재', 200, sysdate);
INSERT INTO EMP_QUETION VALUES (emp_no_seq.nextVal, '홍아현', 120, sysdate);
INSERT INTO EMP_QUETION VALUES (emp_no_seq.nextVal, '고희광', 160, sysdate);


DROP TABLE EMP_QUETION;
SELECT * FROM emp_quetion;
아
2. 사원테이블의 직급 인덱스를 생성하기

CREATE INDEX emp_q_sal
	ON emp_quetion (sal);

------------------------------------------------------------------------------
--ppt 14장 사용자 권한

-- 권한을 주는것

--관리자 계정
--	sys : 모든 권한 (모든권한을 가지고 있음)
--	system : 계정 권한 (계정에 관련된 권한을 가지고 있음)
--
--sys로 접속하여 사용자 만들기, 계정 만들기 를 할 수 있음

show USER;










