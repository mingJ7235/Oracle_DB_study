--outer join

-- inner join 과 반대로 한쪽 테이블에는 데이터가 있고, 다른 한쪽 테이블에 없는 경우에
--데이터가 있는 쪽테이블의 내용을 전부 출력하게 하는 방법임
--inner join보다 더 많은 자료를 조회가능 (inner는 양쪽에 다 있어야함)
-- 예) 지도교수가 결정되지 않은 학생으 ㅣ이름이나 교실의 이름까지 다 나와야하는경우

--장잔점
-- 장점 ; 모든 데이터를 다 출력할 수 있다
-- 단점 : 모든 데이터를 다 출력하다보니 null이 많고, 그래서 db성능에 나쁜 영향을 줄 수있으므로 신중해야함

--1) left join

--Student 테이블과 professor 테이블을 조인하여 학생이름과 지도교수이름을 출력하시오
--단, 지도교수가 결정되지 않은 학생의명단도 출력하시오 -> outer join을 해야함

--oracle outer join 문법
select s.name "학생" , p.name "교수" from student s, professor p
    where s.profno = p.profno(+);
    
--ANSI outer join 문법

--1) left기준 즉, 학생 기준으로 조회 (학생은 전체 조회가된다.)
select s.name "학생", p.name "교수" from student s
    left outer join professor p
    on s.profno= p.profno;
    
--2) right기준 즉, 교수기준으로 조회 (교수가 전체 조회가된다.) 즉, 지도학생이 결정안된 교수명단 출력
select s.name "학생", p.name "교수" from student s
    right outer join professor p
    on s.profno= p.profno;

--3) 지도학생이 결정안된 교수명단, 지도교수가 결정안된 학생명단 한번에 모두 -> outer join
select s.name "학생" , p.name "교수" 
    from student s full outer join professor p
    on s.profno = p.profno;
--3)번을 oracle outer join 문법으로해보기
select s.name "학생", p.name "교수"
    from student s, professor p
    where s.profno(+) = p.profno
    union
    select s.name "학생", p.name "교수"
    from student s, professor p
    where s.profno = p.profno(+);
    
    