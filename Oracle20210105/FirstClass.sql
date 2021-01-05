--insert study ppt 118쪽

--DML : 데이터 조작 언어 

create table dept01 (
    deptno number(4),
    dname varchar2(14),
    loc varchar2(13));

--insert 전체형식으로 다 입력하기

insert into dept01 (deptno, dname, loc) values (10, '경리부', '서울');
insert into dept01 (loc, dname, deptno) values ('인천', '전산부', 20); --컬럼 순서가 달라도 기입 가능

--생략하기(구조순서대로)
insert into dept01 values (30, '영업부', '부산');
insert into dept01 values (30, '영업부', 10);
insert into dept01 values ('30', '영업부', 10);

select * from emp02;

--null에 대하여 입력하기

insert into dept01 values (40, '인사부', null);
insert into dept01 values (50, '인사부', ''); --''를하는것도 null이되는것임
insert into dept01 (deptno, dname) values (20, '경리부);

drop table emp02;

create table emp02 (
    empno number(4),
    ename varchar2(10),
    job varchar2(9),
    hiredate date,
    deptno number(2));
    
--테이블의 구조보기
desc emp02;

INSERT INTO emp02 VALUES ( 1001, '김사랑','사원','05/1월/21', 20);
insert into emp02 values ( 1002, '한예슬', '대리', to_date('2021/01/10','yyyy/mm/dd'), 10);

--시스템에서 오늘 날짜로 날짜의 자료를 넣기
insert into emp02 values (1003, '최경희', '사원', sysdate, 30);

select * from dept01;
--데이터 수정하기 update
update dept01
    set dname='생산부'
    where deptno = 10;

commit;

update dept01
    set dname='총무부', loc ='서울'
    where deptno = 50;

update dept01
    set loc = '부산'
    where dname = '영업부';
    
update dept01
    set deptno = deptno + 100;

--commit한 상태로 돌아감
rollback;

--데이터 삭제 (행, 레코드, 튜플)
delete dept01 where loc='부산';
delete dept01 where deptno = 1020 and dname = '전산부';



--문제 1

create table employee03 (
    empno number(4) not null,
    ename varchar2(20),
    job varchar2(20),
    sal number(7,3));

insert into employee03 values (1000, '홍길동', '사원', 100);
insert into employee03 values (1010, '이순신', '대리', 150);
insert into employee03 values (1020, '홍명진', '과장', 200);
insert into employee03 values (1030, '박경미', '대리', 150);
insert into employee03 values (1040, '김병진',  '', 50);
insert into employee03 values (1050, '박인수', '', 35);

select * from employee03

update employee03 
    set sal = sal + 50
    where sal <200;

delete employee03 where job is null;

commit;

