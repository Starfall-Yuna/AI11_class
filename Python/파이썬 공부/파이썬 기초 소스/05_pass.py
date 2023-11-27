
num = 1
if(num%2==0):
    pass # 아무 것도 하지 않음
    print("짝")
else:
    print("num은 홀수입니다.") #출력됨


num1 = 10
num2 = 0
try:
    print("숫자 연산 결과")
    num3 = num1/num2 #예외 발생
    print(num3)
except:
    pass # 아무 것도 하지 않음
print("숫자 연산")

for i in range(1,6):
    if(i%2==0):
        pass # 밑의 print(i)도 실행함
    else:
        print("홀수에요.")
    print(i)

print("-"*50)

for i in range(1,6):
    if(i%2==0):
        continue # 밑의 코드들 skip하고 다음 단게로 넘어감
    else:
        print("홀수에요.")
    print(i)
