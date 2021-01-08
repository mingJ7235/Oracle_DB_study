1. 서브 쿼리를 이용하여 "영업부"에서 근무하는 모든 사원의 이름과 급여을 출력하라.
select ename, sal from emp 
    where deptno = (select deptno from dept where dname = '영업부');
​
2. 서브쿼리를 사용하여 emp06에 emp테이블의 모든 데이터를 추가합니다.

drop table emp06;
--구조만 복사하기
create table emp06 
as
select * from emp where deptno =100;
desc emp06;

--내용 집어넣기
insert into emp06
select *from emp;
​
3. emp06테이블에 저장된 사원 정보 중 과장들의 최소 급여보다 많은 급여을 받는 사원들의 이름과 급여과 직급을 출력하되 과장은 출력하지 않은 SQL문을 작성하시오
    1) select sal from emp where job = '과장' -> 과장들의 급여
    2) job <> '과장' -> 과장을 빼는 것임

select ename, sal, job from emp
    where sal > any (select sal from emp where job = '과장') and job <> '과장';
​

4. emp06 테이블에 저장된 사원 정보 중 인천에 위치한 부서에 소속된 사원들의 급여을 100 인상하는 SQL문을 작성하시오
select * from emp06;
select * from dept;
select * from emp06 where deptno = 20;

UPDATE emp06
    SET sal = sal + 100
    WHERE deptno = (
    SELECT deptno FROM dept
    WHERE loc = '인천'
    );
 
update emp06 set sal = sal +100
    where deptno 
    in 
    (select deptno from dept 
    where loc='인천'
    );
​
5. emp06테이블에서 경리부에 소속된 사원들만 삭제하는 SQL문을 작성하시오
delete from emp06 
    where deptno 
    = (select deptno from dept 
    where dname ='경리부');
​
6. '이문세'와 같은 부서에 근무하는 사원의 이름과 부서번호를 출력하는 SQL문을 작성하시오
select ename, deptno from emp 
    where deptno = 
    (select deptno from emp 
    where ename = '이문세')
    and ename <> '이문세';
​

7. '이문세'와 동일한 직급을 가진 사원을 출력하는 SQL문을 완성하시오.

​

8. '이문세'의 급여와 동일하거나 더 많이 받는 사원명과 급여을 출력하는 SQL문을 완성하시오

​

9. '인천'에서 근무하는 사원의 이름, 부서번호를 출력하는 SQL문을 완성하시오.

​

10. 직속상관이 감우성인 사원의 이름과 급여을 출력하는 SQL문을 완성하시오

​

11. 부서별로 가장 급여를 많이 받는 사원의 정보(사원번호, 사원이름, 급여, 부서번호)를 출력하는 SQL문을 완성하시오.

​

12. 직급(JOB)이 과장인 사원이 속한 부서의 부서번호와 부서명, 지역을 출력하시오

​

13. 과장보다 급여을 많이 받은 사원들의 이름과 급여와 직급을 출력하되 과장은 출력하지 않는 SQL문을 완성하시오