--ppt 14장 사용자 권한

-- 권한을 주는것

--관리자 계정
--	sys : 모든 권한 (모든권한을 가지고 있음)
--	system : 계정 권한 (계정에 관련된 권한을 가지고 있음)
--
--sys로 접속하여 사용자 만들기, 계정 만들기 를 할 수 있음

show USER;

--사용자 계정 만들기
CREATE USER test2 IDENTIFIED BY 1234;


