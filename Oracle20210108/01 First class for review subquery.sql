create table emp07 
    as
    select * from emp where deptno=100;
    
drop table dept02;

create table dept02
as
select * from dept where loc='a';

insert into dept02 values (50, '보안부', '서울');
--insert도 서브쿼리가 가능하다. 
insert into dept02 select * from dept;

select * from dept02;

alter table dept02
    add memo varchar2(10);

desc dept02;
desc dept;

insert into dept02 select * from dept; --두 테이블의 구조가 다르므로 insert 할수가 없다. 

create table dept03 (
    deptno01 number(2),
    dname varchar2(14),
    locl varchar2(13));
    
insert into dept03 select * from dept;-- dept03과 dept 의 구조가 같으므로 모든 정보가 insert로 복사가 된다. 

--두개 테이블의 구조가 다르면 1. 적으면 dept04 2. 많으면 dept05
--1. 컬럼이 적은 경우 
create table dept04 (
    deptno number(2),
    dname varchar2(14));

insert into dept04 select * from dept;

--2. 커럼이 많은 경우

create table dept05 (
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    phone number(11));

insert into dept05 select * from dept;

--3. 두개 테이블의 구조순서가 다를 경우

create table dept06 (
    loc varchar2(13),
    dname varchar2(14),
    deptno number(2));

insert into dept06 select * from dept;

insert into dept01 select * from dept;

select * from dept03;

select * from dept03 where deptno01=20;

drop table dept03;
create table dept03
as
select * from dept;

update dept03 set loc ='수원' where deptno=20;

select * from dept03 where deptno=20;
update dept03 set loc = (select loc from dept03 where deptno=40) where deptno=20;
rollback;















    