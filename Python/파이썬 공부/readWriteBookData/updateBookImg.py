import pymysql
import json
import urllib.request
import time
conn = pymysql.connect(host='localhost',
                       user='kb_bookstore_admin',
                       password='kbadmin',
                       db='kb_book_store',
                       charset='utf8')

cur = conn.cursor()
sql = "SELECT * FROM book"

cur.execute(sql)
result = cur.fetchall()

client_id = "R9RvEToCf5NQ0BY1B4mf"
client_secret = "aFVVBFV1J0"

for item in result:
    isbn = item[1]
    encText = urllib.parse.quote(isbn)
    url = 'https://openapi.naver.com/v1/search/book_adv.json?d_isbn=' + encText
    request = urllib.request.Request(url)
    request.add_header("X-Naver-Client-Id", client_id)
    request.add_header("X-Naver-Client-Secret", client_secret)
    response = urllib.request.urlopen(request)
    rescode = response.getcode()
    if(rescode==200):
        response_body=json.load(response)
        try:
            cur.execute("update book set bookImg='{}' where bookisbn='{}'".
                        format(response_body['items'][0]['image'],isbn))
            print("update book set bookImg='{}' where bookisbn='{}'".
                        format(response_body['items'][0]['image'],isbn))
            conn.commit()
            time.sleep(0.2)
            #print(response_body['items'][0]['image'])
        except:
            pass
        #response_body = response.read()
        #print(response_body.decode('utf-8'))
    else:
        print("Error Code:" + rescode)

