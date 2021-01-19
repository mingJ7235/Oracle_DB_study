테이블에 데이터를 입력할 수 있는 시간 지정하기 
create table t_order ( no number, ord_code varchar2(10), ord_date date );

create or replace trigger to_order
before insert on t_order
begin
  if(to_char(sysdate, 'HH24:MI')  not between '09:50' and '10:00' ) then 
  raise_application_error(-20100,'허용시간이 아닙니다');
  end if;
end;
/
insert into t_order values(2,'c100',sysdate);

-- 트리거 예제
문) 테이블에 데이터를 입력할 수 있는 시간 지정하기

1.  사용할 테이블 만들기
CREATE TABLE T_ORDER ( NO  NUMBER, ORD_CODE VARCHAR2(10), OR_DATE DATE );

2. 생성한 테이블에 데이터를 입력할 때 입력시간이 13:00~18:00일 경우만 입력을 허용하고 그 외 시간일 경우는 에러를
   발생시키는 트리거를 만들기
   
CREATE OR REPLACE TRIGGER  T_ORDER
BEFORE INSERT ON T_ORDER
BEGIN 
  IF( TO_CHAR(SYSDATE, 'HH24:MI' ) NOT BETWEEN '13:00' AND '15:00' ) THEN 
    RAISE_APPLICATION_ERROR(-20100, '허용시간이 아닙니다') ;
  END IF;
END;
/

3. 시스템의 날짜 확인하기
SELECT SYSDATE FROM DUAL;

4. 삽입해보기 
INSERT INTO T_ORDER VALUES(3, 'C100', SYSDATE);
   
SELECT * FROM T_ORDER;


-----트리거 예제2
문) 테이블에 입력될 데이터 값을 지정하고 그 값이외에는 에러를 발생시키는 트리거를 생성합니다.(행레벨 트리거)
제품코드가 'C100'번인 제품이 입력될 경우 입력을 허용하고 나머지 제품은 모두 에러를 발생시키는 트리거를 작성합니다.

1. 트리거 생성하기

CREATE OR REPLACE TRIGGER T_ORDER2
  BEFORE INSERT ON T_ORDER
  FOR EACH ROW 
  BEGIN 
     IF(:NEW.ORD_CODE) NOT IN ('C500') THEN
        RAISE_APPLICATION_ERROR(-20200, '제품코드가 틀립니다!');
     END IF;
END;
/

INSERT INTO T_ORDER VALUES(4,'C100',SYSDATE); (0)

INSERT INTO T_ORDER VALUES(5,'C200',SYSDATE); (x)

--- 트리거 예제3
트리거의 작동 조건을 WHEN절로 더 자세히 정의하는 내용

문) 모든 제품에 트리거가 작동되는 것이 아니라 ORD_CODE가 'C500'인 제품에 대해서만 19:30~19:35분까지만 
입력되도록 허용하는 트리거를 만듭니다. 
'C500'이외의 다른 제품 코드는 시간에 관계없이 정상적으로 입력이 됩니다.

1. 트리거 생성하기
CREATE OR REPLACE TRIGGER T_ORDER3
 BEFORE  INSERT  ON  T_ORDER
 FOR EACH ROW 
 WHEN ( NEW.ORD_CODE = 'C500')
 BEGIN
   IF(TO_CHAR(SYSDATE,'HH24:MI' ) NOT BETWEEN '14:00' AND '14:10' ) THEN
   RAISE_APPLICATION_ERROR(-20300, 'C500제품의 입력허용시간이 아닙니다');
   END IF;
 END;
 /

INSERT INTO T_ORDER VALUES(5,'C400',SYSDATE); 

DROP TRIGGER T_ORDER2;


-- 트리거 예제4

문) 급여정보를 자동으로 추가하는 트리거 작성하기

1. 급여 테이블(SAL01) 만들기
DROP TABLE SAL01;

CREATE TABLE SAL01 (
   SALNO NUMBER(4) PRIMARY KEY,
   SAL NUMBER(7,2),
   EMPNO NUMBER(4) REFERENCES EMP02(EMPNO) );
   
DROP TABLE EMP02;

CREATE TABLE EMP02 (
  EMPNO NUMBER(4) PRIMARY KEY,
  ENMAE VARCHAR2(20),
  JOB VARCHAR2(20) );

2. 급여번호를 자동 생성하는 시퀀스 생성하기
CREATE SEQUENCE SAL01_SALNO_SEQ;

3. 트리거 작성하기

CREATE OR REPLACE TRIGGER  TRG_02
AFTER  INSERT ON EMP02
FOR EACH ROW
BEGIN
   INSERT INTO SAL01 VALUES( SAL01_SALNO_SEQ.NEXTVAL, 100, :NEW.EMPNO);  
END;
/

4. 사원테이블(EMP02)에 로우가 추가되면 자동으로 수행할 트리거가 생성됩니다.
INSERT INTO EMP02 VALUES(500,'B','과장');
SELECT * FROM EMP02;
SELECT * FROM SAL01;

문) 급여정보를 자동 추가하는 트리거 제거하기
DROP TRIGGER TRG_02;

--------------------------------------
INSERT 트리거 작성하기
1. 사용할 테이블 만들기
1) 상품 테이블
CREATE TABLE 상품(
   상품코드 CHAR(6) PRIMARY KEY,
   상품명 VARCHAR2(12) NOT NULL,
   제조사 VARCHAR2(12),
   소비자가격 NUMBER(8),
   재고수량 NUMBER DEFAULT 0 );
   
2) 입고 테이블 생성하기
  CREATE TABLE 입고 (
    입고번호 NUMBER(6) PRIMARY KEY, 
    상품코드 CHAR(6) REFERENCES 상품(상품코드),
    입고일자 DATE DEFAULT SYSDATE,
    입고수량 NUMBER(6),
    입고단가 NUMBER(8),
    입고금액 NUMBER(8) );
    
3) 자료 삽입
INSERT INTO 상품 VALUES('A00001','세탁기','LG',200, 0);
INSERT INTO 상품 VALUES('A00002','컴퓨터','LG',700, 0);
INSERT INTO 상품 VALUES('A00003','냉장고','삼성',600, 0);

4) 입고 테이블에 상품이 입력되면 입고수량을 상품테이블의 재고 수량에 추가하는 트리거를 작성

(1) 입고 트리거 생성하기
CREATE OR REPLACE TRIGGER TRG_04
  AFTER  INSERT ON 입고
  FOR EACH ROW
BEGIN
  UPDATE 상품 SET 재고수량 = 재고수량 + :NEW.입고수량
  WHERE  상품코드 = :NEW.상품코드;
END;
/

5) 트리거를 실행시킨 후 입고 테이블에 행을 추가합니다. 입고 테이블에는 물론 상품 테이블의 재고 수량이 변경됨을 확인할 수 있습니다.
(1) 상품 입고하기
INSERT INTO 입고 (입고번호, 상품코드, 입고수량, 입고단가, 입고금액) VALUES(1,'A00001',5,320,1600);

(2) 입고테이블 조회하기
SELECT * FROM 입고;

(3) 상품 정보 조회하기
SELECT * FROM 상품;

4) 입고테이블에 상품이 입력되면 자동으로 상품 테이블의 제고 수량이 증가하게 됩니다.
입고 테이블에 또다른 상품을 입력합니다. 







