import json
import pymysql
import urllib.request
url = 'https://api.odcloud.kr/api/15060954/v1/uddi:26847c54-1f80-4c3d-bd5d-c0402b637041?page=3&perPage=99&serviceKey=I35xhBVrKuRe7RbiQpN9NOkt%2B6JQT5Fd0fgCNDuB0dURcjnYRTmTeyrFaNHFDHVY%2FQ4etMclK24pY%2FdEMx2fGQ%3D%3D'
response = urllib.request.urlopen(url)
response_message =response.read().decode('utf8')

data = json.loads(response_message)
json_arr = data['data']


conn = pymysql.connect(host='localhost',
                       user='root',
                       password='1234',
                       db='myprojectdb',
                       charset='utf8')

sql = 'insert into book values(%d, "%s", %d)'

cur = conn.cursor()
for item in json_arr:
    cur.execute(sql % ( ((int)(item['연번']))+5000,item['서명'],
                        (int)(item['가격']) ))
conn.commit()
conn.close()










