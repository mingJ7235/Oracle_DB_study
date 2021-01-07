--서브쿼리로 테이블 생성 및 조작
desc emp02;
drop table emp02;

select

-- as 사용하여 서브쿼리로 테이블 생성 --> copy하여 테이블을 복사할 수 있다. 
--서브쿼리로 복사할경우 constraints는 복사가 안된다. 
create table emp02
    as
    select * from emp;
select * from emp02;

drop table emp03;

--as사용하여 테이블 생성 -> 복사하고 싶은 컬럼만 복사
create table emp03
    as
    select empno, ename from emp;

select * from emp03;

select * from user_constraints where table_name in ('EMP', 'EMP02');

--as사용하여 조건에 만족하는것만 테이블 생성 
drop table emp04;
create table emp04
    as
    select * from emp where deptno = 10;
select * from emp04;
select * from emp where deptno = 10;


-- 테이블 구조만 복사하기 --즉, 서브쿼리에내용은 없는데 구조만 복사하는것임. deptno가 100은 없으니까, 내용은 복사안되고 구조만 복사된다.

drop table emp05;

create table emp05
    as
    select * from emp where deptno=100;

desc emp05;
select * from emp where deptno =100;

--서브쿼리로 데이터 삽입하기

commit;












