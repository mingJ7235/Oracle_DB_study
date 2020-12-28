--�μ� ���̺� �����ϱ�
CREATE TABLE dept ( deptno NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
                    dname VARCHAR2(14),
                    loc VARCHAR2(13));

--������̺� �����ϱ�
CREATE TABLE emp ( empno number(4) CONSTRAINT PK_EMP PRIMARY KEY,
                    ename varchar2(10),
                    job varchar2(9),
                    mgr number(4),
                    hiredate date,
                    sal number(7,2),
                    comm number (7,2),
                    deptno number (2) CONSTRAINT FK_DEPTNO REFERENCES DEPT );
--�޿� ���̺� �����ϱ�
--gread ���, losal�޿� ���Ѱ� hisal  �ݱ޿� ���Ѱ�
CREATE TABLE salgrade ( grade number, losal number, hisal number);

--��� ���̺� ���� ������ �ֱ�
INSERT INTO dept (deptno, dname, loc) VALUES (10, '�渮��', '����');
INSERT INTO dept (deptno, dname, loc) VALUES (20, '�λ��', '��õ');
INSERT INTO dept VALUES (30, '������', '����');
INSERT INTO dept VALUES (40, '�����', '����');


--��� ���̺� �ȿ� �ִ� ���ڵ�(��)�� �˻��ϱ�
SELECT * FROM dept;

--��� ���̺� �ڷ� �����ϱ�
INSERT INTO emp VALUES(1001, '����', '���', 1013, to_date('2007-03-01','yyyy-mm-dd'), 3000, NULL, 20);
INSERT INTO EMP VALUES(1002, '�ѿ���', '�븮', 1005, to_date('2007-04-02','yyyy-mm-dd'), 250,   80, 30);
INSERT INTO EMP VALUES(1003, '����ȣ', '����', 1005, to_date('2005-02-10','yyyy-mm-dd'), 500,  100, 30);
INSERT INTO EMP VALUES(1004, '�̺���', '����', 1008, to_date('2003-09-02','yyyy-mm-dd'), 600, NULL, 20);
INSERT INTO EMP VALUES(1005, '�ŵ���', '����', 1005, to_date('2005-04-07','yyyy-mm-dd'), 450,  200, 30);
INSERT INTO EMP VALUES(1006, '�嵿��', '����', 1008, to_date('2003-10-09','yyyy-mm-dd'), 480, NULL, 30);
INSERT INTO EMP VALUES(1007, '�̹���', '����', 1008, to_date('2004-01-08','yyyy-mm-dd'), 520, NULL, 10);
INSERT INTO EMP VALUES(1008, '���켺', '����', 1003, to_date('2004-03-08','yyyy-mm-dd'), 500,    0, 30);
INSERT INTO EMP VALUES(1009, '�ȼ���', '����', NULL, to_date('1996-10-04','yyyy-mm-dd'),1000, NULL, 20);
INSERT INTO EMP VALUES(1010, '�̺���', '����', 1003, to_date('2005-04-07','yyyy-mm-dd'), 500, NULL, 10);
INSERT INTO EMP VALUES(1011, '�����', '���', 1007, to_date('2007-03-01','yyyy-mm-dd'), 280, NULL, 30);
INSERT INTO EMP VALUES(1012, '������', '���', 1006, to_date('2007-08-09','yyyy-mm-dd'), 300, NULL, 20);
INSERT INTO EMP VALUES(1013, '������', '����', 1003, to_date('2002-10-09','yyyy-mm-dd'), 560, NULL, 20);
INSERT INTO EMP VALUES(1015, '���μ�', '���', 1006, to_date('2007-11-09','yyyy-mm-dd'), 250, NULL, 10);

SELECT * from emp;

INSERT INTO SALGRADE VALUES (1, 700,1200);
INSERT INTO SALGRADE VALUES (2, 1201,1400);
INSERT INTO SALGRADE VALUES (3, 1401,2000);
INSERT INTO SALGRADE VALUES (4, 2001,3000);
INSERT INTO SALGRADE VALUES (5, 3001,9999);


SELECT * from salgrade;

commit;
-----------------------------
SELECT empno, job FROM emp WHERE job='����';
SELECT DISTINCT job FROM emp;
SELECT DISTINCT job ���� FROM emp; --�÷��� �̸��� '����'�� �ٲٴ� ���� (as���� ����)

----------------------- ����
SELECT sal FROM emp;
SELECT sal as ����, sal*0.03 as ���� FROM emp;

SELECT ename �̸�, comm Ŀ�̼�, sal*12+comm ����, NVL(comm, 0) Ŀ�̼�, sal*12+NVL(comm, 0) ���� FROM emp; 
--nvl (�÷�, 0) : �÷��� null�ΰ�� 0�� �־�� ��� �ǹ���
--null �̶�? 
--  null �� 0�� �ƴϴ� ������� �ƴϴ�. ��Ȯ��, �� �˼� ���� ���� �ǹ��Ѵ�. value�� ������ ���̴�!
--  � ������ �� �� ������, � ���� �����ϴ� ���̴�. ? �Ǵ� ���Ѵ븦 �ǹ��Ѵ�. 
--  ����, �Ҵ�, �񱳰� �Ұ����ϴ�. 

----------------------
SELECT ename || '�� ������ ' || job || '�Դϴ�.' as ���� from emp;
-- ||�� �÷����� ������ �� ���� ���̴�. 


----where�� ������
select * from emp;

select *from emp where sal >=500;

SELECT * FROM emp WHERE deptno =10;


