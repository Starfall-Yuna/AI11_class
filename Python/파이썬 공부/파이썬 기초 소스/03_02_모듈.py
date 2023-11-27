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

#Student 클래스와 별개로 함수도 추가함
def printCircle(r, pi): # 함수 선언, 괄호 안의 값은 매개변수(=파라메터)라고 함
    print("반지름 : %d" % r)
    print("원의 둘레 : %f" % (r*2*pi))
    print("원의 넓이 : %f" % (r*r*pi))