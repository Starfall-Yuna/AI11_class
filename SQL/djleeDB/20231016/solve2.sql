create sequence samsungperson;
create table mysamsungpeople(
id int primary key,
name varchar2(30) not null,
boss_id int);

insert into mysamsungpeople values (samsungperson.nextval, '�̰���', samsungperson.currval);
select * from mysamsungpeople;
insert into mysamsungpeople values (samsungperson.nextval, 'ȫ����', samsungperson.currval);
insert into mysamsungpeople values (samsungperson.nextval, '�̺���', 1);
insert into mysamsungpeople values (samsungperson.nextval, '�����', 1);
insert into mysamsungpeople values (samsungperson.nextval, '�Ŷ�ȣ��',3);
insert into mysamsungpeople values (samsungperson.nextval, '�Ｚ����',4);
insert into mysamsungpeople values (samsungperson.nextval, '�����Ｚ',4);
insert into mysamsungpeople values (samsungperson.nextval, '�Ｚ���̿���',4);

commit;

select b.name �̸�, a.name ���� from mysamsungpeople a join mysamsungpeople b on a.id=b.boss_id;








