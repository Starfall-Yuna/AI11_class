-- PK(Primary Key) :: 기본키, 각 데이터들끼리 구별하는 데에 사용되는 칼럼
--  => 모든 행이 서로 다른 값을 가짐 / null 가질 수 없음
--  1) 기본키 설정하려는 칼럼 옆에 "primary key" 작성
CREATE TABLE STUDENT1(
    HAK_BUN VARCHAR2(10) PRIMARY KEY,
    NAME VARCHAR2(20)
);
--  2) CREATE TABLE 맨 끝에, CONSTRAINT 통해 제약조건 설정
--  CONSTRAINT 제약조건명 PRIMARY KEY(칼럼명)
CREATE TABLE STUDENT2(
    HAK_BUN VARCHAR2(10),
    NAME VARCHAR2(20),
    CONSTRAINT PK_NUM PRIMARY KEY(HAK_BUN)
);


-- FK(Foreign Key) :: 외래키, 다른 테이블과 관계 형성하여 연결하는 데에 사용
-- 참조되는 키는 반드시 고유키/기본키여야 함
--  1) CREATE TABLE 맨 끝에, CONSTRAINT 통해 제약조건 설정
--      - 칼럼명 옆에, "FOREIGN KEY (외래키로 쓸 칼럼명) REFERENCES 참조할_테이블명(참조할 키)" 추가
--      - 테이블 생성문 맨 끝에, "CONSTRAINT 제약조건명 FOREIGN KEY(외래키로 쓸 칼럼명) REFERENCES 참조할_테이블명(참조할 키)"
--  2) ALTER TABLE의 ADD CONSTRAINT 추가
--      ALTER TABLE 테이블명 ADD CONSTRAINT
--      제약조건명 FOREIGN KEY(외래키로 쓸 칼럼명)
--      REFERENCES 참조할_테이블명(참조할 키);


-- JOIN :: 2개 이상의 테이블을 공통된 열로 묶음
--  (1) JOIN-ON을 통한 JOIN
--SELECT 칼럼명들
--FROM 테이블명(A)
--JOIN 조인할_테이블명(B) ON A.칼럼명=B.칼럼명;
--                          각 칼럼에 대한 데이터 동일해야함
--  (2)JOIN-WHERE을 통한 JOIN
--SELECT 칼럼명들
--FROM 테이블명(A), 테이블명(B)
--WHERE A.칼럼명=B.칼럼명;

-- LEFT JOIN :: 왼쪽 테이블의 모든 행 포함
--      오른쪽 테이블에선 일치하는 행 있는 경우만 포함
-- SELECT 칼럼명들
-- FROM 테이블1 LEFT JOIN 테이블2
-- ON 테이블1.칼럼명=테이블2.칼럼명;

-- RIGHT JOIN :: 오른쪽 테이블이 모든 행 포함
--      왼쪽 테이블에선 일치하는 행 있는 경우만 포함
-- SELECT 칼럼명들
-- FROM 테이블1 RIGHT JOIN 테이블2
-- ON 테이블1.칼럼명=테이블2.칼럼명;


-- ORDER BY :: 특정 칼럼 기준으로 데이터 정렬할 때 사용
--  SELECT 칼럼명 FROM 테이블명 ORDER BY [칼럼명 정렬방법(ASC/DESC)], ...;
--          칼럼명에는 칼럼 순번을 넣어도 된다.
--  (디폴트 정렬방법은 ASC, 내림차순은 DESC 별도 설정해야함)
--  (ORACLE에선 NULL을 가장 큰 값으로 간주)

-- GROUP BY :: 같은 값 가진 행끼리 하나의 그룹으로 묶을 때 사용, 집계 함수와 보통 같이 사용
-- 집계 함수 :: COUNT(), AVG(), MIN(), MAX(), SUM()
-- SELECT 집계함수 사용 FROM 테이블명 GROUP BY 칼럼명 HAVING 조건절;
SELECT STUDENT.MAJOR "학과", COUNT(*) "총 인원" FROM STUDENT GROUP BY MAJOR;
SELECT STUDENT.MAJOR "학과", COUNT(*) "총 인원", COUNT(*) "전체 인원" FROM STUDENT GROUP BY MAJOR
    HAVING COUNT(*)>=1;


-- 프로시저 :: DB에서 실행할 수 있는 코드 블럭
--      프로그래밍 논리 수행 가능, 함수랑 유사
--  [ 프로시저 생성 ]
--CREATE OR REPLACE PROCEDURE 프로시저명 
--IS
--    변수 선언
--BEGIN
--    프로시저 본문(SQL 문장, 제어문, 변수 사용, 예외처리 등)
--END 프로시저명;
-- (OR REPLACE 사용하여, 같은 이름의 프로시저 함께 사용 가능)

-- 프로시저 호출
-- EXEC 프로시저명(매개변수, ...);
EXEC ADD_STU('이상하', '1111', '통신');

SELECT * FROM STUDENT;

COMMIT;

/
-- 데이터 삽입 프로시저
CREATE OR REPLACE PROCEDURE ADD_STU
(
    STU_NAME IN VARCHAR2,       -- IN :: 입력
    STU_NUM IN VARCHAR2,
    STU_MAJOR IN VARCHAR2
)
IS BEGIN
    INSERT INTO STUDENT VALUES(STU_NAME, STU_NUM, STU_MAJOR);
END ADD_STU;