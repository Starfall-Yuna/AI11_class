import requests
import pymysql
import xml.etree.ElementTree as ET


#읽어오기
#SSL 오류는 보안 관련 이슈
#https 면 http로 바꾸고
#http면 https로 바꾸면 될 듯
#(공공기관 데이터에 대해선 이렇게 하면 됨)
api_url = 'http://apis.data.go.kr/1360000/TourStnInfoService1/getTourStnVilageFcst1?serviceKey=vxw9uytQsGAeJGDa6lWJORyzd2vnOgtmqvd1FON2GF8kuN1v%2BDYCpYSVYgrjy2eUzaL10EeaJs%2Be2sjim7T%2Flg%3D%3D&pageNo=1&numOfRows=10&dataType=XML&CURRENT_DATE=2019122010&HOUR=24&COURSE_ID=1'


response = requests.get(api_url,verify=False) #그리고 verify=False도 잊지 않아야 한다.
BeachWeathers = []
root = ET.fromstring(response.text)
iter_element = root.iter(tag="item") # animal태그 iterator를 가져옵니다
for element in iter_element: # animal태그를 순회합니다
    BWeather = {} # 각 동물을 저장할 dict 초기화한다
    BWeather['spotName'] = element.find("spotName").text # name태그 값을 저장합니다
    BWeather['sky'] = element.find("sky").text # lefespan태그 값을 저장합니다
    BeachWeathers.append(BWeather) # 동물리스트에 동물정보를 저장합니다
#print(BeachWeathers) # 결과를 출력한다

# MySQL 데이터베이스 연결
conn = pymysql.connect(
    host='localhost',
    user='root',
    password='1234',
    database='chart',
    charset='utf8'
)

cursor = conn.cursor()



for item in BeachWeathers:
    place = item['spotName']
    sky = item['sky']
    #print(item)

    sql = "INSERT INTO apidata (place, sky) VALUES (%s, %s)"
    values = (place, sky)
    #print(sql)
    #print(values)

    try:
        # 쿼리 실행
        cursor.execute(sql, values)

        # 변경사항 커밋
        conn.commit()

        print(f"데이터 삽입 완료: 장소({place}), 하늘상태({sky})")
    except Exception as e:
        pass #primary key인 데, 오류가 나도 그냥 무시한다.
        #print(f"데이터 삽입 오류 발생: {e}")
        #conn.rollback()

    # 연결 종료


cursor.close()
conn.close()


