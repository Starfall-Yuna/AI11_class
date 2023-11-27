import json
import pymysql

#자동으로 파일 객체 f를 닫아줌
with open('data2.json', encoding='utf-8') as f:
    json_object = json.load(f)

print(json_object)

json_arr = json_object['data']

#for item in json_arr:
#    print(item['가격'])
conn = pymysql.connect(host='localhost',
                       user='root',
                       password='1234',
                       db='projectdb',
                       charset='utf8')

sql = 'INSERT INTO book (bookid, bookname, publisher, price) VALUES (%d, "%s", "%s", %d)'
cur = conn.cursor()
for item in json_arr:
    cur.execute(sql % (int(item['연번'])+2306, item['서명'], item['발행자'], (int) ( item['가격'])))

conn.commit()
conn.close()



