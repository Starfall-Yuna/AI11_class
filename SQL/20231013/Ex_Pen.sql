-- PEN_LIST ���̺� ���� => ����ȸ��(COMPANY), ����(COLOR)
-- PEN_LIST ���̺� ���
CREATE TABLE PEN_LIST(
    COMPANY VARCHAR(15),
    COLOR VARCHAR(15)
);
SELECT * FROM PEN_LIST;
COMMIT;

-- PEN_LIST ���̺�� PEN���� ����   -> ALTER(RENAME)
ALTER TABLE PEN_LIST RENAME TO PEN;
-- PEN ���̺� �� COMPANY Į���� COM���� ����   -> ALTER(RENAME COLUMN)
ALTER TABLE PEN RENAME COLUMN COMPANY TO COM;
-- PEN ���̺� ����(THICKNESS) Į�� �߰�     -> ALTER(ADD)
ALTER TABLE PEN ADD THICKNESS FLOAT;
-- PEN ���̺� ����(PRICE) Į�� �߰�         -> ALTER(ADD)
ALTER TABLE PEN ADD PRICE INT;
-- PEN ���̺� ���
SELECT * FROM PEN;
COMMIT;

-- PEN ���̺� ���� ������ 5-10�� ����     -> INSERT
INSERT INTO PEN VALUES('�𳪹�', 'BLACK', 0.5, 1700);
INSERT INTO PEN VALUES('��Ʈ��Ʈ��', 'RED', 0.7, 2500);
INSERT INTO PEN VALUES('�ڹ�', 'BLUE', 0.35, 2000);
INSERT INTO PEN VALUES('�����', 'BLACK', 0.5, 2000);
INSERT INTO PEN VALUES('��Ʈ��Ʈ��', 'BLUE', 0.5, 3000);
-- PEN ���̺� ��ü ������ ���
SELECT * FROM PEN;
COMMIT;

-- PEN ������ ��, ������ 2000�� �̻��� �������� ����ȸ�縦 ��� '�𳪹�'�� ����
--      -> UPDATE ���ؼ�, ���� �ɾ��ְ� ������ ����
UPDATE PEN SET COM='�𳪹�' WHERE PRICE>=2000;
-- PEN ������ ��, ���Ⱑ 0.5�� �������� ������ 1500���� ����
UPDATE PEN SET PRICE=1500 WHERE THICKNESS=0.5;
-- PEN ���̺� ��ü ������ ���
SELECT * FROM PEN;

-- PEN ���̺� �� ����, ���� Į�� �����͸� ���
SELECT THICKNESS, COLOR FROM PEN;
-- PEN ������ ��, ������ 'BLACK'�� �������� ����, ����, ���� Į�� �����͸� ���
SELECT COLOR, THICKNESS, PRICE FROM PEN WHERE COLOR='BLACK';
COMMIT;

-- PEN ���̺��� ��� ������ ����   -> TRUNCATE
TRUNCATE TABLE PEN;
-- PEN ���̺� ��ü ���
SELECT * FROM PEN;
-- PEN ���̺� ��ü ����        -> DROP
DROP TABLE PEN;