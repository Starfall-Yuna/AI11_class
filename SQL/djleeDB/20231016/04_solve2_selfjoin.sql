create sequence samsungperson;
create table mysamsungpeople(
id int primary key,
name varchar2(30) not null,
boss_id int);

insert into mysamsungpeople values (samsungperson.nextval, '이건희', samsungperson.currval);
select * from mysamsungpeople;
insert into mysamsungpeople values (samsungperson.nextval, '홍라희', samsungperson.currval);
insert into mysamsungpeople values (samsungperson.nextval, '이부진', 1);
insert into mysamsungpeople values (samsungperson.nextval, '이재용', 1);
insert into mysamsungpeople values (samsungperson.nextval, '신라호텔',3);
insert into mysamsungpeople values (samsungperson.nextval, '삼성전자',4);
insert into mysamsungpeople values (samsungperson.nextval, '수원삼성',4);
insert into mysamsungpeople values (samsungperson.nextval, '삼성라이온즈',4);

commit;

select b.name 이름, a.name 보스 from mysamsungpeople a join mysamsungpeople b on a.id=b.boss_id;








