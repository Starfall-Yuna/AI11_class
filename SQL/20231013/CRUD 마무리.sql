-- DDL(Defination) :: ������ ����(DB, ���̺�, ...) ����
--      => CREATE(����), "ALTER(����)", DROP, TRUNCATE(����)
-- DML(Manipulation) :: ������ ����
--      => INSERT(����), "UPDATE(����)", DELETE(����)   (+SELECT)
--      CRUD = DDL + DML

-- �޴��� ���̺� ����
CREATE TABLE PHONE(
    NAME VARCHAR2(20),       -- ����
    OS VARCHAR2(20),         -- �ü��
    DAY INT,                 -- ��ó⵵
    WAT INT,                 -- ���͸� �ִ� ��Ʈ
    COLOR VARCHAR(10)       -- ����
);

SELECT * FROM PHONE;

-- ALTER :: ������ ������ ���� �����ϴ� ��ɾ�
--  => ADD(Į�� �߰�)
--  => DROP COLUMN (Į�� ����)
--  => MODIFY (Į���� Ÿ�� ����)
--  => RENAME (���̺�� ����)
--  => RENAME COLUMN (Į���� ����)

-- ADD :: Į�� �߰�
-- ALTER TABLE ���̺�� ADD Į���� Į��Ÿ��;
-- PHONE ���̺� FLOAT�� INCH Į�� �߰�
ALTER TABLE PHONE ADD INCH FLOAT;

-- DROP COLUMN :: Į�� ����
-- ALTER TABLE ���̺�� DROP COLUMN Į����;
-- PHONE ���̺� WAT Į�� ����
ALTER TABLE PHONE DROP COLUMN WAT;

-- RENAME :: ���̺�� ����
--  ALTER TABLE ���̺�� RENAME TO ������_���̺��;
-- RENAME COLUMN :: Į���� ����
--  ALTER TABLE ���̺�� RENAME COLUMN ����_Į���� TO ������_Į����

-- PHONE ���̺��� SMARTPHONE_LIST�� �̸� ����;
ALTER TABLE PHONE RENAME TO SMARTPHONE_LIST;
ALTER TABLE SMARTPHONE_LIST RENAME TO PHONE;
-- PHONE ���̺��� DAY Į������ YEAR�� �̸� ����;
ALTER TABLE PHONE RENAME COLUMN DAY TO YEAR;

-- MODIFY :: ������ Į���� Ÿ�� ����
--  ALTER TABLE ���̺�� MODIFY Į���� ������_Į��Ÿ��;
-- PHONE ���̺���, INCH Į���� Ÿ���� FLOAT->INT�� ����
--      �����͸� ��� ���·� MODIFY�� �����ؾ��Ѵ�.
--      ����� �ϴµ��� �����ϴ�, �� �� ���� �� ������ �̷� �� �ִ� ������...
ALTER TABLE PHONE MODIFY INCH INT;

SELECT * FROM PHONE;
SELECT * FROM SMARTPHONE_LIST;

-- INSERT ���ؼ� ������ �߰�
INSERT INTO PHONE VALUES('������S20', '11', 2021, 'PINK', 6.4);
INSERT INTO PHONE VALUES('������13', '10', 2023, 'WHITE', 7.0);
INSERT INTO PHONE VALUES('����������2', '12', 2022, 'BLUE', 8.5);

-- UPDATE :: Ư�� �����͸� �����ϴ� ��ɾ�
-- UPDATE ���̺�� SET Į��1=���氪1, ... WHERE ������;
-- ��ó⵵�� 2022�� �������� OS ���� 13���� ����
UPDATE PHONE SET OS='13' WHERE DAY='2022';
-- ������ ������13�� �������� OS���� 13���� ����, COLOR���� BLACK���� ����
UPDATE PHONE SET OS='13', COLOR='BLACK' WHERE NAME='������13';

SELECT * FROM PHONE;






