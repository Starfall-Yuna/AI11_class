-- ���� ������ �����ݷ�(;) �ֱ�
-- ��ҹ��� ���� ����

-- CRUD ::  CREATE / READ / UPDATE / DELETE => ����/�б�/����/����
-- SQL�� :: ���� CRUD ����� �����ϱ� ���� ��ɹ�(���ǹ�)
--      => <<DQL / DDL / DML>> / DCL / TCL

-- DQL(Query) :: ������ ��ȸ
--   SELECT�� :: �����͸� �˻��ϴ� ��ɾ� (�˻��� ����� ����Ͽ� ǥ��)
--   SELECT Į���� FROM ���̺�� [WHERE ���ǹ�];
SELECT LENGTH('HelloSQL') FROM DUAL WHERE LENGTH('HelloSQL')>=5;


-- DDL(Defination) :: ������ ����(DB, ���̺�, ...) ����
--      => CREATE(����), ALTER(����), DROP, TRUNCATE(����)
-- DML(Manipulation) :: ������ ����
--      => INSERT(����), UPDATE(����), DELETE(����)   (+SELECT)

-- ORACLE �ڷ��� :: VARCHAR2(N)
-- * ������
--  CHAR(N) :: ����ũ���� ������ Ÿ��, ������ N���� ���� �Ҵ� (��ȿ����)
--  VARCHAR2(N) :: ����ũ���� ������ Ÿ��, "�ִ� N������"�� ���� �Ҵ�O
--  NVARCHAR2(N)
-- * ������
--  INT :: ���� ������
--  FLOAT :: �Ǽ� ������
--  NUMBER(P,S) :: ����/�Ǽ� ��� ����
--      P(�����κ�+�Ǽ��κ� �ִ� �ۼ������� ����) / S(�Ǽ��κ� �ִ� �ۼ������� ����)

-- * :: "��ü"


-- ��α� "��"�� ���� ���̺� ���� (CREATE ���)
CREATE TABLE POST(
    TITLE VARCHAR2(30),       -- �� ����
    DAY VARCHAR2(10),         -- �� �ۼ���¥
    BODY VARCHAR2(100)        -- �� ����
);

-- POST ���̺� ���Ͽ�, ������ ����
INSERT INTO POST VALUES('Hello', '20231013', 'Helloooooo');
INSERT INTO POST(DAY, TITLE, BODY) VALUES('20221010', 'BBBB', 'Byeeeeee');
INSERT INTO POST VALUES('LUNCH', '20230808', 'FAVORITE');
INSERT INTO POST VALUES('NEW', '20221111', 'NEW POST');
INSERT INTO POST VALUES('SLEEPY...', '20231013', 'COFFEE...');

-- POST ���̺� �־�, DAY�� ���� '20231013'�� �����͸� ����
DELETE FROM POST WHERE DAY='20231013';
-- DELETE FROM POST;       -- TRUNCATE�� �Ȱ���, �����Ͱ� ��� ����

-- POST ���̺� ���� ��ü �˻��Ͽ� ���
SELECT * FROM POST;

-- DROP :: ���̺� ���� (������, ���̺� ���� ��� ����)
-- TRUNCATE :: ���̺� ���� (�����͸� ��ü ����, ���̺� ���� ��������)
DROP TABLE POST;





