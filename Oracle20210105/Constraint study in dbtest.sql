--제약조건 공부

DESC user_constraints;

--ppt126

--user constraints 데이터 딕셔너리에 자주 사용되는 컬럼 조회 
--즉 db에 저장해놓은 constraint 들을 볼수있는 것임
--테이블별로 가능
select owner, constraint_name, constraint_type from user_constraints;

select * from user_constraints;



create table emp02 (
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    hiredate date,
    deptno number(2));
    
desc emp02;
drop table emp02;   


--not null 제약 조건
insert into emp02
    values (null, null, '사원', sysdate, 20);
    
create table emp02 (
    empno number(4) not null,
    ename varchar2(10) not null,
    job varchar2 (9),
    hiredate date,
    deptno number(2));
    
insert into emp02
    values (1010, '인사부', '사원', sysdate, 20);
commit;


--유일한 값만 허용하는 unique제약 조건
create table emp03 (
    empno number(4) unique,
    enmae varchar2(10) not null,
    job varchar2(9),
    deptno number(2) );

--constraints 조회 (EMP03 테이블)
select * from user_constraints where table_name = 'EMP03'; --emp03은 대문자로 써줘야함

    --데이터삽입
    insert into emp03 values (1010, '홍길동', '사원', 10);
    insert into emp03 values (1020, '이순신', '사원', 20);
    insert into emp03 values (null, '정현희', '대리', 30); --null은 또 들어간다 왜? null도 데이터고, 유일해야하는 데이터입력이되니까
    --unique 조건 위배
    insert into emp03 values (1020, '홍아현', '사장', 30);
    
--제약조건에 명칭을 부여하기 
-- 이용분야 : 제약조건의 복합으로 사용해야되는 경우, 제약조건 일시정지할 경우 
    
create table emp04 (
    empno number(4) constraint emp04_empno_UK UNIQUE, 
    ename varchar2(10) constraint emp04_ename_NN NOT NULL,
    job varchar2(9),
    deptno number(2));


select * from user_constraints where table_name = 'EMP04';

--primary key -> unique와 not null제약조건 모두 갖고있음

create table emp05 (
    empno number(4) constraint emp05_empno_PK primary key,
    ename varchar2(10) constraint emp05_ename_NN not null,
    job varchar2(9),
    deptno number(2));

--정상으로 데이터 넣기
insert into emp05 values (1010, 'a', '사원', 10);

--primary key 에 위배되도록 입력
insert into emp05 values (1010, 'a', '사원', 10); -- unique  위배
insert into emp05 values (null, 'a', '사원', 10); --not null 위배

--제약조건 상태 보기
select * from user_constraints where table_name = 'EMP05';
select constraint_name, constraint_type, r_constraint_name, table_name from user_constraints where table_name = 'EMP05';


--Foreign key 
--외래키는 부모테이블, 자식테이블 개념이 필요
--부모테이블 : 주체가 되는 테이블 
--자식테이블 : 종속된 테이블

--foreign key 제약조건
create table emp06 (
    empno number(4) constraint emp06_empno_PK primary key,
    ename varchar2(10) constraint emp06_ename_NN not null,
    job varchar2(9),
    deptno number(2) constraint emp06_deptno_FK references dept(deptno)); --dept 테이블의 deptno을 reference하는 foreign key임

desc dept;
select * from user_constraints where table_name = 'DEPT';

--DEPT 테이블 자료 검색
select * from dept;

--자료정상으로 입력하기
insert into emp06 values (1010, '홍길동', '사원', 10);
insert into emp06 values (1020, '홍길동', '사원', 30);

--컬럼명 조회 (부모 테이블의 pk를 조회하는법)
select constraint_name, table_name, column_name from user_cons_columns where table_name = 'DEPT';

--emp07테이블을 만들기 외래키를 loc로 삼기

create table emp07 (
    empno number(4) constraint emp07_empno_pk primary key,
    enmae varchar2(10) constraint emp07_ename_nn not null,
    job varchar2(9),
    deptno number(2),
    loc varchar2(13) constraint emp07_loc_fk references dept(loc)); --error가 난다 왜? dept의 loc가 pk가 아니므로 

--check 제약 조건

create table emp08 (
    empno number(4) constraint emp08_empno_pk primary key,
    enmae varchar2(10) constraint emp08_ename_nn not null,
    sal number(7,2) constraint emp08_sal_ck check (sal between 500 and 5000),
    gender varchar2(1) constraint emp08_gender_ck check (gender in ('M', 'm', 'F', 'f')));

--정상입력
insert into emp07 values (1010, '홍길동', 1000, 'M');

--위배입력



    
    