create table book
(bookid number primary key,
bookname varchar2(40),
publisher varchar2(40),
price number);

create table customer
(custid number primary key,
name varchar2(40),
address varchar2(50),
phone varchar2(20));

-- fk가 2개, book, customer에서 가져옴
create table orders 
(
   orderid number primary key,
   custid number,
   bookid number,
   saleprice number,
   orderdate date default sysdate,
   foreign key (custid) references customer(custid),   
   foreign key (bookid) references book(bookid)
);

ALTER TABLE orders DROP COLUMN SALEPRICE;

-- insert
insert into book values(1,'축구의 역사','굿스포츠',7000);
insert into book values(2,'축구아는 여자','나무수',13000);
insert into book values(3,'축구의 이해','대한미디어',22000);
insert into book values(4,'골프 바이블','대한미디어',35000);
insert into book values(5,'피겨 교본','굿스포츠',8000);
insert into book values(6,'역도 단계별기술','굿스포츠',6000);
insert into book values(7,'야구의 추억','이상미디어',20000);
insert into book values(8,'야구를 부탁해','이상미디어',13000);
insert into book values(9,'올림픽 이야기','삼성당',7500);
insert into book values(10,'Olympic Champions','Pearson',13000);
insert into book values(11,'한방 의약품','경희대학교',103000);
insert into book values(12,'양약 의약 사전','서울대학교',1300000);

insert into customer values(1,'박지성','영국 멘체스타', '000-5000-0001');
insert into customer values(2,'김연아','대한민국 서울', '000-6000-0001');
insert into customer values(3,'장미란','대한민국 강원도', '000-7000-0001');
insert into customer values(4,'추신수','미국 클리블랜드', '000-8000-0001');
insert into customer values(5,'박세리','대한민국 대전', null);
insert into customer values(6,'이재영','그리스', null);
insert into customer values(7,'이다영','그리스', null);
insert into customer values(8,'석현준','대한민국 충주', null);

insert into Orders(orderid,custid,bookid) values(2,1,3); --1번 고객 3번책 구매
insert into Orders(orderid,custid,bookid) values(3,2,5); --2번 고객 5번책 구매
insert into Orders(orderid,custid,bookid) values(4,3,6); --3번 고객 6번책 구매
insert into Orders(orderid,custid,bookid) values(5,4,7); --4번 고객 7번책 구매
insert into Orders(orderid,custid,bookid) values(6,1,2); --1번 고객 2번책 구매
insert into Orders(orderid,custid,bookid) values(7,4,8); --4번 고객 8번책 구매
insert into Orders(orderid,custid,bookid) values(8,3,10); --3번 고객 10번책 구매
insert into Orders(orderid,custid,bookid) values(9,2,10); --2번 고객 10번책 구매
insert into Orders(orderid,custid,bookid) values(10,3,8); --3번 고객 8번책 구매


insert into Orders(orderid,custid,bookid) values(1,6,10); --3번 고객 8번책 구매
insert into Orders(orderid,custid,bookid) values(11,7,11); --3번 고객 8번책 구매
insert into Orders(orderid,custid,bookid) values(12,6,12); --3번 고객 8번책 구매

-- 1-2. update 5개

update customer set phone='010-2940-1613' where custid=5;
update customer set address='대한민국 대구' where custid=1;
update customer set name='류현진' where custid=4;
update customer set address='캐나다 토론토' where custid=4;
update customer set phone=null where custid=3;


--1-3. delete 5개
delete from orders where orderid >10;
delete from orders where orderid = 1;
delete from book where price > 100000;
delete from customer where name like '이%';
delete from customer where address like '%충주%';


--select들
select * from book order by bookid;
select * from customer;
select * from orders;


-- join
select orders.orderid as 주문번호, customer.name as 주문자명, book.bookname as 책이름, book.price as 책가격, orderdate 
from orders join book on orders.bookid=book.bookid join customer on orders.custid=customer.custid order by 주문번호;

-- group by
-- 출판사별 가격 총 합
select sum(price), publisher from book group by publisher;

-- having
-- 가격 총 합이 3만원 넘는 출판사들만 표시
select  publisher from book group by publisher having sum(price)>30000;

-- view
-- 가장 값비싼 책 가격
create view maxBookPrice as select max(price) maxPrice from book;


-- 중첩 질의
-- 가장 비싼 책 찾기
select * from book where price = (select * from maxBookPrice);






















