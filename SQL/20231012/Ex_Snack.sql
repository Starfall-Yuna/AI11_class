-- SNACK 테이블 생성         -> CREATE TABLE 사용
-- => 과자 이름, 선호도, 가격, 열량
CREATE TABLE SNACK(
    NAME VARCHAR(20),
    LOVING INT,
    PRICE INT,
    CALOLIE FLOAT
);

-- 5-10개의 데이터 SNACK 테이블에 삽입     -> INSERT 사용
INSERT INTO SNACK VALUES('새우깡', 3, 1800, 550);
INSERT INTO SNACK VALUES('쫄병스낵', 4, 1000, 250);
INSERT INTO SNACK VALUES('에이스', 1, 2500, 400);
INSERT INTO SNACK VALUES('오예스', 5, 5000, 1000);
INSERT INTO SNACK VALUES('포카칩', 4, 1500, 400);
INSERT INTO SNACK VALUES('오감자', 3, 1800, 560);
INSERT INTO SNACK VALUES('콘치', 5, 1500, 360);

-- 모든 SNACK 데이터 검색하여 출력
SELECT * FROM SNACK;

-- SNACK 테이블의 데이터 개수 출력 (COUNT 함수 응용)
SELECT COUNT(*) FROM SNACK;

-- DELETE :: 데이터 삭제하는 명령문
-- DELETE FROM 테이블명 [WHERE 조건문];
-- [WHERE 조건문] 부분이 없으면, 테이블에 있는 모든 데이터 없어짐

-- 아래에 속하는 데이터들 삭제한 뒤, 남아있는 데이터 출력
-- 가격이 2000원 이상인 과자 데이터 제거
DELETE FROM SNACK WHERE PRICE>=2000;
-- 선호도가 1 이하인 과자 데이터 제거
DELETE FROM SNACK WHERE LOVING<=1;
-- 열량이 500 이상인 과자 데이터 제거
DELETE FROM SNACK WHERE CALOLIE>=500;

SELECT * FROM SNACK;

-- DELETE FROM SNACK;   => SNACK에 남아있는 모든 데이터 삭제
    
-- SNACK 테이블 삭제 (테이블 모두 삭제)
-- DROP TABLE SNACK;

COMMIT;