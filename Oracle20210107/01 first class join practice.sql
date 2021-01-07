--join

select * from emp, dept;

--Equi join : 조회하려는 데이터들이 join에 참여하는 모든 테이블에 데이터가 존재하는 경우에만 결과 값을 출력함
--서로 다른 테이블에 자료를 외래키로 연결된 것으로 이용하여 검색할 때 
--1 oracle join : select e.empno, ename from emp e, dept d where e.deptno = d.deptno;
--2 ANSI join : select e.empno, ename from emp e join dept d on e.deptno = d.deptno;

select constraint_name, table_name, column_name from user_cons_columns where table_name = 'EMP';
select e.empno, ename from emp e, dept d where e.deptno = d.deptno;
select empno, ename, dname from emp, dept where emp.deptno = dept.deptno;
alter table emp
    drop constraint FK_DEPTNO;
--------------------------------------------------------
----------------------
--학생이름, 지도교수이름 출력
select * from student;
select * from professor;
select * from department;
select s.name "학생이름",p.name "교수이름" from student s, professor p where s.profno = p.profno; -- 오라클 방식
select s.name as "Student", p.name "Professor" from student s JOIN professor p ON s.profno = p.profno; --ANSI방식

--학생테이블, 학과테이블(department), 교수테이블을 조인하기

select s.name, p.name, d.dname from student s, professor p, department d 
    where s.deptno1 = d.deptno and s.profno = p.profno;
    
select s.name, p.name, d.dname from student s 
    join professor p on s.profno = p.profno join department d on s.deptno1 = d.deptno;
    
--1전공이 101번인 학생들의 이름과 각 학과별 지도교수 이름출력

select s.name, p.name, d.dname from student s
    join professor p on s.profno = p.profno join department d on s.deptno1 = d.deptno and s.deptno=101;

