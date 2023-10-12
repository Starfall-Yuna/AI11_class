-- SNACK ���̺� ����         -> CREATE TABLE ���
-- => ���� �̸�, ��ȣ��, ����, ����
CREATE TABLE SNACK(
    NAME VARCHAR(20),
    LOVING INT,
    PRICE INT,
    CALOLIE FLOAT
);

-- 5-10���� ������ SNACK ���̺� ����     -> INSERT ���
INSERT INTO SNACK VALUES('�����', 3, 1800, 550);
INSERT INTO SNACK VALUES('�̺�����', 4, 1000, 250);
INSERT INTO SNACK VALUES('���̽�', 1, 2500, 400);
INSERT INTO SNACK VALUES('������', 5, 5000, 1000);
INSERT INTO SNACK VALUES('��īĨ', 4, 1500, 400);
INSERT INTO SNACK VALUES('������', 3, 1800, 560);
INSERT INTO SNACK VALUES('��ġ', 5, 1500, 360);

-- ��� SNACK ������ �˻��Ͽ� ���
SELECT * FROM SNACK;

-- SNACK ���̺��� ������ ���� ��� (COUNT �Լ� ����)
SELECT COUNT(*) FROM SNACK;

-- DELETE :: ������ �����ϴ� ��ɹ�
-- DELETE FROM ���̺�� [WHERE ���ǹ�];
-- [WHERE ���ǹ�] �κ��� ������, ���̺� �ִ� ��� ������ ������

-- �Ʒ��� ���ϴ� �����͵� ������ ��, �����ִ� ������ ���
-- ������ 2000�� �̻��� ���� ������ ����
DELETE FROM SNACK WHERE PRICE>=2000;
-- ��ȣ���� 1 ������ ���� ������ ����
DELETE FROM SNACK WHERE LOVING<=1;
-- ������ 500 �̻��� ���� ������ ����
DELETE FROM SNACK WHERE CALOLIE>=500;

SELECT * FROM SNACK;

-- DELETE FROM SNACK;   => SNACK�� �����ִ� ��� ������ ����
    
-- SNACK ���̺� ���� (���̺� ��� ����)
-- DROP TABLE SNACK;

COMMIT;