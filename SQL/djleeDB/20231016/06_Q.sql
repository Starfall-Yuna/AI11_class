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






