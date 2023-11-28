import json
import urllib.request

myurl = 'https://api.odcloud.kr/api/3047940/v1/uddi:633f7dab-ffb5-4843-bc65-bd7f3b99dfa2?page=1&perPage=1000&serviceKey=9xBqP7CqYimcMjtI%2FC65UWk6z1HS%2FSoR6eGctgZYZiZekZxT4ueY7DWmlF9ERi9jD%2BWuZRkJ9KK%2FRqNdei%2Be7Q%3D%3D'

response = urllib.request.urlopen(myurl)
response = response.read().decode('utf8')
#ctrl + shift + f10 : 내가 작업한 거 바로 실행
#shift + f10 : 최근에 작업한 거 바로 실행
print(response)

#response 데이터를 json 형태로 바꿈
data = json.loads(response)
json_arr = data['data'] #key가 'data'인 것만 갖고 옴
#csv와는 다르게 열 이름(column이름)을 직접 입력할 수 있음
for item in json_arr:
    print(f"식당명:{item['상호명']}, 대표메뉴:{item['주메뉴']}")
