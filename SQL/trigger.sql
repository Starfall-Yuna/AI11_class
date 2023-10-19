-- THINGS 테이블 생성 :: 품목명, 가격, 재고 (품목명을 기본키로)
CREATE TABLE THINGS(
    NAME VARCHAR2(20) PRIMARY KEY,
    PRICE INT,
    CNT INT
);
SELECT * FROM THINGS;

-- 데이터 7개 생성
INSERT INTO THINGS VALUES ('물컵', 3000, 5);
INSERT INTO THINGS VALUES ('볼펜', 1000, 50);
INSERT INTO THINGS VALUES ('편지지', 1500, 20);
INSERT INTO THINGS VALUES ('과자', 2000, 20);
INSERT INTO THINGS VALUES ('음료수', 1500, 30);
INSERT INTO THINGS VALUES ('공책', 2500, 10);
INSERT INTO THINGS VALUES ('접시', 5000, 25);

EXEC DELETE_ALL();

DELETE FROM THINGS;

-- 프로시저 구현 :: 스크립트 출력 상에 "*** 모든 데이터가 사라집니다 ***" 출력하면서
--      테이블 상 모든 데이터 지우는 프로시저 정의
/
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE DELETE_ALL
IS BEGIN
    -- 프로시저 본문
    -- 스크립트 출력에 사용되는 PL문 :: DBMS_OUTPUT.PUT_LINE('출력문');
    
    DBMS_OUTPUT.PUT_LINE('*** 모든 데이터가 사라집니다 ***');
    DELETE FROM THINGS;
END DELETE_ALL;
/

-- 프로시저 :: 구현을 해두고, 호출을 별도로 해야했음
-- 트리거 :: "방아쇠", 특정 명령문을 수행했을 때 "자동으로 호출"됨
--          구현하는 문법은 있지만, 호출하는 문법은 별도로 없음
-- 트리거 선언
-- CREATE OR REPLACE TRIGGER 트리거명
-- [BEFORE/AFTER] [트리거 적용할 명령문]    -- (ex)BEFORE INSERT
-- ON 테이블명
-- (FOR EACH ROW)  -- 작성해두면, 트리거 적용한 명령문 실행할 때마다 수행
--            -- 작성을 안 하면, 딱 한번 실행하고 그 이후론 실행 안됨
-- DECLARE     -- "선언하다"
--    -- 변수 선언하는 부분
-- BEGIN 
--    -- 트리거 본문 작성하는 부분
-- END;

-- INSERT문 수행 시, "*** 데이터를 추가합니다. ***" 출력
CREATE OR REPLACE TRIGGER ALARM_INSERT
AFTER INSERT ON THINGS       -- THINGS 테이블에 대하여, INSERT문 수행 전 호출
FOR EACH ROW
DECLARE BEGIN
    -- 트리거 본문
    DBMS_OUTPUT.PUT_LINE('*** 데이터를 추가합니다~ ***');
END;
/
-- DELETE문 수행했을 때, "*** 데이터를 하나 삭제합니다~ ***" 출력
CREATE OR REPLACE TRIGGER ALARM_DELETE
AFTER DELETE ON THINGS
FOR EACH ROW
DECLARE BEGIN
    DBMS_OUTPUT.PUT_LINE('*** 데이터를 하나 삭제합니다~ ***');
END;

-- 1. DDL(데이터구조 명령어)에 대한 트리거 작성해두고, 
--      BEGIN-END 사이에 DML(데이터 명령어) 명령어 통해 테스트 데이터 삽입
-- 2. DML(데이터 명령어)에 대한 트리거 작성해두고,
--      단순 출력문 수행



