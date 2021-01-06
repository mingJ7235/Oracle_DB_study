--제약조건 비활성화
select * from dept;
select * from emp;

select constraint_name, table_name, column_name from user_cons_columns where table_name = 'EMP';

select * from emp left join dept on emp.deptno = dept.deptno;

--테이블의 외래키는 삭제할 수 없다!
delete from dept where deptno=10;

--삭제하기 위해서는 1) emp 테이블의 외래키 조건을 삭제 2) 일시 비활성화  2가지 방법이 있다. 

drop table dept01;
select * from dept01;

create table dept01 (
    deptno number(2) constraint deptno_pk primary key,
    dname varchar2(14),
    loc varchar2(13));
    
insert into dept01 values(10, '경리부', '서울');
insert into dept01 values(20, '인사부', '인천');

select * from dept01;

drop table emp01;

create table emp01(
    empno number(4),
    ename varchar2(10) constraint emp01_ename_nn not null,
    job varchar2(9),
    deptno number(2),
    constraint emp01_empno_pk primary key(empno),
    constraint emp01_job_uk unique(job),
    constraint emp01_deptno_fk foreign key(deptno) references dept01(deptno));
    
insert into emp01 values (1000, '허준' , '사원', 10);
insert into emp01 values (1000, '허준' , '사원', 10);

delete from dept01 where deptno=10;
--지금은 삭제안댐 왜? 관계를 맺고있으니까

--비활성하기
alter table emp01
    disable constraint emp01_deptno_fk;
    
delete from dept01 where deptno=10;    
--비활성화 한 이후에는 삭제가 됨 
    
    
--다시 활성화하기
alter table emp01
    enable constraint emp01_deptno_fk;
    
--혹시 활성화했는데 오류가나는건 데이터가 이미 들어갔는데, 해당 데이터를 지웠을 경우다. 
    
--cascade옵션
--부모테이블과 자식 테이블간의 참조 무결성이 설정되어 있을때
--부모테이블의 제약조건을 비활성화하면
--이를 참조하는 자식 테이블의 제약조건이 함께 비활성화하기 위해 사용하는 옵션
    
    
    
    
    
    