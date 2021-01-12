--풀이1 각각의 sql 만들고 union all 연결
--부서별 평균 급여 및 사원 수
SELECT deptno, NULL job, round(avg(sal), 1) avg_sal, count(*) cnt_emp
FROM emp
GROUP BY deptno
union
--부서별 평균 급여와 사원 수
SELECT deptno, job, round(avg(sal), 1) avg_sal, count(*) cnt_emp
FROM EMP 
GROUP BY deptno, job
UNION ALL 
SELECT NULL deptno, NULL job, round(avg(sal), 1) vag_sal, count(*) cnt_emp
FROM EMP 
ORDER BY deptno, job;

SELECT deptno, job, round(avg(sal), 1) avg_sal, count(*) cnt_emp FROM EMP 
GROUP BY rollup(deptno, job);

--부서별 평균 급여와 사원수
--직급별 평균 급여와 사원수
--부서와 직급별 평균 급여와 사원수
--전체 평균 월 급여와 사원수

SELECT deptno, null job, round(avg(sal),1) avg_sal, count(*) cnt_emp 
from emp
group by deptno
union all
SELECt null deptno, job, round(avg(sal),1) avg_sal, count(*) cnt_emp from emp
group by job
union all
SELECT deptno, job, round(avg(sal),1) avg_sal, count(*) cnt_emp 
from emp 
group by deptno, job
union all
select null deptno, null job, round(avg(sal),1) avg_sal, count(*) cnt_emp from emp
order by deptno, job;

--풀이2)  CUBE함수로 구하기
SELECT deptno, job, round(avg(sal), 1) avg_sal, count(*) cnt_emp from emp
group by cube(deptno, job)  order by deptno, job;