-- 문장 끝마다 세미콜론(;) 넣기
-- 대소문자 구분 없음

-- CRUD ::  CREATE / READ / UPDATE / DELETE => 생성/읽기/갱신/삭제
-- SQL문 :: 위의 CRUD 기능을 수행하기 위한 명령문(질의문)
--      => <<DQL / DDL / DML>> / DCL / TCL

-- DQL(Query) :: 데이터 조회
--   SELECT문 :: 데이터를 검색하는 명령어 (검색된 결과는 출력하여 표현)
--   SELECT 칼럼명 FROM 테이블명 [WHERE 조건문];
SELECT LENGTH('HelloSQL') FROM DUAL WHERE LENGTH('HelloSQL')>=5;


-- DDL(Defination) :: 데이터 구조(DB, 테이블, ...) 정의
--      => CREATE(생성), ALTER(수정), DROP, TRUNCATE(삭제)
-- DML(Manipulation) :: 데이터 조작
--      => INSERT(삽입), UPDATE(수정), DELETE(삭제)   (+SELECT)

-- ORACLE 자료형 :: VARCHAR2(N)
-- * 문자형
--  CHAR(N) :: 고정크기의 문자형 타입, 무조건 N개의 공간 할당 (비효율적)
--  VARCHAR2(N) :: 가변크기의 문자형 타입, "최대 N개까지"의 공간 할당O
--  NVARCHAR2(N)
-- * 숫자형
--  INT :: 정수 숫자형
--  FLOAT :: 실수 숫자형
--  NUMBER(P,S) :: 정수/실수 모두 가능
--      P(정수부분+실수부분 최대 작성가능한 공간) / S(실수부분 최대 작성가능한 공간)

-- * :: "전체"


-- 블로그 "글"에 대한 테이블 생성 (CREATE 사용)
CREATE TABLE POST(
    TITLE VARCHAR2(30),       -- 글 제목
    DAY VARCHAR2(10),         -- 글 작성날짜
    BODY VARCHAR2(100)        -- 글 본문
);

-- POST 테이블에 대하여, 데이터 삽입
INSERT INTO POST VALUES('Hello', '20231013', 'Helloooooo');
INSERT INTO POST(DAY, TITLE, BODY) VALUES('20221010', 'BBBB', 'Byeeeeee');
INSERT INTO POST VALUES('LUNCH', '20230808', 'FAVORITE');
INSERT INTO POST VALUES('NEW', '20221111', 'NEW POST');
INSERT INTO POST VALUES('SLEEPY...', '20231013', 'COFFEE...');

-- POST 테이블에 있어, DAY의 값이 '20231013'인 데이터를 제거
DELETE FROM POST WHERE DAY='20231013';
-- DELETE FROM POST;       -- TRUNCATE랑 똑같이, 데이터가 모두 제거

-- POST 테이블에 대해 전체 검색하여 출력
SELECT * FROM POST;

-- DROP :: 테이블 삭제 (데이터, 테이블 구조 모두 삭제)
-- TRUNCATE :: 테이블 삭제 (데이터만 전체 삭제, 테이블 구조 남아있음)
DROP TABLE POST;





