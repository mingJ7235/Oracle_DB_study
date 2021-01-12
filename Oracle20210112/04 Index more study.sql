--인덱스를 사용해야하는 경우
-- 1)테이블에 행의 수가 많을 때
-- 2) where문에 해당 칼럼이...

--인덱스의 종류
-- => 고유 인덱스, 비고유인덱스, 단일 인덱스, 결합 인덱스, 함수 기반 인덱스

-- 고유 인덱스 : 유일한 값을 가지는 컬럼에대해서 생성하는 인덱스

-- 결합 인덱스 : 두개 이상의 컬럼으로 인덱스를 구성하는것

-- 함수 기반 인덱스 : 검색 조건으로 where sal=300이 아니라 where sal*12 = 3600과 같이 select문 where절에 산술 표현 또는 함수를 사용하는 경우
		-- 만약 sal 컬럼에 인덱스가 걸려 있다면 인덱스를 타서 빠를 것이라고 생각하지만 실상은 sal 컬럼에 인덱스가 있어도 sal * 12는 인덱스를 타지 못한다. 
		-- 이러한 수식으로 검색하는 경우가 많다면 수식으로 함수를 적용하여 인덱스를 만들 수 있다.
		-- sal*12로 인덱스를 만들어 놓으면, sal * 12 가 검색 조건으로 사용될 시 해당 인덱스를 타게 된다. 

DROP TABLE dept01;

CREATE TABLE DEPT01 
AS
SELECT * FROM dept WHERE deptno=100;

SELECT * FROM dept01;

INSERT INTO dept01 VALUES (10, '인사과', '서울');
INSERT INTO dept01 VALUES (20, '총무과', '대전');
INSERT INTO dept01 VALUES (30, '교육팀', '대전');

--1> 고유 인덱스 지정하기
CREATE UNIQUE INDEX idx_dept01_deptno
	ON dept01 (deptno); --

CREATE UNIQUE INDEX idx_dept01_Loc
	ON dept01 (loc); --에러남 -> 왜? 대전이 두개기때문에! duplicate한 값이 이미 들어가있으므로 지정이안댐!
	
CREATE UNIQUE INDEX idx_dept01_dname
	ON dept01 (dname); --얘는 됨
	
--결론 : 고유인덱스를 지정하는것은 고유한 값이 지정되어야 한다! 
	

--2> 비 고유 인덱스 지정하기 (unique가 없다)

CREATE INDEX idx_dept01_Loc
	ON dept01 (loc); 
-- 결론 : 고유인덱스 컬럼에 저장된 데이터가 고유하지 않아도 (대전이 2개여도) 인덱스로 지정할 수 있다!


-- 우선 인덱스 삭제...
DROP INDEX idx_dept01_Loc;
DROP INDEX idx_dept01_deptno
DROP INDEX idx_dept01_dname

--3 >결합 인덱스
CREATE INDEX idx_dept01_deptno_dname
	ON dept01 (deptno, dname);

SELECT * FROM user_ind_columns WHERE table_name IN ('DEPT01');

--deptno 인덱스 생성 -> dname 인덱스 생성 -> 결합 인덱스 생성해보기
DROP INDEX idx_dept01_deptno_dname;

CREATE UNIQUE INDEX idx_dept01_deptno
	ON dept01 (deptno);

CREATE UNIQUE INDEX idx_dept01_dname
	ON dept01 (dname); 

CREATE INDEX idx_dept01_deptno_dname
	ON dept01 (deptno, dname);

SELECT * FROM user_ind_columns WHERE table_name IN ('DEPT01');
--각각 인덱스를 만들고 그 두개를 다시 결합하여 결합 인덱스를 생성해도 가능하다! 

--이번엔 반대로 결합을 다 해보고 각각의 인덱스를 만들어 보는 것 해보기
DROP INDEX idx_dept01_deptno
DROP INDEX idx_dept01_dname
DROP INDEX  idx_dept01_deptno_dname

CREATE INDEX idx_dept01_deptno_dname
	ON dept01 (deptno, dname);

CREATE UNIQUE INDEX idx_dept01_deptno
	ON dept01 (deptno);

CREATE UNIQUE INDEX idx_dept01_dname
	ON dept01 (dname); 


--4> 함수 기반 인덱스
CREATE INDEX idx_emp01_annsal
	ON emp01( sal );

SELECT * FROM user_ind_columns WHERE table_name IN ('EMP01');

SELECT * FROM emp01 WHERE sal*12 >= 3600; --계산식이라 인덱스가 풀어진다. 그래서 인덱스 컬럼에 넣어주는것이다.

DROP INDEX idx_emp01_annsal

CREATE INDEX idx_emp01_annsal
	ON emp01( sal*12 );

SELECT * FROM emp01 WHERE sal*12 >= 3600; -- 이제는 제대로 조회가 된다. 

--인덱스 수정하기
-- 인덱스를 생성된 후에 새로운 행이 추가되거나 삭제 될 수 있다.
--이때 인덱스로 사용된 컬럼 값이 변경 될 수 도 있다.
-- 이럴경 우 본 테이블의 자료 추가, 삭제, 변경 작업이 일어날 때 해당 테이블에 걸린 인덱스의 내용도 함께 수정되어야 한다. 
-- 이때 사용한다. 

ALTER INDEX idx_dept01_deptno rebuild;









