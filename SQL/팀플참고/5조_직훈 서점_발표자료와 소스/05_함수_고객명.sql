-- �Լ�
-- custid �̿��ؼ� ���� ã��
create or replace function get_custName(p_custid number) 
return varchar2 
is 
v_cname varchar2(40);
begin
select name into v_cname from customer where custid=p_custid;
return v_cname;
end;

--https://gent.tistory.com/270 ��ó




