-- 함수 활용
-- join 없이도 쉽게 표시할 수 있다.
select orderid, get_custName(custid), get_bookName(bookid) from orders;