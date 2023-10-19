-- THINGS ���̺� ���� :: ǰ���, ����, ��� (ǰ����� �⺻Ű��)
CREATE TABLE THINGS(
    NAME VARCHAR2(20) PRIMARY KEY,
    PRICE INT,
    CNT INT
);
SELECT * FROM THINGS;

-- ������ 7�� ����
INSERT INTO THINGS VALUES ('����', 3000, 5);
INSERT INTO THINGS VALUES ('����', 1000, 50);
INSERT INTO THINGS VALUES ('������', 1500, 20);
INSERT INTO THINGS VALUES ('����', 2000, 20);
INSERT INTO THINGS VALUES ('�����', 1500, 30);
INSERT INTO THINGS VALUES ('��å', 2500, 10);
INSERT INTO THINGS VALUES ('����', 5000, 25);

EXEC DELETE_ALL();

DELETE FROM THINGS;

-- ���ν��� ���� :: ��ũ��Ʈ ��� �� "*** ��� �����Ͱ� ������ϴ� ***" ����ϸ鼭
--      ���̺� �� ��� ������ ����� ���ν��� ����
/
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE DELETE_ALL
IS BEGIN
    -- ���ν��� ����
    -- ��ũ��Ʈ ��¿� ���Ǵ� PL�� :: DBMS_OUTPUT.PUT_LINE('��¹�');
    
    DBMS_OUTPUT.PUT_LINE('*** ��� �����Ͱ� ������ϴ� ***');
    DELETE FROM THINGS;
END DELETE_ALL;
/

-- ���ν��� :: ������ �صΰ�, ȣ���� ������ �ؾ�����
-- Ʈ���� :: "��Ƽ�", Ư�� ��ɹ��� �������� �� "�ڵ����� ȣ��"��
--          �����ϴ� ������ ������, ȣ���ϴ� ������ ������ ����
-- Ʈ���� ����
-- CREATE OR REPLACE TRIGGER Ʈ���Ÿ�
-- [BEFORE/AFTER] [Ʈ���� ������ ��ɹ�]    -- (ex)BEFORE INSERT
-- ON ���̺��
-- (FOR EACH ROW)  -- �ۼ��صθ�, Ʈ���� ������ ��ɹ� ������ ������ ����
--            -- �ۼ��� �� �ϸ�, �� �ѹ� �����ϰ� �� ���ķ� ���� �ȵ�
-- DECLARE     -- "�����ϴ�"
--    -- ���� �����ϴ� �κ�
-- BEGIN 
--    -- Ʈ���� ���� �ۼ��ϴ� �κ�
-- END;

-- INSERT�� ���� ��, "*** �����͸� �߰��մϴ�. ***" ���
CREATE OR REPLACE TRIGGER ALARM_INSERT
AFTER INSERT ON THINGS       -- THINGS ���̺� ���Ͽ�, INSERT�� ���� �� ȣ��
FOR EACH ROW
DECLARE BEGIN
    -- Ʈ���� ����
    DBMS_OUTPUT.PUT_LINE('*** �����͸� �߰��մϴ�~ ***');
END;
/
-- DELETE�� �������� ��, "*** �����͸� �ϳ� �����մϴ�~ ***" ���
CREATE OR REPLACE TRIGGER ALARM_DELETE
AFTER DELETE ON THINGS
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('*** �����͸� �ϳ� �����մϴ�~ ***');
END;

-- 1. DDL(�����ͱ��� ��ɾ�)�� ���� Ʈ���� �ۼ��صΰ�, 
--      BEGIN-END ���̿� DML(������ ��ɾ�) ��ɾ� ���� �׽�Ʈ ������ ����
-- 2. DML(������ ��ɾ�)�� ���� Ʈ���� �ۼ��صΰ�,
--      �ܼ� ��¹� ����



