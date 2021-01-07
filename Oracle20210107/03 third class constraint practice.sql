--cascade

--제약조건 공부 

drop table dept01;

create table dept10 (
    deptno number(2) constraint dept10_deptno_pk primary key,
    dname varchar2 (14),
    loc varchar2(13) );
    
select * from user_constraints where table_name= 'DEPT01';

insert into dept10 values (10, '경리부', '서울');
insert into dept10 values (20, '인사부', '인천');

drop table emp01;

create table emp01 (
    empno number(4),
    ename varchar2(10) constraint emp01_ename_nn not null,
    job varchar2(9),
    deptno number(2),
    constraint emp01_empno_pk primary key (empno), 
    constraint emp01_job_uk unique (job),
    constraint emp01_deptno_fk foreign key (deptno) references dept10(deptno));
    
select * from user_constraints where table_name='EMP01';

insert into emp01 values (1000, '허준', '사원', 10);

insert into emp01 values (1001, '이순신', '대리', 50);

delete from dept10 where deptno=10;

select * from dept10;
select * from emp01;

--오류해결방법 1) 제약조건을 없애기, 2) 비활성화하기
--제약조건을 비활성화하기 disable constraint
--제약조건을 활성화하기 enable constraint

--자식 테이블의 외래키를 비활성화하기
alter table emp01
    disable constraint emp01_deptno_fk;

select * from user_constraints where table_name = 'EMP01' or table_name = 'DEPT10';

--자식테이블 외래키 활성화
alter table emp01
    enable constraint emp01_deptno_fk;
        
delete from dept10 where deptno = 10;



--부모 테이블의 기본키를 비활성화 하기 (자식테이블을 먼저 비활성화해야함)
alter table dept10 
    disable constraint dept10_deptno_pk; --오류남 왜? 자식이랑 연결되어있기때문임 그러므로 자식을 비활성화하고 나서 해야함.

alter table dept10
    enable constraint dept10_deptno_pk;



--비활성화 할때 : 자식테이블을 먼저 비활성화하고 부모테이블을 비활성화 해야한다. 
--활성화 할때 : 부모테이블을 활성화하고 자식테이블을 활성화 해야한다. 
--비활성화를 번거롭게하지 않기 위해서 cascade를 쓰는것임

--비활성화할때는 cascade사용가능 ! (disable)
alter table dept10 
    disable constraint dept10_deptno_pk cascade; --cascade를 사용하면 바로 둘다 비활성화가 된다. 

--다시 활성화할때는 순서대로 활성화해야한다. (enable)
alter table dept10
    enable constraint dept10_deptno_pk; --활성화할때는 cascade를 사용할 수 없다. 
alter table emp01
    enable constraint emp01_deptno_fk;



















