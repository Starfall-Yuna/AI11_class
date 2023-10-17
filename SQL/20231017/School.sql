-- TEACHER ���̺� ���� :: �̸�(�⺻Ű), �Ҽ�, ���, ���
CREATE TABLE TEACHER(
    NAME VARCHAR2(20) PRIMARY KEY,
    COMPANY VARCHAR2(20),
    YEAR INT,
    SECTION VARCHAR2(20)
);

-- STUDENT ���̺� ���� :: �й�(�⺻Ű), �̸�, ����, ��米��
CREATE TABLE STUDENT(
    HAK_BUN VARCHAR2(10),
    NAME VARCHAR2(20), 
    AGE INT,
    PROF VARCHAR2(20),
    CONSTRAINT PK_HAKBUN PRIMARY KEY(HAK_BUN)
);

-- (STUDENT.��米��->TEACHER.�̸� �����ϵ��� ����)
ALTER TABLE STUDENT ADD CONSTRAINT
    FK_PROF FOREIGN KEY(PROF) REFERENCES TEACHER(NAME);

-- TEACHER�� ���� �����͸� ���� �����ϰ�
EXEC ADD_SUNSANG('�̵���', 'KB', 3, '����');
EXEC ADD_SUNSANG('������', 'KB', 1, '����');
EXEC ADD_SUNSANG('������', 'KB', 5, '����');
EXEC ADD_SUNSANG('������', 'KB', 1, '����');

-- �� ������, STUDENT �����͸� ���� (�ܷ�Ű �������� ����)
-- (���ν��� ����ؼ� ������ �߰�)
-- STUDENT ���̺� 10�� ������ ���Ƿ� �߰�
EXEC ADD_HAKSANG('1111', '������', 18, '������');
EXEC ADD_HAKSANG('2222', '�̰��', 18, '�̵���');
EXEC ADD_HAKSANG('3333', '�ſ���', 25, '������');
EXEC ADD_HAKSANG('4444', '��ȿ��', 25, '������');
EXEC ADD_HAKSANG('5555', '�層��', 33, '������');
EXEC ADD_HAKSANG('6666', '������', 33, '�̵���');
EXEC ADD_HAKSANG('7777', '������', 33, '������');
EXEC ADD_HAKSANG('8888', '�Ǻ���', 33, '������');
EXEC ADD_HAKSANG('9999', '������', 35, '������');
EXEC ADD_HAKSANG('0000', '�̻���', 36, '�̵���');

-- STUDENT, TEACHER ������ ���̺�� ���
SELECT * FROM STUDENT;
SELECT * FROM TEACHER;
-- STUDENT, TEACHER �ϳ��� ���̺�� ��� -> JOIN Ȱ��
--SELECT S.HAK_BUN "�й�", S.NAME "�̸�", S.AGE "����", S.PROF "��米��",
--    T.COMPANY "���� �Ҽ�", T.YEAR "���� ���", T.SECTION "�о�"
--FROM STUDENT S JOIN TEACHER T
--ON S.PROF=T.NAME;
SELECT S.HAK_BUN "�й�", S.NAME "�̸�", S.AGE "����", S.PROF "��米��",
    T.COMPANY "���� �Ҽ�", T.YEAR "���� ���", T.SECTION "�о�"
FROM STUDENT S, TEACHER T
WHERE S.PROF=T.NAME;

-- STUDENT, TEACHER �ϳ��� ���̺�� ���
--      (1ST)STUDENT.���� ��������, (2ND)TEACHER.��� �������� ����
SELECT S.HAK_BUN "�й�", S.NAME "�̸�", S.AGE "����", S.PROF "��米��",
    T.COMPANY "���� �Ҽ�", T.YEAR "���� ���", T.SECTION "�о�"
FROM STUDENT S JOIN TEACHER T
ON S.PROF=T.NAME
ORDER BY S.AGE, T.YEAR DESC;

-- �л� �� ���̰� 20 �̸��� �л� ������ ����
EXEC DEL_HAKSANG(20);
-- ������� ����� 1�� �߰��ؼ� �����ϱ�
EXEC UP_YEAR();

-- �л��� �� �ο�, ������ ����, �ִ밪, �ּҰ�, ��հ��� ��� �ϳ��� ���̺�� ���
SELECT COUNT(*) "�� �ο�", SUM(AGE) "����(����)", MAX(AGE) "����(�ִ�)",
    MIN(AGE) "����(�ּ�)", AVG(AGE) "����(���)"
FROM STUDENT;
-- ������ �Ҽ� �� ��� ��� (�̶� �ߺ��Ǵ� ���� �ѹ��� ��µǰԲ� �Ѵ�.)
SELECT DISTINCT COMPANY, SECTION
FROM TEACHER;
-- ������ �Ҽ� �� ��� ��� ���
SELECT COMPANY, AVG(YEAR)
FROM TEACHER
GROUP BY COMPANY;

-- 1. ���ν��� ���� :: STUDENT�� ���� ������ ����
/
CREATE OR REPLACE PROCEDURE ADD_HAKSANG
(
    IN_HAKBUN IN VARCHAR2,
    IN_NAME IN VARCHAR2,
    IN_AGE IN INT, 
    IN_PROF IN VARCHAR2
)
IS BEGIN
    -- ������ �߰��ϴ� ���� �ۼ�
    INSERT INTO STUDENT VALUES(IN_HAKBUN, IN_NAME, IN_AGE, IN_PROF);
END ADD_HAKSANG;
/

-- 2. ���ν��� ���� :: TEACHER�� ���� ������ ����
CREATE OR REPLACE PROCEDURE ADD_SUNSANG
(
    IN_NAME IN VARCHAR2,
    IN_COMPANY IN VARCHAR2,
    IN_YEAR IN INT,
    IN_SECTION IN VARCHAR2
)
IS BEGIN
    INSERT INTO TEACHER VALUES(IN_NAME, IN_COMPANY, IN_YEAR, IN_SECTION);
END ADD_SUNSANG;

/
-- 3. ���ν��� ���� :: STUDENT�� ���� Ư�� ������ ���� (��������, ���̿� ���� ���� ����)
CREATE OR REPLACE PROCEDURE DEL_HAKSANG
(
    IN_AGE IN INT
)
IS BEGIN
    DELETE FROM STUDENT WHERE AGE<IN_AGE;
END DEL_HAKSANG;

/
-- 4. ���ν��� ���� :: TEACHER�� ���� ������ ���� (��°� 1�� �߰�)
CREATE OR REPLACE PROCEDURE UP_YEAR
IS BEGIN
    -- ��� TEACHER �����Ϳ� ����, ���(YEAR) 1 ������
    UPDATE TEACHER SET YEAR=YEAR+1;
END UP_YEAR;



