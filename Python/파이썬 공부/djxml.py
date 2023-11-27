import xml.etree.ElementTree as elemTree
import pymysql

tree = elemTree.parse('data3.xml')
data = tree.find('./data').findall('item')
xml_arr = []
xml_tuple = {}
# xml_tuple['abc'] = 'a'
#print(xml_tuple)
for item in data:
    #print(item.find('./col[@name="연번"]').text)
    xml_tuple['연번']=item.find('./col[@name="연번"]').text
    try:
        #print(item.find('./col[@name="서명"]').text)
        xml_tuple['서명']=item.find('./col[@name="서명"]').text
    except:
        #print('')
        xml_tuple['서명']=''
    try:
        #print(item.find('./col[@name="발행자"]').text)
        xml_tuple['발행자']=item.find('./col[@name="발행자"]').text
    except:
        #print('')
        xml_tuple['발행자']=''
    #print(item.find('./col[@name="가격"]').text)
    xml_tuple['가격']=item.find('./col[@name="가격"]').text
    xml_arr.append(xml_tuple)
    xml_tuple={}
    #print(xml_tuple)


print(xml_arr)
    #print(colitem.text )
    #print('---')
    #print(col)
print ("start db")

conn = pymysql.connect(host='localhost',
                       user='root',
                       password='1234',
                       db='projectdb',
                       charset='utf8')

sql = 'INSERT INTO book (bookid, bookname, publisher, price) VALUES (%d, "%s", "%s", %d)'
cur = conn.cursor()
for item in xml_arr:
    print(sql % ( int(item['연번'])+2406, item['서명'], item['발행자'], (int) ( item['가격'])))
    cur.execute(sql % ( int(item['연번'])+2406, item['서명'], item['발행자'], (int) ( item['가격'])))

conn.commit()
conn.close()



