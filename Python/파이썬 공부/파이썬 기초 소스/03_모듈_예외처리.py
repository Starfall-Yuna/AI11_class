# import 모듈명 => 모듈명을 계속 적어야 함
# from 모듈명 import * => 모듈명 생략 가능, * 대신 원하는 함수만 적을 수 있다.
from Student import *

a = Student("이동준",34)
a.introduce()
printCircle(10,3.14)

# 예외 처리 : 예외가 발생해서
# 프로그램이 종료될 것 같은 부분을 try로 묶는다.
# 예외가 발생되면 except 부분을 수행하여
# 프로그램이 강제 종료되지 않음

def calc(aa,bb) :
    cc = 0
    try:
        print("a=%d b=%d" % (aa,bb)) #a=10 b=0
        cc=aa/bb # 예외 발생
        print("결과")
        print(cc)
        return cc
    except Exception as e:
        print(e) # 오류 출력
        return -1
    finally: # try 결과에 상관없이, except가 return등으로 종료되도 반드시 실행함.
        print("-1을 리턴하더라도 이건 무조건 출력")

print("결과 : {}".format(calc(10,0)))


