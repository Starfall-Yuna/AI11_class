/*
1. �μ� ���̺� ����
- �ڵ� char(3)
- �μ��� varchar2(100)
2. ���� ���̺� ����
- �ڵ� int
- ���޸� varchar2(100)
3. �λ� ���̺��� �����.
- ��� char(5)
- �μ��ڵ�
- �����ڵ�
- �̸� varchar2(100)
- ���� int
- ���� char(1)
- HP varchar2(15) unique
*/

create table buseo (code char(3) primary key, name varchar2(100));

create table jikgeup(code int primary key, name varchar2(100));

create table insa(
sabeon char(5),
buseo_code char(3) references buseo(code),
jikgeup_code int references jikgeup(code),
name varchar2(100),
age int,
gender char(1),
hp varchar2(15) unique);

-- 4. �μ� 3��, ���� 3��, ��� 10���� �����. 
insert into buseo values('A01', '����1��');
insert into buseo values('B01', '����2��');
insert into buseo values('CCC', '�濵����');

CREATE SEQUENCE jikseq START WITH 1 INCREMENT BY 1;

insert into jikgeup values(jikseq.nextval, '���');
insert into jikgeup values(jikseq.nextval, '�븮');
insert into jikgeup values(jikseq.nextval, '����');


insert into insa values('00001', 'A01', 1, '�̵���', 35, 'M', '010-2940-1613');
insert into insa values('00002', 'B01', 2, '������', 25, 'F',NULL);
insert into insa values('00003', 'CCC', 3, '������', 45, 'M', '010-2940-1111');
insert into insa values('00004', 'CCC', 2, '������', 40, 'M', '010-2940-2222');
insert into insa values('00005', 'B01', 2, '������', 29, 'M', '010-2940-3333');
insert into insa values('00006', 'B01', 2, '������', 55, 'M', '010-2940-4444');
insert into insa values('00007', 'CCC', 3, '��ä��', 60, 'M', '010-5555-1613');
insert into insa values('00008', 'A01', 3, '�ֱ���', 38, 'M', '010-1234-1613');
insert into insa values('00009', 'A01', 3, 'ǥ�ֱ�', 37, 'M', '010-7777-1613');
insert into insa values('0000A', 'A01', 1, '��ȿ��', 27, 'F', '010-8888-1613');


SELECT * FROM BUSEO;
SELECT * FROM JIKGEUP;
SELECT * FROM INSA;

-- 5. ���� �̾��� ����� ã�� ������ �ۼ�
-- %�� �ǹ� : �ּ� 0���� �̻�
-- '��%' = ��, �̵���, ����, ������ ���... �� ��
SELECT * FROM INSA WHERE NAME LIKE '��%';
-- �� �� ���ڰ� ��
SELECT * FROM INSA WHERE NAME LIKE '%��';
-- ���� ���ԵǸ� �� OK
SELECT * FROM INSA WHERE NAME LIKE '%��%';

--6. ���� ���� ���̴� �� ������ ���
SELECT MAX(AGE) FROM INSA;
SELECT MAX(AGE) �ְ�� FROM INSA;

--7. ���� ���̰� � ����� ã��
-- AGE���� MIN(AGE)�� ������ ����� ã�ƾ� �Ѵ�.
-- �̷����� �ۼ��� ��ø ���Ƕ�� �Ѵ�.
SELECT * FROM INSA WHERE AGE = (SELECT MIN(AGE) FROM INSA);

--8. ���� ���̰� ���� �μ� ã��(��� ���� ����)
-- �μ��� ��� ���̸� ���ؾ� �Ѵ�.
SELECT BUSEO_CODE, AVG(AGE) FROM INSA GROUP BY BUSEO_CODE;
SELECT BUSEO_CODE, ROUND(AVG(AGE),1) FROM INSA GROUP BY BUSEO_CODE;

-- ��� ���� �� �߿��� �� ROUND, AVG ���� �̿��ؼ� VIEW ���� ����
-- �� �κп� ���� �ӽ� �̸��� �ٿ� ��� ��!

