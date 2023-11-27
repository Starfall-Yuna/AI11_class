# 네이버 검색 API 예제 - 블로그 검색
import json
import urllib.request
client_id = "R9RvEToCf5NQ0BY1B4mf"
client_secret = "aFVVBFV1J0"
encText = urllib.parse.quote("9791195066780")
url = 'https://openapi.naver.com/v1/search/book_adv.json?d_isbn='+encText

#url='https://openapi.naver.com/v1/search/book_adv.json?d_titl=&display=100&start=1'
#url='https://openapi.naver.com/v1/search/book.json?query='+encText
#url = "https://openapi.naver.com/v1/search/blog?query=" + encText+"&display=1" # JSON 결과
#url = "https://openapi.naver.com/v1/search/blog.xml?query=" + encText # XML 결과
request = urllib.request.Request(url)
request.add_header("X-Naver-Client-Id",client_id)
request.add_header("X-Naver-Client-Secret",client_secret)
response = urllib.request.urlopen(request)
rescode = response.getcode()
if(rescode==200):
    response_body=json.load(response)
    #print(response_body)
    #print(response_body['items'][0]['image'])
    #response_body = response.read()
    #print(response_body.decode('utf-8'))
else:
    print("Error Code:" + rescode)