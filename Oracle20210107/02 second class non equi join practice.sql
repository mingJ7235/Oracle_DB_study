--non equi join (between 이나 부등호 사용하는 join )

select * from customer;
select * from gift;

--고객별로 마일리지 포인트 조회 한 후 해당 마일리지 점수로 받을 수 있는 상품 조회하여
--고객의 이름, 받을 수 있는 상품명을 출력

select c.gname as "고객명",  to_char(c.point,'999,999') as "포인트", g.gname as "상품명"
    from customer c, gift g 
    where c.point between g.g_start and g.g_end;
    -- 999,999는 포인트를 1000자리로 자르는 것을 의미
    --where를 사용하여 저렇게 사이를 할 수 있음
    
select c.gname, to_char(c.point, '999,999'), g.gname
    from customer c join gift g
    on c.point between g.g_start and g.g_end;
    
--student 테이블과 score 테이블, hakjum테이블을 조회하여 학생들의 이름, 점수, 학점 출력
select * from student;
select * from score;
select * from hakjum;

select s.name "이름", c.total "점수", h.grade "학점" from student s, score c, hakjum h
    where s.studno = c.studno and c.total between h.min_point and h.max_point;
    
select s.name "이름", c.total "점수", h.grade "학점" from student s
    join score c on s.studno = c. studno
    join hakjum h on c.total between h.min_point and h.max_point;



