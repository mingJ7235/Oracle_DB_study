--Index

--인덱스란 SQL 명령문의 처리속도를 향상시키기 위해 컬럼에 대해 생성하는 오라클 객체
--오라클에서의 인덱스 내부 구조는 트리로 되어있음 

--인덱스 조회
SELECT * FROM user_indexes;
SELECT * FROM user_ind_columns;

DROP TABLE emp01;

CREATE TABLE emp01 
AS
SELECT * FROM emp;

--emp인덱스 확인
--emp01 인덱스 확인
SELECT * FROM USER_IND_COLUMNS WHERE table_name IN ('EMP', 'EMP01');

--emp01에 데이터 삽입
INSERT INTO emp01 SELECT * FROM emp01;
INSERT INTO emp01 (empno, ename) VALUES (2222,'syj');
SELECT DISTINCT empno, ename FROM emp01 WHERE ename = 'syj'


--인덱스 생성 ->emp01의 컬럼인 ename순서대로 트리를 만드는 것임. 그 컬럼 기준으로 이진트리를 달아줌.
CREATE INDEX idx_emp01_ename
	ON emp01 (ename);


--인덱스 삭제
DROP INDEX idx_emp01_ename;





