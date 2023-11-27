# # This is a sample Python script.
#
# # Press Shift+F10 to execute it or replace it with your code.
# # Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
#
#
# def print_hi(name):
#     # Use a breakpoint in the code line below to debug your script.
#     print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.
#
#
# # Press the green button in the gutter to run the script.
# if __name__ == '__main__':
#     print_hi('PyCharm')
#
# # See PyCharm help at https://www.jetbrains.com/help/pycharm/

import csv
import pymysql

# print((int("8"))+2  )
# print( str(8)+"a")
print(' 15,000 '.strip().replace(',',''))

f = open('data.csv', 'r', encoding='utf-8')
rdr = csv.reader(f)
count = 0
mydata = []
for line in rdr:
    if count!=0:
        mydata.append(line)
    count=count+1

f.close()
# conn = pymysql.connect(host='localhost',
#                             user='root',
#                             password='1234',
#                             db='projectdb',
#                             charset='utf8')

sql = 'INSERT INTO book (bookid, bookname, publisher, price) VALUES (%d, "%s", "%s", %d)'

for item in mydata:
    if item[2]!='':
        print( sql % (int(item[0]), item[1], item[2], (int) ( item[6].strip().replace(',','')) )  )
    else :
        print( sql % (int(item[0]), item[1], item[3], (int) ( item[6].strip().replace(',','')) )  )

for item in mydata:
     conn = pymysql.connect(host='localhost',
                                user='root',
                                password='1234',
                                db='projectdb',
                                charset='utf8')
     with conn:
         with conn.cursor() as cur:
             if item[2]!='':
                 cur.execute(sql % (int(item[0]), item[1], item[2], (int) ( item[6].strip().replace(',',''))))
             else:
                 cur.execute(sql % (int(item[0]), item[1], item[3], (int) ( item[6].strip().replace(',','')) ))
             conn.commit()





#print(mydata)