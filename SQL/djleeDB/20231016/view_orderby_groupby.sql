-- ��(VIEW)
-- ���� ���̺��� �ƴϰ� ���� ���̺�
-- �⺻���� ���� ���� ������ �� �ǰ�(= �� ������ ������ ��쿡�� �� �ǰ� �ܼ��� �������� �ȴ�)
-- ��� ������ �ٲ�� VIEW�� ���� �ٲ�
-- VIEW = SELECT �����
-- SELECT���� �ʹ� ���������ų� Ȥ�� �� ���� ���̴� SELECT���� �� �� ���ϰ� �ҷ������� ���� ��
-- �⺻ �뵵 ��ü�� �����͸� '���� ����'

CREATE VIEW MYSTUDENT AS 
SELECT HAKBEON, KBSTUDENT.NAME NAME, KBMAJOR.NAME MAJ_NAME FROM KBSTUDENT 
JOIN KBMAJOR ON kbstudent.hakgwa_code=KBMAJOR.CODE;

SELECT * FROM MYSTUDENT; --MYSTUDENT�� ���� ���� �ƴ�. 
--KBSTUDENT, KBMAJOR�� ������� ������ ǥ(SELECT �����)
-- DELETE, UPDATE, INSERT�� �ܼ��� ������ VIEW������ �Ǵ� ��, ������ ������ VIEW������ �� ��
DELETE FROM MYSTUDENT WHERE MAJ_NAME = 'ȭ��';
SELECT * FROM KBSTUDENT;

INSERT INTO KBSTUDENT VALUES(2,'������','002');

-- VIEW�� ���ؼ� SELECT���� �ܼ�ȭ�ϰ�, ���� ������ ������ JOIN� ������ ������

--------------------------------------------

-- ������� ����ϴ� ��
-- ~������ ����ϴ� �� : ORDER BY
-- ORDER : ����
SELECT * FROM KBSTUDENT;
SELECT * FROM KBSTUDENT ORDER BY HAKBEON; --�й� ������ ���(��������)
SELECT * FROM KBSTUDENT ORDER BY HAKBEON DESC; --�й� ������ ���(��������)

-- �׷� ���� ����ϴ� ��(Group by, Having)
-- ���� �� �л��� 100���� �ִ�. 
-- ���л� n��, ���л� m���� ���� ��, �л����� ��� ���� ����� ���ϴ� ���� '�׷캰��' ���´ٰ� ��

-- KBSTUDENT�� ���� ��� �а����� �� ���ִ� �� ����غ� �� �ִ�.
-- ���� KBSTUDENT�� ���� ������ �־��ٸ� �а����� ��� ���̵ ���� �� ���� ���̴�.
SELECT HAKGWA_CODE, COUNT(*) FROM KBSTUDENT GROUP BY HAKGWA_CODE;

-- VIEW�� �̿��ϸ� ���ϰ���?
-- COUNT(*) : ���� ��(Row ����)
SELECT MAJ_NAME, COUNT(*) FROM MYSTUDENT GROUP BY MAJ_NAME;

--group by�� where���� �ִ� �� �ٷ� having��
-- group by������ ��밡���� where��

--ex. �а����� ���� �� ���ִ� �� ���ϰ�, �� �߿��� 1���� �Ѵ� ���� ����϶�
SELECT MAJ_NAME, COUNT(*) FROM MYSTUDENT GROUP BY MAJ_NAME having count(*)>1;






















