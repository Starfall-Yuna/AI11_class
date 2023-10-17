-- TEACHER 테이블 생성 :: 이름(기본키), 소속, 경력, 담당
CREATE TABLE TEACHER(
    NAME VARCHAR2(20) PRIMARY KEY,
    COMPANY VARCHAR2(20),
    YEAR INT,
    SECTION VARCHAR2(20)
);

-- STUDENT 테이블 생성 :: 학번(기본키), 이름, 나이, 담당교사
CREATE TABLE STUDENT(
    HAK_BUN VARCHAR2(10),
    NAME VARCHAR2(20), 
    AGE INT,
    PROF VARCHAR2(20),
    CONSTRAINT PK_HAKBUN PRIMARY KEY(HAK_BUN)
);

-- (STUDENT.담당교사->TEACHER.이름 참조하도록 설정)
ALTER TABLE STUDENT ADD CONSTRAINT
    FK_PROF FOREIGN KEY(PROF) REFERENCES TEACHER(NAME);

-- TEACHER에 대한 데이터를 먼저 삽입하고
EXEC ADD_SUNSANG('이동준', 'KB', 3, '개발');
EXEC ADD_SUNSANG('이유나', 'KB', 1, '개발');
EXEC ADD_SUNSANG('박준현', 'KB', 5, '보안');
EXEC ADD_SUNSANG('정제원', 'KB', 1, '보안');

-- 그 다음에, STUDENT 데이터를 삽입 (외래키 제약조건 때문)
-- (프로시저 사용해서 데이터 추가)
-- STUDENT 테이블에 10개 데이터 임의로 추가
EXEC ADD_HAKSANG('1111', '유지웅', 18, '이유나');
EXEC ADD_HAKSANG('2222', '이경민', 18, '이동준');
EXEC ADD_HAKSANG('3333', '신예원', 25, '박준현');
EXEC ADD_HAKSANG('4444', '최효정', 25, '정제원');
EXEC ADD_HAKSANG('5555', '장광수', 33, '이유나');
EXEC ADD_HAKSANG('6666', '이현오', 33, '이동준');
EXEC ADD_HAKSANG('7777', '정인혁', 33, '박준현');
EXEC ADD_HAKSANG('8888', '권병진', 33, '정제원');
EXEC ADD_HAKSANG('9999', '이종권', 35, '이유나');
EXEC ADD_HAKSANG('0000', '이상하', 36, '이동준');

-- STUDENT, TEACHER 각각의 테이블로 출력
SELECT * FROM STUDENT;
SELECT * FROM TEACHER;
-- STUDENT, TEACHER 하나의 테이블로 출력 -> JOIN 활용
--SELECT S.HAK_BUN "학번", S.NAME "이름", S.AGE "나이", S.PROF "담당교사",
--    T.COMPANY "교사 소속", T.YEAR "교사 경력", T.SECTION "분야"
--FROM STUDENT S JOIN TEACHER T
--ON S.PROF=T.NAME;
SELECT S.HAK_BUN "학번", S.NAME "이름", S.AGE "나이", S.PROF "담당교사",
    T.COMPANY "교사 소속", T.YEAR "교사 경력", T.SECTION "분야"
FROM STUDENT S, TEACHER T
WHERE S.PROF=T.NAME;

-- STUDENT, TEACHER 하나의 테이블로 출력
--      (1ST)STUDENT.나이 오름차순, (2ND)TEACHER.경력 내림차순 정렬
SELECT S.HAK_BUN "학번", S.NAME "이름", S.AGE "나이", S.PROF "담당교사",
    T.COMPANY "교사 소속", T.YEAR "교사 경력", T.SECTION "분야"
FROM STUDENT S JOIN TEACHER T
ON S.PROF=T.NAME
ORDER BY S.AGE, T.YEAR DESC;

-- 학생 중 나이가 20 미만인 학생 데이터 제거
EXEC DEL_HAKSANG(20);
-- 교사들의 경력을 1씩 추가해서 수정하기
EXEC UP_YEAR();

-- 학생들 총 인원, 나이의 총합, 최대값, 최소값, 평균값을 모두 하나의 테이블로 출력
SELECT COUNT(*) "총 인원", SUM(AGE) "나이(총합)", MAX(AGE) "나이(최대)",
    MIN(AGE) "나이(최소)", AVG(AGE) "나이(평균)"
FROM STUDENT;
-- 교사의 소속 및 담당 출력 (이때 중복되는 값은 한번만 출력되게끔 한다.)
SELECT DISTINCT COMPANY, SECTION
FROM TEACHER;
-- 교사의 소속 및 평균 경력 출력
SELECT COMPANY, AVG(YEAR)
FROM TEACHER
GROUP BY COMPANY;

-- 1. 프로시저 구현 :: STUDENT에 대한 데이터 삽입
/
CREATE OR REPLACE PROCEDURE ADD_HAKSANG
(
    IN_HAKBUN IN VARCHAR2,
    IN_NAME IN VARCHAR2,
    IN_AGE IN INT, 
    IN_PROF IN VARCHAR2
)
IS BEGIN
    -- 데이터 추가하는 구문 작성
    INSERT INTO STUDENT VALUES(IN_HAKBUN, IN_NAME, IN_AGE, IN_PROF);
END ADD_HAKSANG;
/

-- 2. 프로시저 구현 :: TEACHER에 대한 데이터 삽입
CREATE OR REPLACE PROCEDURE ADD_SUNSANG
(
    IN_NAME IN VARCHAR2,
    IN_COMPANY IN VARCHAR2,
    IN_YEAR IN INT,
    IN_SECTION IN VARCHAR2
)
IS BEGIN
    INSERT INTO TEACHER VALUES(IN_NAME, IN_COMPANY, IN_YEAR, IN_SECTION);
END ADD_SUNSANG;

/
-- 3. 프로시저 구현 :: STUDENT에 대한 특정 데이터 제거 (문제에선, 나이에 대해 조건 걸음)
CREATE OR REPLACE PROCEDURE DEL_HAKSANG
(
    IN_AGE IN INT
)
IS BEGIN
    DELETE FROM STUDENT WHERE AGE<IN_AGE;
END DEL_HAKSANG;

/
-- 4. 프로시저 구현 :: TEACHER에 대한 데이터 수정 (경력값 1씩 추가)
CREATE OR REPLACE PROCEDURE UP_YEAR
IS BEGIN
    -- 모든 TEACHER 데이터에 대해, 경력(YEAR) 1 더해짐
    UPDATE TEACHER SET YEAR=YEAR+1;
END UP_YEAR;



