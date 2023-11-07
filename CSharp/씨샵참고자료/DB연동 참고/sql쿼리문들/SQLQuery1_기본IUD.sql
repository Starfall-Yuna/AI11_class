/****** SSMS의 SelectTopNRows 명령 스크립트 ******/

--Insert Into TB_CUST(cust_id, birth_dt) values (111,22);  

select * from TB_CUST


--update TB_CUST set birth_dt = 'lee' where cust_ID = 11

--update TB_CUST set birth_dt = '22' where cust_ID = 11

delete from TB_CUST where cust_id = '1'

/*
begin tran

delete from TB_CUST where cust_id = 1

SELECT TOP (1000) [CUST_ID]
      ,[BIRTH_DT]
  FROM [MYDB1].[dbo].[TB_CUST]

rollback tran

/*저장하려면 */
commit tran 입력해야 함
*/

select * from [MYDB1].[dbo].[TB_CUST]

