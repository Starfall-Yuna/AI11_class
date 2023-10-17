/*
1. 부서 테이블 생성
- 코드 char(3)
- 부서명 varchar2(100)
2. 직급 테이블 생성
- 코드 int
- 직급명 varchar2(100)
3. 인사 테이블을 만든다.
- 사번 char(5)
- 부서코드
- 직급코드
- 이름 varchar2(100)
- 나이 int
- 성별 char(1)
- HP varchar2(15) unique
*/

create table buseo (code char(3) primary key, name varchar2(100));

create table jikgeup(code int primary key, name varchar2(100));

create table insa(
sabeon char(5),
buseo_code char(3) references buseo(code),
jikgeup_code int references jikgeup(code),
name varchar2(100),
age int,
gender char(1),
hp varchar2(15) unique);

-- 4. 부서 3개, 직급 3개, 사람 10명을 만든다. 
insert into buseo values('A01', '교무1팀');
insert into buseo values('B01', '교무2팀');
insert into buseo values('CCC', '경영지원');

CREATE SEQUENCE jikseq START WITH 1 INCREMENT BY 1;

insert into jikgeup values(jikseq.nextval, '사원');
insert into jikgeup values(jikseq.nextval, '대리');
insert into jikgeup values(jikseq.nextval, '과장');


insert into insa values('00001', 'A01', 1, '이동준', 35, 'M', '010-2940-1613');
insert into insa values('00002', 'B01', 2, '이유나', 25, 'F',NULL);
insert into insa values('00003', 'CCC', 3, '김형준', 45, 'M', '010-2940-1111');
insert into insa values('00004', 'CCC', 2, '박준현', 40, 'M', '010-2940-2222');
insert into insa values('00005', 'B01', 2, '정제원', 29, 'M', '010-2940-3333');
insert into insa values('00006', 'B01', 2, '곽봉구', 55, 'M', '010-2940-4444');
insert into insa values('00007', 'CCC', 3, '방채문', 60, 'M', '010-5555-1613');
insert into insa values('00008', 'A01', 3, '최광욱', 38, 'M', '010-1234-1613');
insert into insa values('00009', 'A01', 3, '표주광', 37, 'M', '010-7777-1613');
insert into insa values('0000A', 'A01', 1, '정효미', 27, 'F', '010-8888-1613');


SELECT * FROM BUSEO;
SELECT * FROM JIKGEUP;
SELECT * FROM INSA;

-- 5. 성이 이씨인 사람을 찾는 쿼리를 작성
-- %의 의미 : 최소 0글자 이상
-- '이%' = 이, 이동준, 이이, 이유나 등등... 다 됨
SELECT * FROM INSA WHERE NAME LIKE '이%';
-- 맨 뒷 글자가 준
SELECT * FROM INSA WHERE NAME LIKE '%준';
-- 준이 포함되면 다 OK
SELECT * FROM INSA WHERE NAME LIKE '%준%';

--6. 가장 많은 나이는 몇 살인지 출력
SELECT MAX(AGE) FROM INSA;
SELECT MAX(AGE) 최고령 FROM INSA;

--7. 가장 나이가 어린 사람을 찾기
-- AGE값이 MIN(AGE)랑 동일한 사람을 찾아야 한다.
-- 이런식의 작성을 중첩 질의라고 한다.
SELECT * FROM INSA WHERE AGE = (SELECT MIN(AGE) FROM INSA);

--8. 가장 나이가 많은 부서 찾기(평균 나이 기준)
-- 부서별 평균 나이를 구해야 한다.
SELECT BUSEO_CODE, AVG(AGE) FROM INSA GROUP BY BUSEO_CODE;
SELECT BUSEO_CODE, ROUND(AVG(AGE),1) FROM INSA GROUP BY BUSEO_CODE;

-- 뷰로 만들 때 중요한 것 ROUND, AVG 등을 이용해서 VIEW 만들 때는
-- 이 부분에 대한 임시 이름을 붙여 줘야 함!

--ORA-00998: 이 식은 열의 별명과 함께 지정해야 합니다
--00998. 00000 -  "must name this expression with a column alias"
--CREATE VIEW AVG_BUSEO AS SELECT BUSEO_CODE, ROUND(AVG(AGE),1) FROM INSA GROUP BY BUSEO_CODE;
CREATE VIEW AVG_BUSEO AS SELECT BUSEO_CODE, ROUND(AVG(AGE),1) RVA FROM INSA 
GROUP BY BUSEO_CODE;
--뷰의 결과
SELECT * FROM AVG_BUSEO;
--SQL 오류: ORA-01733: 가상 열은 사용할 수 없습니다
--01733. 00000 -  "virtual column not allowed here"
--뷰는 INSERT, UPDATE, DELETE가 안 된다.
-- 복잡한 컬럼의 경우 안 된다고 표현했는 데, 복잡한 컬럼이라기보다는 '없는 컬럼'에 대해서는 추가 수정 삭제 안 됨
-- INSERT INTO AVG_BUSEO VALUES('AAA',33.3);


-- 그 중에서 MAX인 값을 구해야 한다.
SELECT * FROM AVG_BUSEO WHERE RVA=(SELECT MAX(RVA) FROM AVG_BUSEO);

-- 부서별 평균 나이가 MAX랑 일치하는 부서를 찾아야 한다.
SELECT NAME, BUSEO_CODE, RVA FROM AVG_BUSEO
JOIN BUSEO ON AVG_BUSEO.BUSEO_CODE=BUSEO.CODE
WHERE RVA=(SELECT MAX(RVA) FROM AVG_BUSEO);

--VIEW는 원본의 영향을 받는다.
insert into insa values('0000B', 'A01', 1, '곽태원', 127, 'M', '010-1888-1613');


--9. 성별별 평균 나이 출력하기
SELECT GENDER, AVG(AGE) FROM INSA GROUP BY GENDER; 


-- 10. 인사 테이블을 출력하되, 부서코드와 직급코드들도 부서명과 직급명으로 출력하기
-- 즉 3개의 테이블을 서로 조인해야 함
-- IF문의 AND를 생각하면 편할 것 같다. 조건을 좁혀가는 것

--1. JOIN을 이용하는 방법
SELECT SABEON, INSA.NAME, BUSEO.NAME, JIKGEUP.NAME FROM INSA JOIN BUSEO ON 
INSA.BUSEO_CODE=BUSEO.CODE JOIN JIKGEUP ON INSA.JIKGEUP_CODE=JIKGEUP.CODE;

--2. WHERE을 이용하는 방법
SELECT SABEON 사번, INSA.NAME 이름, BUSEO.NAME 부서, JIKGEUP.NAME 직급, AGE 나이
FROM INSA,BUSEO,JIKGEUP
WHERE INSA.BUSEO_CODE = BUSEO.CODE AND INSA.JIKGEUP_CODE = JIKGEUP.CODE;

-- 나이 순 정렬
SELECT SABEON 사번, INSA.NAME 이름, BUSEO.NAME 부서, JIKGEUP.NAME 직급, AGE 나이
FROM INSA,BUSEO,JIKGEUP
WHERE INSA.BUSEO_CODE = BUSEO.CODE AND INSA.JIKGEUP_CODE = JIKGEUP.CODE
ORDER BY 나이 /*DESC*/; --연장자를 맨 위에 놓고 싶다면 끝에 DESC 추가하면 됨

-- 부서랑 나이별로 묶은 뒤 40세 이상만 표시
 SELECT BUSEO_CODE, ROUND(AVG(AGE),1) RVA FROM INSA 
GROUP BY BUSEO_CODE HAVING ROUND(AVG(AGE),1) >=40;



