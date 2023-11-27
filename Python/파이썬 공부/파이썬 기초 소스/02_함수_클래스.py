# 함수 : 미리 정의할 수 있는 코드 뭉치
# 필요할 때 마다 코드를 호출할 수 있다.
# 코드가 길어 져서 기능 별로 분리할 때 사용
# 반지름 r값과 pi값을 이용해 원의 정보 출력


def printCircle(r, pi): # 함수 선언, 괄호 안의 값은 매개변수(=파라메터)라고 함
    print("반지름 : %d" % r)
    print("원의 둘레 : %f" % (r*2*pi))
    print("원의 넓이 : %f" % (r*r*pi))

printCircle(10,3.14) # 함수 호출(=콜)

def returnArea(r,pi):
    print("반지름 : %d" % r)
    area = (r*r*pi)
    return area

#동일한 출력
#print와 format 모두 내장 함수
print("반지름이 %d인 원의 넓이 : %f" % (5 , returnArea(5,3.14))   )
print("반지름 : {}, 원넓이 {}".format(5,returnArea(5,3.14)))


# 함수를 매개변수로 받는 함수
# (= 콜백 함수를 매개변수로 받는 함수)
# 콜백 함수 : 다른 함수의 매개 변수가 되는 함수
def doFunc(f,p,count):
    for i in range(count):
        print(f(p))


def helloWorld(name):
    return "Hello " + name

doFunc(helloWorld,"djlee",2)
# lambda : 익명 함수. 함수 자체에 이름이 없음
# 함수를 별도로 정의하지 않고 함수 호출 때 바로 쓸 때 사용 함
func = lambda x:"제곱:{}".format(x**2)

doFunc(func,10,3)
doFunc(lambda x:"세제곱:{}".format(x**3),10,3)



numberlist = [100,200,300,400,500]
# enumerate : 리스트, 튜플, 문자열의 인덱스와 해당 값을 반환
for idx,val in enumerate(numberlist):
    print('인덱스:{0},값:{1}'.format(idx,val))
sentense = "안녕하세요."
for idx,val in enumerate(sentense):
    print('인덱스:{0},값:{1}'.format(idx,val))


# find : 특정 문자열의 시작 인덱스 찾기 위해 사용
langlist = "C,python,C#"
print(langlist.find("python")) # 2번째(세 번째 글자부터 python 시작됨)
print(langlist.find("java")) # 존재하지 않는 문자열을 찾으려고 하면 -1을 반환


nums = range(1,11) # 1부터 10까지의 값 갖는 리스트
def is_odd(n): # 매개변수(=파라메터) : n
    return n%2==1 #n이 홀수면 True 반환
#filter : 각 요소 값들을 함수의 매개변수에 대+입해, True인 것들만 묶어서 반환
#list : list 클래스의 생성자이나, 함수로 이해해도 무방
oddlist = list(filter(is_odd,nums)) #nums의 값들 하나씩 is_odd에 대입 후 홀수들만 oddlist에 추가
print(oddlist) # [1,3,5,7,9]

# lambda : 익명 함수
# 콜백 함수를 만들 때 쓰임
# 콜백 함수 : 함수의 매개변수로 이용되는 함수, 변수처럼 사용되는 함수
# 따로 함수를 만들지 않고 즉석에서 쓰고 싶을 때 사용됨
check_even = lambda x : x%2==0
evenlist1 = list(filter(check_even, nums))
evenlist2 = list(filter(lambda x : x%2==0, nums))
print(evenlist1) # [2, 4, 6, 8, 10]
print(evenlist2) # [2, 4, 6, 8, 10]

# map : 각 요소의 값들로 함수를 호출한다.
# 그에 대한 결과물들로 이뤄진 결과물을 반환한다.
# ex) 세제곱 리스트
nums = range(1,6)
pow_list = list(map(lambda x : x**3, nums))
print(pow_list)#[1,8,27,64,125]

# 클래스 : 사용자 정의 자료형
# 인스턴스 : 클래스를 이용하여 만든 변수
# 하나의 변수가 여러 가지 속성과 기능을 갖게 된다.
# 이름과 나이값 그리고 자기 소개 기능이 있는 학생을 만드는 클래스
class Student : #학생 클래스
    # 생성자는 무조건 __init__라는 이름을 갖는다.
    # 모든 함수의 매개변수에 self가 반드시 들어간다. 클래스 자신을 의미
    def __init__(self, name, age): #생성자 
        self.name = name #Student 클래스에 2개의 속성이 있게 됨
        self.age = age#이름과 나이
    def __del__(self):#소멸자
        print('메모리 삭제') #프로그램 끝날 때 혹은 인위적으로 인스턴스를 소멸할 때 자동 호출됨
    def introduce(self): # Student 클래스에만 있는 함수, 자기 소개 기능
        # 클래스 안에 있는 함수를 메소드라고 부름
        print("이름 {}, 나이 {}".format(self.name,self.age))

s = Student("이동준",34) # 처음 선언시 2개의 속성 값을 순서에 맞게 정의
s2 =  Student(age=24, name="2동준") # 매개변수를 명시적으로 표기 가능
s.introduce() # 메소드 호출
del s # 인스턴스 소멸
s2.introduce()
#del s2 # 프로그램 끝이라면 자동으로 호출됨









