print("Hello World")

a = 10
a = "bac"
# 파이썬은 if나 for 쓸 때 콜론으로 구분
# 들여쓰기로 어디에 속해있는지 구분(중괄호 안 씀)
if a=="bac":
    print("a는 bac이다.")
elif a==10:
    print("a는 10")
else:
    print("이도저도 아님")

i = 0
a = 10
while i<a:
    print(i)
    i+=1
#1부터 11미만까지 1씩 증가하는 반복문
for item in range(1,11,1) :
    print(item)

mydata = []
mydata.append(10)
mydata.append(20)
mydata.insert(1, 15)
for item in mydata:
    print(item)
    #10,15,20
"""
띄어쓰기 없이 (시작과 끝부분)
  여러줄 주석은 큰따옴표 3개 
   이런
    주석
"""