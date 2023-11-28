import xml.etree.ElementTree as elemTree
import requests

myurl = 'https://api.odcloud.kr/api/3047940/v1/uddi:633f7dab-ffb5-4843-bc65-bd7f3b99dfa2?page=1&perPage=1000&returnType=XML&serviceKey=9xBqP7CqYimcMjtI%2FC65UWk6z1HS%2FSoR6eGctgZYZiZekZxT4ueY7DWmlF9ERi9jD%2BWuZRkJ9KK%2FRqNdei%2Be7Q%3D%3D'
response = requests.get(myurl)
xmldatas = elemTree.fromstring(response.text)
myresult = xmldatas.find('data').findall('item')

for item in myresult:
    print('식당명:{},주메뉴:{},전화번호:{}'.format
          (item.find('./col[@name="상호명"]').text,
           item.find('./col[@name="주메뉴"]').text,
           item.find('./col[@name="전화번호"]').text))
