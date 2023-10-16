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

insert into buseo values('A01', '교무1팀');
insert into buseo values('B01', '교무2팀');
insert into buseo values('CCC', '경영지원');

CREATE SEQUENCE jikseq START WITH 1 INCREMENT BY 1;

insert into jikgeup values(jikseq.nextval, '사원');
insert into jikgeup values(jikseq.nextval, '대리');
insert into jikgeup values(jikseq.nextval, '과장');


insert into insa values('00001', 'A01', 1, '이동준', 35, 'M', '010-2940-1613');
insert into insa values('00002', 'B01', 2, '이유나', 25, 'F',NULL);
insert into insa values('00003', 'CCC', 3, '김형준', 45, 'M', '010-2940-1111');
insert into insa values('00004', 'CCC', 2, '박준현', 40, 'M', '010-2940-2222');
insert into insa values('00005', 'B01', 2, '정제원', 29, 'M', '010-2940-3333');
insert into insa values('00006', 'B01', 2, '곽봉구', 55, 'M', '010-2940-4444');
insert into insa values('00007', 'CCC', 3, '방채문', 60, 'M', '010-5555-1613');
insert into insa values('00008', 'A01', 3, '최광욱', 38, 'M', '010-1234-1613');
insert into insa values('00009', 'A01', 3, '표주광', 37, 'M', '010-7777-1613');
insert into insa values('0000A', 'A01', 1, '정효미', 27, 'F', '010-8888-1613');






