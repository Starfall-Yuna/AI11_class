-- 뷰(VIEW)
-- 실제 테이블은 아니고 가상 테이블
-- 기본적인 삭제 수정 삽입은 안 되고(= 좀 복잡한 구조의 경우에는 안 되고 단순한 구조에는 된다)
-- 대신 원본이 바뀌면 VIEW의 값도 바뀜
-- VIEW = SELECT 결과물
-- SELECT문이 너무 복잡해지거나 혹은 좀 자주 쓰이는 SELECT문을 좀 더 편하게 불러오고자 쓰는 것
-- 기본 용도 자체가 데이터를 '보기 위함'

CREATE VIEW MYSTUDENT AS 
SELECT HAKBEON, KBSTUDENT.NAME NAME, KBMAJOR.NAME MAJ_NAME FROM KBSTUDENT 
JOIN KBMAJOR ON kbstudent.hakgwa_code=KBMAJOR.CODE;

SELECT * FROM MYSTUDENT; --MYSTUDENT는 실제 값이 아님. 
--KBSTUDENT, KBMAJOR로 만들어진 가상의 표(SELECT 결과물)
-- DELETE, UPDATE, INSERT가 단순한 구조의 VIEW에서는 되는 데, 복잡한 구조의 VIEW에서는 안 됨
DELETE FROM MYSTUDENT WHERE MAJ_NAME = '화공';
SELECT * FROM KBSTUDENT;

INSERT INTO KBSTUDENT VALUES(2,'유지웅','002');

-- VIEW를 통해서 SELECT문을 단순화하고, 보다 복잡한 형태의 JOIN등도 구현이 가능함

--------------------------------------------

-- 순서대로 출력하는 것
-- ~순으로 출력하는 것 : ORDER BY
-- ORDER : 순서
SELECT * FROM KBSTUDENT;
SELECT * FROM KBSTUDENT ORDER BY HAKBEON; --학번 순으로 출력(오름차순)
SELECT * FROM KBSTUDENT ORDER BY HAKBEON DESC; --학번 순으로 출력(내림차순)

-- 그룹 별로 출력하는 것(Group by, Having)
-- 예를 들어서 학생이 100명이 있다. 
-- 남학생 n명, 여학생 m명이 있을 때, 학생별로 평균 나이 등등을 구하는 것을 '그룹별로' 묶는다고 함

-- KBSTUDENT로 예를 들면 학과별로 몇 명있는 지 출력해볼 수 있다.
-- 만약 KBSTUDENT에 나이 정보가 있었다면 학과별로 평균 나이등도 구할 수 있을 것이다.
SELECT HAKGWA_CODE, COUNT(*) FROM KBSTUDENT GROUP BY HAKGWA_CODE;

-- VIEW를 이용하면 편하겠지?
-- COUNT(*) : 행의 수(Row 개수)
SELECT MAJ_NAME, COUNT(*) FROM MYSTUDENT GROUP BY MAJ_NAME;

--group by용 where절이 있는 데 바로 having절
-- group by에서만 사용가능한 where절

--ex. 학과별로 각각 몇 명있는 지 구하고, 그 중에서 1명을 넘는 과만 출력하라
SELECT MAJ_NAME, COUNT(*) FROM MYSTUDENT GROUP BY MAJ_NAME having count(*)>1;






















