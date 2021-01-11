--인라인뷰로 Top - N 구하기 


SELECT rownum, empno, ename, hiredate FROM emp ORDER BY ename;

--고용된 날짜 순대로 view를 하나 만든다.
CREATE OR REPLACE VIEW view_hire
as
SELECT empno, ename, hiredate FROM emp ORDER BY hiredate;


SELECT * FROM view_hire;
--view에서 또 순위별 view를 만든다.

CREATE OR REPLACE VIEW view_view_hire
as
SELECT empno, ename, hiredate FROM view_hire WHERE rownum <=5;

SELECT * FROM view_view_hire;

--뷰로된 것을 뷰로 다시 만들 수 있다.


