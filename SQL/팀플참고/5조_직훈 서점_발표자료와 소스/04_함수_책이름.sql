-- �Լ�
-- bookid �̿��ؼ� å �̸� ã��
create or replace function get_bookName(p_bookid number) 
return varchar2 
is 
v_bname varchar2(40);
begin
select bookname into v_bname from book where bookid=p_bookid;
return v_bname;
end;

--https://gent.tistory.com/270 ��ó




