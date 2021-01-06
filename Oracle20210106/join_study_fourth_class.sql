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

select ename, dname, sal, grade from emp e, dept d, salgrade s 
    where e.deptno = d.deptno and e.sal between s.losal and s.hisal order by grade desc;

--self join

select empno, ename, mgr from emp;

--출력 결과 ename, mname 

select e1.ename as "사원이름", e2.ename as "메니저이름" from emp e1, emp e2 where e1.mgr = e2.empno ;


--cross join
select * from emp cross join dept;


--ANSI inner join (where를 안쓰고 join 테이블 on 조건)
select * from emp, dept where emp.deptno = dept.deptno; -- 요건 equi join
select * from emp inner join dept on emp.deptno = dept.deptno; --inner join

select ename, dname from emp, dept where emp.deptno = dept.deptno and ename = '이문세';
select ename, dname from emp inner join dept on emp.deptno = dept.deptno and ename = '이문세';


--ANSI outer join 

select * from emp;
select * from dept;

select *from emp full outer join dept on emp.deptno = dept.deptno;

-- outer join은 join 테이블 on 을 기준으로 데이터를 보여준다 ..? 
select * from emp left outer join dept on emp.deptno = dept.deptno;
select * from emp right outer join dept on emp.deptno = dept.deptno;
























