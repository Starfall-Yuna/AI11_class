-- PK(Primary Key) :: �⺻Ű, �� �����͵鳢�� �����ϴ� ���� ���Ǵ� Į��
--  => ��� ���� ���� �ٸ� ���� ���� / null ���� �� ����
--  1) �⺻Ű �����Ϸ��� Į�� ���� "primary key" �ۼ�
CREATE TABLE STUDENT1(
    HAK_BUN VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(20)
);
--  2) CREATE TABLE �� ����, CONSTRAINT ���� �������� ����
--  CONSTRAINT �������Ǹ� PRIMARY KEY(Į����)
CREATE TABLE STUDENT2(
    HAK_BUN VARCHAR2(10),
    NAME VARCHAR2(20),
    CONSTRAINT PK_NUM PRIMARY KEY(HAK_BUN)
);


-- FK(Foreign Key) :: �ܷ�Ű, �ٸ� ���̺�� ���� �����Ͽ� �����ϴ� ���� ���
-- �����Ǵ� Ű�� �ݵ�� ����Ű/�⺻Ű���� ��
--  1) CREATE TABLE �� ����, CONSTRAINT ���� �������� ����
--      - Į���� ����, "FOREIGN KEY (�ܷ�Ű�� �� Į����) REFERENCES ������_���̺��(������ Ű)" �߰�
--      - ���̺� ������ �� ����, "CONSTRAINT �������Ǹ� FOREIGN KEY(�ܷ�Ű�� �� Į����) REFERENCES ������_���̺��(������ Ű)"
--  2) ALTER TABLE�� ADD CONSTRAINT �߰�
--      ALTER TABLE ���̺�� ADD CONSTRAINT
--      �������Ǹ� FOREIGN KEY(�ܷ�Ű�� �� Į����)
--      REFERENCES ������_���̺��(������ Ű);


-- JOIN :: 2�� �̻��� ���̺��� ����� ���� ����
--  (1) JOIN-ON�� ���� JOIN
--SELECT Į�����
--FROM ���̺��(A)
--JOIN ������_���̺��(B) ON A.Į����=B.Į����;
--                          �� Į���� ���� ������ �����ؾ���
--  (2)JOIN-WHERE�� ���� JOIN
--SELECT Į�����
--FROM ���̺��(A), ���̺��(B)
--WHERE A.Į����=B.Į����;

-- LEFT JOIN :: ���� ���̺��� ��� �� ����
--      ������ ���̺��� ��ġ�ϴ� �� �ִ� ��츸 ����
-- SELECT Į�����
-- FROM ���̺�1 LEFT JOIN ���̺�2
-- ON ���̺�1.Į����=���̺�2.Į����;

-- RIGHT JOIN :: ������ ���̺��� ��� �� ����
--      ���� ���̺��� ��ġ�ϴ� �� �ִ� ��츸 ����
-- SELECT Į�����
-- FROM ���̺�1 RIGHT JOIN ���̺�2
-- ON ���̺�1.Į����=���̺�2.Į����;


-- ORDER BY :: Ư�� Į�� �������� ������ ������ �� ���
--  SELECT Į���� FROM ���̺�� ORDER BY [Į���� ���Ĺ��(ASC/DESC)], ...;
--          Į������ Į�� ������ �־ �ȴ�.
--  (����Ʈ ���Ĺ���� ASC, ���������� DESC ���� �����ؾ���)
--  (ORACLE���� NULL�� ���� ū ������ ����)

-- GROUP BY :: ���� �� ���� �ೢ�� �ϳ��� �׷����� ���� �� ���, ���� �Լ��� ���� ���� ���
-- ���� �Լ� :: COUNT(), AVG(), MIN(), MAX(), SUM()
-- SELECT �����Լ� ��� FROM ���̺�� GROUP BY Į���� HAVING ������;
SELECT STUDENT.MAJOR "�а�", COUNT(*) "�� �ο�" FROM STUDENT GROUP BY MAJOR;
SELECT STUDENT.MAJOR "�а�", COUNT(*) "�� �ο�", COUNT(*) "��ü �ο�" FROM STUDENT GROUP BY MAJOR
    HAVING COUNT(*)>=1;


-- ���ν��� :: DB���� ������ �� �ִ� �ڵ� ��
--      ���α׷��� �� ���� ����, �Լ��� ����
--  [ ���ν��� ���� ]
--CREATE OR REPLACE PROCEDURE ���ν����� 
--IS
--    ���� ����
--BEGIN
--    ���ν��� ����(SQL ����, ���, ���� ���, ����ó�� ��)
--END ���ν�����;
-- (OR REPLACE ����Ͽ�, ���� �̸��� ���ν��� �Բ� ��� ����)

-- ���ν��� ȣ��
-- EXEC ���ν�����(�Ű�����, ...);
EXEC ADD_STU('�̻���', '1111', '���');

SELECT * FROM STUDENT;

COMMIT;

/
-- ������ ���� ���ν���
CREATE OR REPLACE PROCEDURE ADD_STU
(
    STU_NAME IN VARCHAR2,       -- IN :: �Է�
    STU_NUM IN VARCHAR2,
    STU_MAJOR IN VARCHAR2
)
IS BEGIN
    INSERT INTO STUDENT VALUES(STU_NAME, STU_NUM, STU_MAJOR);
END ADD_STU;