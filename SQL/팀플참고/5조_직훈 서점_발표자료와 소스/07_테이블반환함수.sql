-- 함수 테이블 반환
-- 출판사 조회해서 반환하기
 -- 1. Object Type을 생성
CREATE OR REPLACE TYPE find_bookname_from_publisher AS OBJECT 
( 
    bookid NUMBER, 
    bookname varchar2(40), 
    --publisher varchar2(40),
    price NUMBER(13) 
); 
/
-- 2. 반환 테이블 정의
CREATE OR REPLACE TYPE table_find_bookname_from_publisher  
AS TABLE OF find_bookname_from_publisher; 
/
-- 3. 파이프라인 테이블 함수 생성
CREATE OR REPLACE FUNCTION fn_get_book_name (p_publisher varchar2) 
    RETURN table_find_bookname_from_publisher 
    PIPELINED 
IS 
    v_book find_bookname_from_publisher; 
BEGIN 
    FOR rec IN ( 
        SELECT bookid 
             , bookname 
             , price 
          FROM BOOK 
         WHERE publisher = p_publisher 
    ) LOOP 
        v_book := find_bookname_from_publisher(rec.bookid, rec.bookname, rec.price);         
        PIPE ROW(v_book); 
    END LOOP; 
       
    RETURN; 
END;