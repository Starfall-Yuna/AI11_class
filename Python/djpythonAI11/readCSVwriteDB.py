import csv #csv 파일 읽는 라이브러리 호출
import pymysql

#f = 파일을 처리하는 변수
#open 함수를 통해 읽어들인 파일에 대한 내용을 저장
f = open('mydata.csv','r')

rdr = csv.reader(f) #파일 데이터를 읽음

mydatas = [] #리스트 선언

isStart = True

for line in rdr: #rdr에 있는 걸 한 줄씩 읽을 것
    if isStart:
        isStart=False
        #pass
    else:
        mydatas.append(line)
f.close()

sql = 'insert into apitable(name, hp, menu, countofnum) '
sql = sql + "values('%s', '%s', '%s', %d)"

for item in mydatas:
    conn = pymysql.connect(
        host='localhost',
        user='root',
        password='1234',
        db='apidb',
        charset='utf8'
    )
    #with : db 연결 후에 다 되면 자동으로 연결 끊어줌
    with conn:
        with conn.cursor() as cur:#DB 안에 실제 명령 수행하는 것
            cur.execute(sql % (item[1],item[3],item[4],int(item[5])))
            conn.commit()

