import csv #csv 파일 읽는 라이브러리 호출
import matplotlib.pyplot as plt

#f = 파일을 처리하는 변수
#open 함수를 통해 읽어들인 파일에 대한 내용을 저장
f = open('mydata.csv','r')

rdr = csv.reader(f) #파일 데이터를 읽음

mydatas = [] #리스트 선언

isStart = True

for line in rdr: #rdr에 있는 걸 한 줄씩 읽을 것
    if isStart:
        isStart=False
        #pass
    else:
        mydatas.append(line)
f.close()
numbers = []

for item in mydatas:
    numbers.append(int(item[5]))
    #print(('상호명:%s, 전화번호:%s, 대표메뉴:%s')%
    #      (item[1],item[3],item[4]))
    #print(item)
for item in numbers:
    print(item)
x=list(range(1,26))

plt.title('Bar')
plt.bar(x,numbers)
#plt.yticks(sorted(numbers))
plt.show()