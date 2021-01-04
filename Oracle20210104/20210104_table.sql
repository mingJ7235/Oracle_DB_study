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

create table speciality (emp_no number(4) not null,
                        speciality varchar(2) not null,
                        CONSTRAINT speciality_pk primary key(emp_no),
                        CONSTRAINT speciality_fk foreign key(emp_no) references employee(emp_no));
                        
create table project (pro_no number(4) not null,
                        pro_content varchar2(100) not null,
                        start_date date,
                        finish_date date,
                        CONSTRAINT project_pk PRIMARY key (pro_no) );
                        
drop table project_1;