-- 문장 끝마다 세미콜론(;) 작성
-- 대소문자 구분X

-- COMMIT :: 서버에 반영

--DQL문 :: Query, 데이터 조회
--=> SELECT문 :: 데이터 검색하는 명령문 (검색 결과는 아래로 출력됨)
--SELECT 속성이름 FROM 테이블명 [WHERE 조건];
SELECT LENGTH('이유나') FROM DUAL;
SELECT LENGTHB('이유나') FROM DUAL;        -- 한글은 3바이트 취급

SELECT LENGTH('Leeyuna') FROM DUAL;
SELECT LENGTHB('Leeyuna') FROM DUAL;
--DUAL :: 임시 테이블

SELECT LENGTHB('Hello') FROM DUAL WHERE LENGTH('Hello')>=5;



-- DDL문 및 DML문이 예제를 작성할 때에는 자주 섞이기 때문에, 설명과 코드는 구분해서 작성하겠습니다ㅠㅜ



--DDL문 :: Definition, 테이블 및 DB 등 데이터를 저장할 공간/객체를 생성/수정/삭제 수행
--            (데이터 구조에 대한 명령문)
--    =>  CREATE, ALTER, DROP, TRUNCATE

-- 1. CREATE :: 데이터 구조(테이블, DB) 생성
--CREATE TABLE 테이블명(
--    속성이름 속성타입,
--    ...
--    속성이름 속성타입
--);
-- NOT NULL :: "NULL로 설정되면 안되는" 칼럼에 적용
-- PRIMARY KEY :: "기본키", 데이터들끼리 구분하기 위한 칼럼에 적용

-- * 자료형 :: VARCHAR2(N)과 INT, FLOAT 주로 사용
-- "문자형"
-- CHAR(N) :: "고정"크기의 문자형 타입    => 무조건 N 크기 할당 (비효율적)
-- VARCHAR(N) :: "가변"크기의 문자형 타입     => 최대 N 크기 할당 가능, 필요한만큼만 할당 
--      => 한글 하나가 3개의 공간을 차지하는 타입
-- NVARCHAR(N) :: "가변"크기의 문자형 타입
--      => 한글 하나가 1개의 공간을 차지하는 타입
-- "숫자형"
-- INT :: 정수 숫자형
-- FLOAT :: 실수 숫자형
-- NUMBER(P,S) :: 정수와 실수를 같이 표현할 수 있는 타입
--        p :: 정수 부분+실수 부분 합하여 표현할 수 있는 최대 크기
--        S :: 실수 부분을 표현할 수 있는 최대 크기
--    (EX) NUMBER(4, 1) -> 1111(o), 123.4(o), 12.45(X)
-- 그 외, "날짜형" "LOB형" 존재...  => 개인에게 맡깁니담

--2. DROP, TRUNCATE
--DROP :: 테이블을 삭제하는 명령어 (테이블, 데이터 모두 삭제)
--    DROP TABLE [IF EXISTS] 테이블명;
--      IF EXISTS 사용하여, 중복 삭제로 인한 오류 방지 가능
--TRUNCATE :: 테이블을 삭제하는 명령어 (데이터만 전체 삭제)
--    TRUNCATE TABLE 테이블명;

-- 3. ALTER
--      => ADD, DROP COLUMN, MODIFY, RENAME, RENAME COLUMN
--      내일 더 자세히 다뤄볼 예정...


--DML문 :: Manipulation, 데이터 저장/수정/삭제 수행
--            (데이터에 대한 명령문)
--    => INSERT, UPDATE, DELETE (+SELECT)

-- 1. INSERT :: 데이터 삽입하는 명령어
--      INSERT INTO 테이블명(속성값1, 속성값2, ...) VALUES (데이터값1, 데이터값2, ...);
--          데이터값1은 속성값1로, 데이터값2는 속성값2로, ...
--      INSERT INTO 테이블명 VALUES (1ST칼럼 데이터값, 2ND칼럼 데이터값, ...);

-- 2. DELETE :: 데이터 삭제하는 명령어
--        DELETE FROM 테이블명 [WHERE 조건문];  
--        [WHERE 조건문] 부분이 없으면, 테이블에 있는 모든 데이터 없어짐


CREATE TABLE STUDENT(
    HAK_BUN VARCHAR(10) PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    AGE INT NOT NULL,
    SCORE FLOAT
);

INSERT INTO STUDENT VALUES('1813', '이유나', 25, 3.5);

SELECT * FROM STUDENT;              -- 전체 칼럼에 대해 데이터 출력
SELECT HAK_BUN, NAME FROM STUDENT;      -- 학번, 이름에 대한 데이터만 출력

TRUNCATE TABLE STUDENT;
DROP TABLE STUDENT;

COMMIT;