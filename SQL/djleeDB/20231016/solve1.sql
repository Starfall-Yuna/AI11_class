create sequence mymusic;
--drop table djsong;
create table djsong
( id int primary key,
title varchar2(60) not null, --�ִ� 20����, ���� �� ĭ �� �� ����
price int);

--�ִ� 20���� = nvarchar2(20)
-- nvarchar�� nchar ���� �� ������ �����Ϸ��� varchar2(60)�� �ؾ� ��
-- �ѱ��� 1���ڴ� 3byte�̹Ƿ� �̷��� �Ѵ�.
-- nvarchar nchar�̰Ÿ� �������� �ʴ� dbms�� �ְ�
-- ��������� ��~~~�� ���� ���̴� �� varchar�̹Ƿ� �� ����.

insert into djsong values(mymusic.nextval, 'Gee', 5000);
insert into djsong values(mymusic.nextval, 'Tell Me', 6000);
insert into djsong values(mymusic.nextval, 'Hug', 5500);
insert into djsong values(mymusic.nextval, '������', 7500);
insert into djsong values(mymusic.nextval, '�к�', 9500);
insert into djsong values(mymusic.nextval, 'Love Lee', 10000);

select * from djsong;

create sequence mysinger;
-- id int default mysinger.nextval primary key
-- id�� �Է����� ������ �˾Ƽ� 1������ �ϳ��� �����Ѵ�.
--nextval�̶�� �Ͱ� currval�̶�� ���� �ִ�.
-- nextval = ���� �ְ� �� ���� ������Ŵ
-- currval = ���� �ֱ⸸ ��
create table djsinger (
id int default mysinger.nextval primary key,
name varchar2(30),
hit_song_id int,
CONSTRAINT fk_hit foreign key (hit_song_id) references djsong(id)
);

insert into djsinger(name, hit_song_id) values ('�ҳ�ô�',1);
insert into djsinger(name, hit_song_id) values ('�����ɽ�',2);
insert into djsinger(name, hit_song_id) values ('����ű�',3);
insert into djsinger(name, hit_song_id) values ('AKMU',6);

insert into djsinger(name, hit_song_id) values ('�̵���',100); --song id�� 100�� �뷡�� ����

select * from djsong;
select * from djsinger;

select djsinger.name �����̸�, djsong.title ��Ʈ���̸� from djsinger join djsong 
on djsinger.hit_song_id = djsong.id;

--join�� ���� ������ ����
-- left join, right join, full join�� ����
-- �Ϲ����� join�� inner join�̶�� ��
-- inner join�� ��쿡�� ����� ��, �׷��ϱ� �� �� �����ϴ� �͸� ǥ������

--right join�� ��� ������ ���̺� �ִ� �����͵��� ������ �� �����
select djsinger.name �����̸�, djsong.title ��Ʈ���̸� from djsinger right join djsong 
on djsinger.hit_song_id = djsong.id;

insert into djsinger(name) values('�̵���');

--left join�� ��� ���� ���̺� �ִ� �����͵��� ������ �� �����
select djsinger.name �����̸�, djsong.title ��Ʈ���̸� from djsinger left join djsong 
on djsinger.hit_song_id = djsong.id;

-- ���� �� ������(����, ������ ����)
select djsinger.name �����̸�, djsong.title ��Ʈ���̸� from djsinger full join djsong 
on djsinger.hit_song_id = djsong.id;



insert into djsong values(mymusic.nextval, 'You' || '&' || 'Me', 12000);

select * from djsong;





