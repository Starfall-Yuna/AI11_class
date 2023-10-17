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

-- fk�� 2��, book, customer���� ������
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
insert into book values(1,'�౸�� ����','�½�����',7000);
insert into book values(2,'�౸�ƴ� ����','������',13000);
insert into book values(3,'�౸�� ����','���ѹ̵��',22000);
insert into book values(4,'���� ���̺�','���ѹ̵��',35000);
insert into book values(5,'�ǰ� ����','�½�����',8000);
insert into book values(6,'���� �ܰ躰���','�½�����',6000);
insert into book values(7,'�߱��� �߾�','�̻�̵��',20000);
insert into book values(8,'�߱��� ��Ź��','�̻�̵��',13000);
insert into book values(9,'�ø��� �̾߱�','�Ｚ��',7500);
insert into book values(10,'Olympic Champions','Pearson',13000);
insert into book values(11,'�ѹ� �Ǿ�ǰ','������б�',103000);
insert into book values(12,'��� �Ǿ� ����','������б�',1300000);

insert into customer values(1,'������','���� ��ü��Ÿ', '000-5000-0001');
insert into customer values(2,'�迬��','���ѹα� ����', '000-6000-0001');
insert into customer values(3,'��̶�','���ѹα� ������', '000-7000-0001');
insert into customer values(4,'�߽ż�','�̱� Ŭ������', '000-8000-0001');
insert into customer values(5,'�ڼ���','���ѹα� ����', null);
insert into customer values(6,'���翵','�׸���', null);
insert into customer values(7,'�̴ٿ�','�׸���', null);
insert into customer values(8,'������','���ѹα� ����', null);

insert into Orders(orderid,custid,bookid) values(2,1,3); --1�� �� 3��å ����
insert into Orders(orderid,custid,bookid) values(3,2,5); --2�� �� 5��å ����
insert into Orders(orderid,custid,bookid) values(4,3,6); --3�� �� 6��å ����
insert into Orders(orderid,custid,bookid) values(5,4,7); --4�� �� 7��å ����
insert into Orders(orderid,custid,bookid) values(6,1,2); --1�� �� 2��å ����
insert into Orders(orderid,custid,bookid) values(7,4,8); --4�� �� 8��å ����
insert into Orders(orderid,custid,bookid) values(8,3,10); --3�� �� 10��å ����
insert into Orders(orderid,custid,bookid) values(9,2,10); --2�� �� 10��å ����
insert into Orders(orderid,custid,bookid) values(10,3,8); --3�� �� 8��å ����


insert into Orders(orderid,custid,bookid) values(1,6,10); --3�� �� 8��å ����
insert into Orders(orderid,custid,bookid) values(11,7,11); --3�� �� 8��å ����
insert into Orders(orderid,custid,bookid) values(12,6,12); --3�� �� 8��å ����

-- 1-2. update 5��

update customer set phone='010-2940-1613' where custid=5;
update customer set address='���ѹα� �뱸' where custid=1;
update customer set name='������' where custid=4;
update customer set address='ĳ���� �����' where custid=4;
update customer set phone=null where custid=3;


--1-3. delete 5��
delete from orders where orderid >10;
delete from orders where orderid = 1;
delete from book where price > 100000;
delete from customer where name like '��%';
delete from customer where address like '%����%';


--select��
select * from book order by bookid;
select * from customer;
select * from orders;


-- join
select orders.orderid as �ֹ���ȣ, customer.name as �ֹ��ڸ�, book.bookname as å�̸�, book.price as å����, orderdate 
from orders join book on orders.bookid=book.bookid join customer on orders.custid=customer.custid order by �ֹ���ȣ;

-- group by
-- ���ǻ纰 ���� �� ��
select sum(price), publisher from book group by publisher;

-- having
-- ���� �� ���� 3���� �Ѵ� ���ǻ�鸸 ǥ��
select  publisher from book group by publisher having sum(price)>30000;

-- view
-- ���� ����� å ����
create view maxBookPrice as select max(price) maxPrice from book;


-- ��ø ����
-- ���� ��� å ã��
select * from book where price = (select * from maxBookPrice);






















