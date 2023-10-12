-- ���� ������ �����ݷ�(;) �ۼ�
-- ��ҹ��� ����X

-- COMMIT :: ������ �ݿ�

--DQL�� :: Query, ������ ��ȸ
--=> SELECT�� :: ������ �˻��ϴ� ��ɹ� (�˻� ����� �Ʒ��� ��µ�)
--SELECT �Ӽ��̸� FROM ���̺�� [WHERE ����];
SELECT LENGTH('������') FROM DUAL;
SELECT LENGTHB('������') FROM DUAL;        -- �ѱ��� 3����Ʈ ���

SELECT LENGTH('Leeyuna') FROM DUAL;
SELECT LENGTHB('Leeyuna') FROM DUAL;
--DUAL :: �ӽ� ���̺�

SELECT LENGTHB('Hello') FROM DUAL WHERE LENGTH('Hello')>=5;



-- DDL�� �� DML���� ������ �ۼ��� ������ ���� ���̱� ������, ����� �ڵ�� �����ؼ� �ۼ��ϰڽ��ϴ٤Ф�



--DDL�� :: Definition, ���̺� �� DB �� �����͸� ������ ����/��ü�� ����/����/���� ����
--            (������ ������ ���� ��ɹ�)
--    =>  CREATE, ALTER, DROP, TRUNCATE

-- 1. CREATE :: ������ ����(���̺�, DB) ����
--CREATE TABLE ���̺��(
--    �Ӽ��̸� �Ӽ�Ÿ��,
--    ...
--    �Ӽ��̸� �Ӽ�Ÿ��
--);
-- NOT NULL :: "NULL�� �����Ǹ� �ȵǴ�" Į���� ����
-- PRIMARY KEY :: "�⺻Ű", �����͵鳢�� �����ϱ� ���� Į���� ����

-- * �ڷ��� :: VARCHAR2(N)�� INT, FLOAT �ַ� ���
-- "������"
-- CHAR(N) :: "����"ũ���� ������ Ÿ��    => ������ N ũ�� �Ҵ� (��ȿ����)
-- VARCHAR(N) :: "����"ũ���� ������ Ÿ��     => �ִ� N ũ�� �Ҵ� ����, �ʿ��Ѹ�ŭ�� �Ҵ� 
--      => �ѱ� �ϳ��� 3���� ������ �����ϴ� Ÿ��
-- NVARCHAR(N) :: "����"ũ���� ������ Ÿ��
--      => �ѱ� �ϳ��� 1���� ������ �����ϴ� Ÿ��
-- "������"
-- INT :: ���� ������
-- FLOAT :: �Ǽ� ������
-- NUMBER(P,S) :: ������ �Ǽ��� ���� ǥ���� �� �ִ� Ÿ��
--        p :: ���� �κ�+�Ǽ� �κ� ���Ͽ� ǥ���� �� �ִ� �ִ� ũ��
--        S :: �Ǽ� �κ��� ǥ���� �� �ִ� �ִ� ũ��
--    (EX) NUMBER(4, 1) -> 1111(o), 123.4(o), 12.45(X)
-- �� ��, "��¥��" "LOB��" ����...  => ���ο��� �ñ�ϴ�

--2. DROP, TRUNCATE
--DROP :: ���̺��� �����ϴ� ��ɾ� (���̺�, ������ ��� ����)
--    DROP TABLE [IF EXISTS] ���̺��;
--      IF EXISTS ����Ͽ�, �ߺ� ������ ���� ���� ���� ����
--TRUNCATE :: ���̺��� �����ϴ� ��ɾ� (�����͸� ��ü ����)
--    TRUNCATE TABLE ���̺��;

-- 3. ALTER
--      => ADD, DROP COLUMN, MODIFY, RENAME, RENAME COLUMN
--      ���� �� �ڼ��� �ٷﺼ ����...


--DML�� :: Manipulation, ������ ����/����/���� ����
--            (�����Ϳ� ���� ��ɹ�)
--    => INSERT, UPDATE, DELETE (+SELECT)

-- 1. INSERT :: ������ �����ϴ� ��ɾ�
--      INSERT INTO ���̺��(�Ӽ���1, �Ӽ���2, ...) VALUES (�����Ͱ�1, �����Ͱ�2, ...);
--          �����Ͱ�1�� �Ӽ���1��, �����Ͱ�2�� �Ӽ���2��, ...
--      INSERT INTO ���̺�� VALUES (1STĮ�� �����Ͱ�, 2NDĮ�� �����Ͱ�, ...);

-- 2. DELETE :: ������ �����ϴ� ��ɾ�
--        DELETE FROM ���̺�� [WHERE ���ǹ�];  
--        [WHERE ���ǹ�] �κ��� ������, ���̺� �ִ� ��� ������ ������


CREATE TABLE STUDENT(
    HAK_BUN VARCHAR(10) PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    AGE INT NOT NULL,
    SCORE FLOAT
);

INSERT INTO STUDENT VALUES('1813', '������', 25, 3.5);

SELECT * FROM STUDENT;              -- ��ü Į���� ���� ������ ���
SELECT HAK_BUN, NAME FROM STUDENT;      -- �й�, �̸��� ���� �����͸� ���

TRUNCATE TABLE STUDENT;
DROP TABLE STUDENT;

COMMIT;