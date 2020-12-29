--그룹함수

--개별 함수
SELECT sal FROM emp;

--round(숫자, 반올림하여 나오는 자리수) 즉, 소숫점을 기준으로 왼쪽으로가면 음수 오른쪽로가면 양수를 넣으면 그 기준점으로 반올림된다.
SELECT sal, round(sal, -2) FROM emp;

SELECT round(12300.283,1) FROM dual;
SELECT round(12300.283,-3) FROM dual;

--그룹함수
SELECT sum(sal)  FROM emp;
SELECT avg(sal)  FROM emp; 
SELECT count(sal)  FROM emp; 
SELECT count(job)  FROM emp; 
SELECT count(mgr) FROM emp;--count는 null을 빼고 카운트해준다

SELECT ename, max(sal) FROM emp; --이건 예외남 이럴때는 부속질의어를 사용해야한다 (ppt 11장에있음)
	--그룹함수와 단일행행함수와 함께 조회 불가함
	
--부분합 (group by)
SELECT sum(sal), deptno 부서명 FROM emp GROUP BY deptno;
SELECT deptno, sum(sal) FROM emp WHERE job='사원' GROUP BY deptno;

SELECT job, avg(sal) FROM emp WHERE ename LIKE '김%' GROUP BY job;
SELECT job, sum(sal) FROM emp WHERE substr(HIREDATE, 1,2) IN ('00', '01','02','03') GROUP BY job;

SELECT hiredate FROM emp WHERE substr(hiredate, 8,2) BETWEEN '00' AND '07';


SELECT deptno, max(sal) 최대급여,  min(sal) 최소급여 FROM emp GROUP BY deptno ORDER BY deptno;

--그룹의 결과를 제한 할 때는 having절을 사용한다.  (조건으로 결과를 제한할 때는 where절을 사용)

--1) 부서별 급여 평균이 500이상인 부서의 번호와 급여 평균
SELECT deptno, avg(sal) 평균, max(sal) 최대급여,  min(sal) 최소급여 FROM emp GROUP BY deptno; --having을 안한것
SELECT deptno, avg(sal) 평균, max(sal) 최대급여,  min(sal) 최소급여 FROM emp GROUP BY deptno HAVING avg(sal) >=500;
SELECT deptno, avg(sal) 평균, max(sal) 최대급여,  min(sal) 최소급여 FROM emp GROUP BY deptno HAVING avg(sal) >=300;
SELECT deptno, avg(sal) 평균, max(sal) 최대급여,  min(sal) 최소급여 FROM emp GROUP BY deptno HAVING avg(sal) >=300 ORDER BY DEPTNO ;

SELECT deptno, avg(sal) 평균, max(sal) 최대급여,  min(sal) 최소급여 FROM emp 
												WHERE job='부장' 
											GROUP BY deptno 
										HAVING avg(sal) >=300 
									ORDER BY DEPTNO ;
								
								
--그룹함수 문제
--1) 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오 평균에 대해서는 정수로 반올림하시오
SELECT max(sal) 급여최고액, min(sal) 급여최저액, sum(sal) 총액, round(avg(sal)) FROM emp;

--count(*) 함수 이용하여 담당 업무별 사원수를 출력하시오
SELECT job, count(*) FROM emp GROUP BY job ORDER BY job;

--과장 수를 나열하시오

SELECT count(*) FROM emp WHERE job = '과장';

--급여 최고액, 급여 최저액의 차액을 출ㄹ력하시오

SELECT max(sal), min(sal), max(sal) -min(sal) FROM emp;

--직급별 사원의 최저 급여를 출력하시오

SELECT job, min(sal) FROM emp GROUP BY  job;

--최저급여가 500미만인 그룹은 제외시키고, 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오

SELECT job, min(sal) FROM emp GROUP BY job HAVING min(sal) >=500 ORDER BY min(sal) desc;

--각 부서에 대한 부서번호, 사원수, 부서내의 모든 사원 평균 급여를 출력하시오. 평균 급여는 소수점 둘째자리로 반올림하시오

SELECT  deptno 부서, count(*) 부서별_사원수, round(avg(sal), 1) 평균_급여 FROM emp GROUP BY deptno ORDER BY DEPTNO ;


-- 각 부서에 대해 부서번호 이름, 지역명, 사원수, 부서 내의 모든 사원의 평균 급여를 출력하시오
--평균균 급여는 정수로 소수점 둘째자리로 반올림하시오

SELECT deptno, decode(deptno, 10, '경리부',
									20, '인사부',
									30, '영업부',
									40, '전산부') AS ename, 
			decode (deptno, 10, '서울', 20, '인천', 30, '용인', 40, '수원') AS 지역, 
									count(*) 부서별_사원수, round(avg(sal), 1) 평균_급여 FROM emp GROUP BY deptno;



