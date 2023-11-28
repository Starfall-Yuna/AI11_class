-- 이런 주석
# 이런 주석
# mysql에서는 schema=database랑 동일
#(오라클의 user랑 같다고 보면 됨)
#결론적으로 이 안에 여러 개의 테이블이 들어감
#코드 실행 : ctrl + enter(해당 코드 쪽을 클릭해두기)
create database apidb;
use apidb;
create table test1
(name varchar(50) primary key,
hp varchar(30) unique,
menu varchar(100) not null);

insert into test1(name, hp, menu)
values('테스트식당','010-2940-1613','이동준찌개');

select * from test1;
#단, 수정과 삭제는 기본적으론 안 되고, 별도의 절차 필요
#safe 기능 적용하려면 workbench를 껐다 켜야 함
update test1 set menu='김치찌개' where name='테스트식당';
#delete from test1 where menu='김치찌개';
delete from test1;
select * from test1;

drop table test1; # 테이블 영구 삭제

