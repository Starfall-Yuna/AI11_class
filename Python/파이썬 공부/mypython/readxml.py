import xml.etree.ElementTree as elemTree
import pymysql

#xml.etree.ElementTree에 있는 parse 메소드 이용
tree = elemTree.parse('data3.xml') #tree라는 변수 선언
#data 태그를 찾음
#data 안에 있는 item 태그들을 모두 data 변수에 대입
data = tree.find('./data').findall('item')

xml_arr = [] #배열 선언
xml_dictionary = {} #자바스크립트의 객체, 파이썬에선 이걸 딕셔너리라고 함
#자바스크립트의 객체와 마찬가지로 속성 추가하고 싶으면
#그냥 새로 써주면 알아서 속성 추가됨.
for item in data: #data : <item>태그의 모음
    xml_dictionary['연번'] = item.find('./col[@name="연번"]').text
    try:
        xml_dictionary['서명']=item.find('./col[@name="서명"]').text
    except:
        xml_dictionary['서명']='' #비어 있는 값 넣음
    xml_dictionary['가격']=item.find('./col[@name="가격"]').text
    xml_arr.append(xml_dictionary)
    xml_dictionary={} #초기화해주기
conn = pymysql.connect(host='localhost',
                           user='root',
                           password='1234',
                           db='myprojectdb',
                           charset='utf8')

sql = 'insert into book values(%d, "%s", %d)'
cur = conn.cursor()
for item in xml_arr:
    cur.execute(sql % ( ((int)(item['연번']))+4000,item['서명'],
                        (int)(item['가격']) ))
conn.commit()
conn.close()


