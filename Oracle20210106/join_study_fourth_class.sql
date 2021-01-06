--join공부

--관계형 데이터베이스에서는 테이블간의 관계가 중요함
--하나 이상의 테이블이 빈번히 결합하여 사용된다. 한개 이상의 테이블에서 데이터를 조회하기 위해 사용되는 것

select * from emp where ename='이문세';
select * from emp; --record : 16개
select * from dept; --record: 4개

--join 1번째 방법 (cross join의 record수 : 첫번재 테이블 record 수 x 두번째 테이블 record 수) --전체 집합? 에서사용 잘사용되진않음
select * from emp, dept;
select empno, emp.deptno, dept.deptno, dname from emp, dept;


-- Equi join : 제일 많이 사용하는 join
select empno, ename, job, sal, dept.deptno, dname from emp, dept where emp.deptno = dept.deptno;

--수행 순서
--from emp, dept -> where emp.deptno = dept.deptno --> column조회

--이문세의 이름과 소속 부서 출력하기
-- 출력형태 : 이문세  경리부

select ename, dept.dname from emp, dept where emp.deptno = dept.deptno and ename='이문세';

--컬럼명의 모호성 해결 방법 : 테이블명 별칭 붙이기 (테이블.컬럼명 해도되지만 별칭붙여도댐)
--from 테이블명1 별칭, 테이블명2 별칭 (e, d로 테이블 명칭을 붙인것임)
select ename, dname, d.deptno from emp e, dept d where e.deptno = d.deptno;


--non equi join : 조인 조건에 특정 범위내에 있는지 조사하기 위해 있는 조인. 
select * from salgrade;
select * from emp;
--급여의 등급은 총 5단계로 나뉘어져 있다. 
select ename, sal, grade from emp, salgrade where sal between losal and hisal;


insert into salgrade values (0, 0, 699);








