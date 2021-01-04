CREATE TABLE employee (emp_no number(4) primary key, 
                    emp_name varchar2(20) not null, 
                    salary number (6),
                    birthday date);

--프라이머리 키를 밑에 지정하는 방법
CREATE TABLE employee (emp_no number(4) not null, 
                    emp_name varchar2(20) not null, 
                    salary number (6),
                    birthday date,
                    CONSTRAINT employee_pk PRIMARY KEY(emp_no));

--프라이머리 키 2개이상 쓰는 방법 -> 키 하나에 컬럼을 2개씀
create table speciality (emp_no number(4) not null,
                        speciality varchar(2) not null,
                        CONSTRAINT speciality_pk primary key(emp_no, speciality),
                        CONSTRAINT speciality_fk foreign key(emp_no) references employee(emp_no));
                        
create table project (pro_no number(4) not null,
                        pro_content varchar2(100) not null,
                        start_date date,
                        finish_date date,
                        CONSTRAINT project_pk PRIMARY key (pro_no) );
                        
drop table speciality;                      
                        
create table assign (emp_no number(4) not null,
                    pro_no number(4) not null,
                    CONSTRAINT assign_pk PRIMARY KEY (emp_no, pro_no),
                    CONSTRAINT assign_fk FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
                    CONSTRAINT assign_fk1 FOREIGN KEY (pro_no) REFERENCES project(pro_no));
                    
--ppt 107                   
create table emp01 (
            emp number(4),
            ename varchar2(14),
            sal number(7,3));
            
--만든 테이블의 구조 보기
desc emp01;
            
--ppt 108
--테이블 수정하기 (컬럼 추가 - add, 컬럼 변경 - modify , 컬럼 삭제 - drop column)
-- 테이블 컬럼 추가 -add

alter table emp01
    add (birth date);

alter table emp01
    add (memo varchar2(100));
                    
                    
                    
--테이블 컬럼 변경 - modify     

--ALTER TABLE [테이블명] RENAME COLUMN [이전컬럼] TO [새 컬럼명]-- 이건 컬럼 명 바꿈

alter table emp01
    modify (ename varchar2(30));

alter table emp01
    modify (memo varchar2(50));
                    
alter table emp01
    modify (sal number(5));
                    
desc emp01;                    
--테이블 컬럼 삭제

alter table emp01
    drop column memo;

--사용하지 않겠다고 하는것임    -> unused
alter table emp01
    set unused(empno);
                    
--rename : 테이블명을 바꾸는것

rename emp01 to emp02;
desc emp02;

--alter table 테이블명 rename columne 컬럼명 to 바꿀컬럼명;
alter table emp02 rename column emp to emp_no;
rename emp02 to emp01;

insert into emp01 (ename, sal) values ('홍길동', 200);
insert into emp01 (ename, sal) values ('김길동', 300);

select * from emp01;

--테이블의 레코드 지우기 -> 해당하는 테이블의 레코드를 모두 지움 (잘라냄) truncate 
truncate table emp01;

--데이터 딕셔너리
select table_name from user_tables;
                    
select * from all_tables;                    

select * from dba_tables;                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    