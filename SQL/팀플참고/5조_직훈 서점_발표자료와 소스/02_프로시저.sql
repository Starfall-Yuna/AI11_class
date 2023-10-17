-- 프로시저
--in : 매개변수를 의미
--책 추가 하는 것
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


