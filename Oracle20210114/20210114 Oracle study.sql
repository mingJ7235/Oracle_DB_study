SET serveroutput ON;

BEGIN
	dbms_output.put_line('Hello');
END;
/

DECLARE 
	vempno NUMBER (4);
	vename varchar2(10);
BEGIN 
	vempno := 1001;
	vename := '김사랑';
	dbms_output.put_line('  사  번   이  름');
	DBMS_OUTPUT.PUT_LINE('-------------------');
	DBMS_OUTPUT.PUT_LINE('     '  || VEMPNO || '       '  || VENAME);
END;
/

-- 스카라 변수 : SQL 에서 사용하던 자료형과 거의 유사함, 숫자인 경우 NUMBER, 문자형 VARCHAR2
	EX> vempno NUMBER (4);

-- 레퍼런스 변수 : 이전에 선언된 다른 변수 또는 데이터베이스 컬럼에 맞추어 변수를 선언하기 위해 %TYPE속성을 사용할 수 있다. 
	EX> vempno emp.empno%TYPE; (vempno의 타입은 emp테이블에 empno컬럼의 타입과 동일한 타입이다. 라고 말하는 것 )
	%TYPE 속성을 사용하여 선언한 VEMPNO 변수는 해당 테이블 (EMP)의 해당 컬럼 (EMPNO)의 자료형과 크기를 그대로 참조해서 정의한다. 
	
--%ROWTYPE 변수  :  특정테이블의 로우(row=행=레코드=튜플)단위로 참조해서 레퍼런스 변수선언하기
	vemp emp%rowtype;	 (emp테이블의 한 행 전체에 대한 변수)
	
SELECT * FROM emp;

--ppt 14장 사용자 권한

-- 권한을 주는것

--관리자 계정
--	sys : 모든 권한 (모든권한을 가지고 있음)
--	system : 계정 권한 (계정에 관련된 권한을 가지고 있음)
--
--sys로 접속하여 사용자 만들기, 계정 만들기 를 할 수 있음

show USER;


SHOW USER;

CREATE TABLE DOCTOR
	(DOCTOR_ID NUMBER(4) NOT NULL CONSTRAINT DOCTOR_ID_PK PRIMARY KEY,
	 NAME VARCHAR2(10) NOT NULL,
	 POSITION_D VARCHAR2(10) NOT NULL,
	 SEX VARCHAR2(10),
	 PHONE VARCHAR2(11),
	 EMAIL VARCHAR2(25),
	 JOB VARCHAR2(20)
	);
SELECT * FROM DOCTOR;

CREATE TABLE NURSE
	(NURSE_ID NUMBER(4) NOT NULL CONSTRAINT NURSE_ID_PK PRIMARY KEY,
	 NAME VARCHAR2(10) NOT NULL,
	 POSITION_N VARCHAR2(10) NOT NULL,
	 SEX VARCHAR2(10),
	 PHONE VARCHAR2(11),
	 EMAIL VARCHAR2(25),
	 JOB VARCHAR2(20)
	);

CREATE TABLE PATIENT
	(PATIENT_ID NUMBER(4) NOT NULL CONSTRAINT PATIENT_ID_PK PRIMARY KEY,
	 NAME VARCHAR2(10) NOT NULL,
	 JUMINNUM VARCHAR2(10) NOT NULL,
	 SEX VARCHAR2(10),
	 PHONE VARCHAR2(11),
	 EMAIL VARCHAR2(25),
	 JOB VARCHAR2(20),
	 ADDRESS VARCHAR2(20),
	 DOCTOR_ID NUMBER(4) CONSTRAINT PATIENT_DOCTOR_ID_FK REFERENCES DOCTOR(DOCTOR_ID),
	 NURSE_ID NUMBER(4) CONSTRAINT PATIENT_NURSE_ID_FK REFERENCES NURSE(NURSE_ID)
	);

