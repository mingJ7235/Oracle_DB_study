 1. Student 테이블과 department테이블을 사용하여 'Anthony  Hopkins'학생과 전공(deptno1)이 동일한 학생들의 이름과 전공1 이름을 출력하시오

정답 SELECT s.name "STUD_NAME" , d.dname "DEPT_NAME" FROM student s , department d
WHERE s.deptno1=d.deptno and s.deptno1 = ( SELECT deptno1 FROM student WHERE name='Anthony Hopkins') ;

select * from student;
select * from department;

2. professor테이블과 department테이블을 조회하여 'Meg Ryan'교수보다 나중에 입사한 사람의 이름과 입사일 학과명을 출력하세요
SELECT p.name, p.hiredate, d.dname  FROM professor p, department d 
   where p.deptno = d.deptno and hiredate > ( select hiredate from professor where name='Meg Ryan' ) ;
 

3. student 테이블에서 전공1이 201번인 학과의 평균 몸무게보다 몸무게가 많은 학생들의 이름과 몸무게를 출력하세요
SELECT name, weight from student
    WHERE weight > ( select avg(weight) from student where deptno1 = 201 );
 

4. emp2테이블을 사용하여 전체 직원 중 'Section Head'직급의 최소 연봉자보다 연봉이 높은 사람의 이름과 직급 연봉을 출력하시오.
단 연봉 출력 형식은 천단위 구분기호와 $표시를 하세요.
select name, position, to_char(pay, '$999,999,999') as "연봉"  from emp2
  WHERE  pay > any   ( select pay from emp2 where position='Section head' );
 
select name, position, to_char(pay, '$999,999,999') as "연봉"  from emp2
  WHERE  pay >   ( select min(pay) from emp2 where position='Section head' );


5. student테이블을 조회하여 전체 학생 중에서 체중이 2학년 체중에서 가장 적게 나가는 학생보다 몸무게가 적은 학생의 이름과 학년과 몸무게를 출력하세요.
select name, grade, weight from student
 Where  weight < all ( select weight from student where grade = 2 ) ;
 
 select name, grade, weight from student
 Where  weight <  ( select min(weight) from student where grade = 2 ) ;

6. emp2테이블과 dept2테이블을 조회하여 각 부서별 평균 연봉을 구하고 
그중에서 평균 연봉이 가장 적은 부서의 평균 연봉보다 적게 받는 직원들의 부서명, 직원명, 연봉을 출력하세요.
select d.dname, e.name, to_char(pay, '$999,999,999')  from emp2 e, dept2 d
  WHERE e.deptno = d.dcode
  and e.pay < all  ( select avg(pay) from emp2 group by deptno );
 

7. professor테이블과 department테이블을 조회하여
각 학과별로 입사일이 가장 오래된 교수의 교수번호와 이름, 학과명을 출력하세요.(입사일 순으로 오름차순 정렬하세요)

SELECT  p.profno, p.name, p.hiredate,d.deptno, d.dname from professor p, department d 
  where p.deptno = d.deptno 
  and (p.deptno, p.hiredate)  in (select deptno, min(hiredate) from professor group by deptno )
order by p.hiredate;

8. emp2 테이블을 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요. 
연봉순으로 오름차순 정렬하세요.
SELECT name, position, to_char(pay, '$999,999,999')  from emp2
  where  (position, pay) in ( select position, max(pay) from emp2 group by position );