-- ���ν���
--in : �Ű������� �ǹ�
--å �߰� �ϴ� ��
create or replace procedure add_book
(
mybookid in number, 
mybookname in  varchar2, 
mypublisher  in varchar2,
myprice in  number
)
is begin 
insert into book values(mybookid,mybookname,mypublisher,myprice);
end add_book;