--ORA-00998: �� ���� ���� ����� �Բ� �����ؾ� �մϴ�
--00998. 00000 -  "must name this expression with a column alias"
--CREATE VIEW AVG_BUSEO AS SELECT BUSEO_CODE, ROUND(AVG(AGE),1) FROM INSA GROUP BY BUSEO_CODE;
CREATE VIEW AVG_BUSEO AS SELECT BUSEO_CODE, ROUND(AVG(AGE),1) RVA FROM INSA 
GROUP BY BUSEO_CODE;
--���� ���
SELECT * FROM AVG_BUSEO;
--SQL ����: ORA-01733: ���� ���� ����� �� �����ϴ�
--01733. 00000 -  "virtual column not allowed here"
--��� INSERT, UPDATE, DELETE�� �� �ȴ�.
-- ������ �÷��� ��� �� �ȴٰ� ǥ���ߴ� ��, ������ �÷��̶�⺸�ٴ� '���� �÷�'�� ���ؼ��� �߰� ���� ���� �� ��
-- INSERT INTO AVG_BUSEO VALUES('AAA',33.3);


-- �� �߿��� MAX�� ���� ���ؾ� �Ѵ�.
SELECT * FROM AVG_BUSEO WHERE RVA=(SELECT MAX(RVA) FROM AVG_BUSEO);

-- �μ��� ��� ���̰� MAX�� ��ġ�ϴ� �μ��� ã�ƾ� �Ѵ�.
SELECT NAME, BUSEO_CODE, RVA FROM AVG_BUSEO
JOIN BUSEO ON AVG_BUSEO.BUSEO_CODE=BUSEO.CODE
WHERE RVA=(SELECT MAX(RVA) FROM AVG_BUSEO);

--VIEW�� ������ ������ �޴´�.
insert into insa values('0000B', 'A01', 1, '���¿�', 127, 'M', '010-1888-1613');


--9. ������ ��� ���� ����ϱ�
SELECT GENDER, AVG(AGE) FROM INSA GROUP BY GENDER; 


-- 10. �λ� ���̺��� ����ϵ�, �μ��ڵ�� �����ڵ�鵵 �μ���� ���޸����� ����ϱ�
-- �� 3���� ���̺��� ���� �����ؾ� ��
-- IF���� AND�� �����ϸ� ���� �� ����. ������ �������� ��

--1. JOIN�� �̿��ϴ� ���
SELECT SABEON, INSA.NAME, BUSEO.NAME, JIKGEUP.NAME FROM INSA JOIN BUSEO ON 
INSA.BUSEO_CODE=BUSEO.CODE JOIN JIKGEUP ON INSA.JIKGEUP_CODE=JIKGEUP.CODE;

--2. WHERE�� �̿��ϴ� ���
SELECT SABEON ���, INSA.NAME �̸�, BUSEO.NAME �μ�, JIKGEUP.NAME ����, AGE ����
FROM INSA,BUSEO,JIKGEUP
WHERE INSA.BUSEO_CODE = BUSEO.CODE AND INSA.JIKGEUP_CODE = JIKGEUP.CODE;

-- ���� �� ����
SELECT SABEON ���, INSA.NAME �̸�, BUSEO.NAME �μ�, JIKGEUP.NAME ����, AGE ����
FROM INSA,BUSEO,JIKGEUP
WHERE INSA.BUSEO_CODE = BUSEO.CODE AND INSA.JIKGEUP_CODE = JIKGEUP.CODE
ORDER BY ���� /*DESC*/; --�����ڸ� �� ���� ���� �ʹٸ� ���� DESC �߰��ϸ� ��

-- �μ��� ���̺��� ���� �� 40�� �̻� ǥ��
 SELECT BUSEO_CODE, ROUND(AVG(AGE),1) RVA FROM INSA 
GROUP BY BUSEO_CODE HAVING ROUND(AVG(AGE),1) >=40;