CREATE TABLE TREAT 
	(TREAT_ID NUMBER(4) NOT NULL CONSTRAINT TREAT_ID_PK PRIMARY KEY,
	 TREAT_CON VARCHAR2(20),
	 TREAT_DATE DATE,
	 DOCTOR_ID NUMBER(4) CONSTRAINT TREAT_DOCTOR_ID_FK REFERENCES DOCTOR(DOCTOR_ID),
	 PATIENT_ID NUMBER(4) CONSTRAINT TREAT_PATIENT_ID_FK REFERENCES PATIENT(PATIENT_ID)
	);

CREATE TABLE CHART
	(CHART_ID NUMBER(4) NOT NULL CONSTRAINT CHART_ID_PK PRIMARY KEY,
	 CHART_CON VARCHAR2(20),
	 DOCTOR_ID NUMBER(4) CONSTRAINT CHART_DOCTOR_ID_FK REFERENCES DOCTOR(DOCTOR_ID),
	 URSE_ID NUMBER(4) CONSTRAINT CHART_NURSE_ID_FK REFERENCES NURSE(NURSE_ID),
	 PATIENT_ID NUMBER(4) CONSTRAINT CHART_PATIENT_ID_FK REFERENCES PATIENT(PATIENT_ID)
	);

--DOCTOR 테이블 삽입
INSERT INTO DOCTOR VALUES (1000, '김민재', '외과', '남', '01064707235', '3mins1@naver.com', '과장');
INSERT INTO DOCTOR VALUES (1001, '이나라', '내과', '여', '01012342223', 'nara@naver.com', '전문의');
INSERT INTO DOCTOR VALUES (1002, '오이세', '소아과', '남', '01044223322', 'ise@naver.com', '내과');

SELECT * FROM DOCTOR;

--NURSE 테이블 삽입
INSERT INTO NURSE VALUES (2000, '김아영', '외과', '남', '01023241122', 'ay@naver.com', '수간호사');
INSERT INTO NURSE VALUES (2001, '윤승아', '피부과', '남', '01023232321', 'adfw@naver.com', '간호사');
INSERT INTO NURSE VALUES (2002, '김성완', '소아과', '남', '01011223344', 'sser@naver.com', '보조');

SELECT * FROM NURSE;

--PATIENT 테이블 삽입

INSERT INTO PATIENT VALUES (3000, '고희광', '920111', '남', '01023232323', 'sfd@gmail.com', '회사원', '서울시', 1000, 2000);
INSERT INTO PATIENT VALUES (3001, '김이하', '910111', '여', '01024121231', 'sfd23@gmail.com', '회사원', '서울시', 1001, 2000);
INSERT INTO PATIENT VALUES (3002, '수찬희', '950111', '남', '01021425664', 'sfd123@gmail.com', '회사원', '서울시', 1000, 2002);

SELECT * FROM PATIENT;

--TREAT 테이블 삽입

INSERT INTO TREAT VALUES (4000, '수술함', SYSDATE, 1000, 3001);
INSERT INTO TREAT VALUES (4001, '약처방', SYSDATE, 1000, 3001);
INSERT INTO TREAT VALUES (4002, '회복함', SYSDATE, 1001, 3002);

SELECT * FROM TREAT;

CREATE TABLE CHART
	(CHART_ID NUMBER(4) NOT NULL CONSTRAINT CHART_ID_PK PRIMARY KEY,
	 CHART_CON VARCHAR2(20),
	 DOCTOR_ID NUMBER(4) CONSTRAINT CHART_DOCTOR_ID_FK REFERENCES DOCTOR(DOCTOR_ID),
	 URSE_ID NUMBER(4) CONSTRAINT CHART_NURSE_ID_FK REFERENCES NURSE(NURSE_ID),
	 PATIENT_ID NUMBER(4) CONSTRAINT CHART_PATIENT_ID_FK REFERENCES PATIENT(PATIENT_ID)
	);


--CHART 테이블 삽입

INSERT INTO CHART VALUES (5000, '양호해짐', 1001, 2002, 3001);
INSERT INTO CHART VALUES (5001, '악화됨', 1001, 2000, 3001);
INSERT INTO CHART VALUES (5002, '내일 퇴원', 1000, 2001, 3002);


SELECT * FROM CHART;





