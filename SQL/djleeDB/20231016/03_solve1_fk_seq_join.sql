create sequence mymusic;
--drop table djsong;
create table djsong
( id int primary key,
title varchar2(60) not null, --최대 20글자, 절대 빈 칸 일 수 없음
price int);

--최대 20글자 = nvarchar2(20)
-- nvarchar나 nchar 없이 이 조건을 만족하려면 varchar2(60)을 해야 함
-- 한글은 1글자당 3byte이므로 이렇게 한다.
-- nvarchar nchar이거를 지원하지 않는 dbms도 있고
-- 통상적으로 가~~~장 많이 쓰이는 게 varchar이므로 안 쓴다.

insert into djsong values(mymusic.nextval, 'Gee', 5000);
insert into djsong values(mymusic.nextval, 'Tell Me', 6000);
insert into djsong values(mymusic.nextval, 'Hug', 5500);
insert into djsong values(mymusic.nextval, '거짓말', 7500);
insert into djsong values(mymusic.nextval, '촛불', 9500);
insert into djsong values(mymusic.nextval, 'Love Lee', 10000);

select * from djsong;

create sequence mysinger;
-- id int default mysinger.nextval primary key
-- id를 입력하지 않으면 알아서 1번부터 하나씩 증가한다.
--nextval이라는 것과 currval이라는 것이 있다.
-- nextval = 값을 주고 그 값을 증가시킴
-- currval = 값을 주기만 함
create table djsinger (
id int default mysinger.nextval primary key,
name varchar2(30),
hit_song_id int,
CONSTRAINT fk_hit foreign key (hit_song_id) references djsong(id)
);

insert into djsinger(name, hit_song_id) values ('소녀시대',1);
insert into djsinger(name, hit_song_id) values ('원더걸스',2);
insert into djsinger(name, hit_song_id) values ('동방신기',3);
insert into djsinger(name, hit_song_id) values ('AKMU',6);

insert into djsinger(name, hit_song_id) values ('이동준',100); --song id가 100인 노래가 없음

select * from djsong;
select * from djsinger;

select djsinger.name 가수이름, djsong.title 히트곡이름 from djsinger join djsong 
on djsinger.hit_song_id = djsong.id;

--join도 여러 종류가 있음
-- left join, right join, full join이 있음
-- 일반적인 join은 inner join이라고 함
-- inner join의 경우에는 공통된 값, 그러니까 둘 다 존재하는 것만 표시해줌

--right join의 경우 오른쪽 테이블에 있는 데이터들은 무조건 다 출력함
select djsinger.name 가수이름, djsong.title 히트곡이름 from djsinger right join djsong 
on djsinger.hit_song_id = djsong.id;

insert into djsinger(name) values('이동준');

--left join의 경우 왼쪽 테이블에 있는 데이터들은 무조건 다 출력함
select djsinger.name 가수이름, djsong.title 히트곡이름 from djsinger left join djsong 
on djsinger.hit_song_id = djsong.id;

-- 전부 다 보여줌(왼쪽, 오른쪽 전부)
select djsinger.name 가수이름, djsong.title 히트곡이름 from djsinger full join djsong 
on djsinger.hit_song_id = djsong.id;


select * from djsong;
delete from djsong where id=9;
--시퀀스 값 바꾸는 법
--1. 지운다.
drop sequence mymusic;
--2. 새로 만들되, 내가 시작하고 싶은 번호부터 시작하도록 한다.
create sequence mymusic start with 7 increment by 1;


-- || : 문자열 이어붙이기(java에서 +로 문자열 이어붙인 거랑 똑같음)
insert into djsong values(mymusic.nextval, 'You' || '&' || 'Me', 12000);
select mymusic.currval from dual; 
insert into djsong values(mymusic.nextval, 'Super Shy', 15000);

delete from djsong where title='Super Shy';
select * from djsong;

insert into djsong values(mymusic.nextval, '호랑나비', 9000);
select mymusic.currval from dual;

drop SEQUENCE mymusic;
create sequence mymusic start with 8 increment by 1;
delete from djsong where title='호랑나비';
insert into djsong values(mymusic.nextval, '호랑나비', 9000);






