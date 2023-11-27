import csv #csv에 연관된 걸 읽어옴
import pymysql

#f라는 변수에 파일 정보를 넣는다.
f = open('data.csv', 'r', encoding='utf-8')
rdr = csv.reader(f) #rdr이라는 변수에 파일에 있는
#내용들을 넣는다.
#count = 0
isStart = True
mydata=[]
for line in rdr:
    #if count==0: #처음 한 줄은 안 읽으려고 함
    if isStart:
        isStart=False
        pass
    else:
        mydata.append(line)
    #count+=1
for item in mydata:
    print(item)
f.close() #파일 닫아줌

# %라는 걸 써서 %d,%s,%d에 해당하는 값 삽입
sql = 'insert into mybook values(%d, "%s", %d)'

for item in mydata:
    conn = pymysql.connect(
        host='localhost',
        user='root',
        password='1234',
        db='myproject',
        charset='utf8')
    #with : java로 치면 try catch finally에서
    #close해주는 걸 자동으로 해준다고 보면 됨
    with conn: #db 연결 하고 끊는 걸 자동으로 함
        with conn.cursor() as cur: #conn의 cursor를 cur로 변경(db 안의 커서)
            cur.execute(
                sql % (int(item[0]), item[1],
                       (int)(item[6].strip().
                             replace(",","")))
            )
            conn.commit()
# strip() : 양옆 공백 제거
            # replace : 특정 문자를 대체함. 여기선 콤마를 제거함