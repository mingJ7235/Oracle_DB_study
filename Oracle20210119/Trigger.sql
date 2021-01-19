-- 트리거 예제
문) 테이블에 데이터를 입력할 수 있는 시간 지정하기

1.  사용할 테이블 만들기
create table t_order (no number, ord_code varchar2(10), or_date date);

2. 생성한 테이블에 데이터를 입력할 때 입력시간이 13:00~15:00일 경우만 입력을 허용하고 그 외 시간일 경우는 에러를
   발생시키는 트리거를 만들기

CREATE OR REPLACE TRIGGER T_ORDER
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
INSERT INTO T_ORDER VALUES(3, 'C-100', SYSDATE);
   
SELECT * FROM T_ORDER;


--트리거 예제2
문) 테이블에 입력될 데이터 값을 지정하고 그 값이외에는 에러를 발생시키는 트리거를 생성합니다. (행레벨 트리거)
제품코드가 'c100'번인 제품이 입력될 경우 입력을 허용하고 나머지 제품은 모두 에러를 발생시키는 트리거를 작성합니다.

1. 트리거 생성하기

create or replace trigger t_order2
    before insert on t_order
    for each row
    begin
        if(:new.ord_code) not in ('c100') then
            raise_application_error(-20200, '제품코드가 틀립니다!');
        end if;
end;
/
