--cascade옵션
--부모테이블과 자식 테이블간의 참조 무결성이 설정되어 있을때
--부모테이블의 제약조건을 비활성화하면
--이를 참조하는 자식 테이블의 제약조건이 함께 비활성화하기 위해 사용하는 옵션

--부모테이블의 기본키 제약조건을 비활성 시키기
alter table dept01
    disable primary key;
    
--cascade를 사용하여 자식 테이블도 비활성화 해주는 것임
--하나만 비활성화 시키면 자식테이블의 외래키와 부모와 충돌이생겨서 비활성화가 불가능할 수잇따. 
alter table dept01
    disable primary key cascade;

select * from user_constraints where table_name in ('DEPT01', 'EMP01');

alter table dept01
    enable primary key;
    
alter table emp01
    enable  key;
    
----------------------------    문제풀이--------------------
select * from employee;   
drop table project;   
    
CREATE TABLE  employee01(

    emp_no number(4),

    emp_name varchar2(20),

    salary  number(6),

    birthday  date );
    
CREATE TABLE  project01(

     pro_no number(4),

     pro_content varchar2(100),

     start_date  date,

     finish_date date );
    
 CREATE TABLE  specialty(

     emp_no number(4),

     specialty   varchar2(20)

);   
CREATE TABLE assign01(

   emp_no   number(4),

   pro_no    number(4) );    



alter table employee01 
    add constraint EMPLOYEE01_PK primary key(emp_no);

alter table specialty 
    add constraint SPECIALITY01_FK foreign key(emp_no) references employee01(emp_no);

alter table specialty 
    add constraint speciality01_pk primary key (specialty);
    
alter table project01
    add constraint PROJECT01_PK primary key (pro_no);   
    
alter table assign01 
    add constraint ASSIGN_PROJECT_FK foreign key(pro_no) references project01(pro_no);

alter table assign01
    add constraint ASSIGN_EMPLOYEE_FK foreign key(emp_no) references employee01(emp_no);

alter table assign01
    add constraint ASSIGN01_PK primary key (emp_no, pro_no);

    