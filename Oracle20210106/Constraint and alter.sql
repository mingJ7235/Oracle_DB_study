select * from emp01;
select * from dept;
drop table emp02;
--컬럽 레벨 방식의 제약조건

create table emp01 (
    empno number(4) primary key,
    ename varchar2(10) not null,
    job varchar2(9) unique,
    deptno number(2) references dept(deptno));
    
--테이블 레벨 방식의 제약조건

create table emp02 (
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    deptno number(2),
    primary key(empno), 
    unique (job),
    foreign key (deptno) references dept(deptno));
    
--복합키 : 2개이상의 컬럼이 하나의 기본키를 구성하는 경우
--이경우에는 테이블 레벨 방식의 제약조건으로 줘야한다. 
drop table member02;

create table member01 (
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    constraint member01_name_phone_pk primary key (name, phone));

select constraint_name, table_name, column_name from user_cons_columns where table_name = 'MEMBER01';
desc member01; 

--member01에 입력하기
insert into member01 values ('a', 'seoul', '123');

--복합기 3개 만들기 연습
create table member02 (
    name varchar2(10),
    address varchar2(30),
    phone varchar2(16),
    constraint member02_name_phone_pk primary key (name, address, phone));    
    
--정상입력
insert into member02 values ('a', 'seoul', '123');
insert into member02 values ('a', 'seoul', '123');    

--제약조건 변경하기
--이미존재하는 테이블에 제약조건을 추가하거나 삭제하고 변경하는 방법 : ALTER TALBE문을 이용해야한다. 

DROP TABLE emp01;   
    

create table emp01(
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    deptno number(2));
    
--제약조건 검색하기
select constraint_name, table_name, column_name from user_cons_columns where table_name = 'MEMBER01';
select * from user_constraints where table_name in ('EMP01');
select constraint_name, table_name, column_name from user_cons_columns where table_name = 'EMP01';

--제약조건을 추가하기 (alter ~~ add constraint ~~)
alter table emp01
    add constraint emp01_empno_pk primary key(empno);
alter table emp01
    add constraint emp01_deptno_fk foreign key (deptno) references dept(deptno);

--제약조건 not null은 modify로 변경!! (alter table 테이블명 modify 컬럼명 constraint 제약키명 not null)
--not null <-> null 을 이렇게 서로 변경하면댐
alter table emp01 
    modify ename not null;

alter table emp01
    modify ename null;


--제약조건을 제거하기 (drop constraint)

alter table emp01 
    drop constraint emp01_ename_nn;
    
alter table emp01
    drop constraint emp01_empno_fk;

select constraint_name, table_name, column_name from user_cons_columns where table_name = 'EMP01';

-- 제약조건 제거하기2 (이름을 쓰지않고 바로 제거
alter table emp01
    drop primary key;

commit;





    
    
    