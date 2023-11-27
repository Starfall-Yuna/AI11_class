print(10+5) #15
print((10-5)*2) #10
print(10-5*2) #0
print(2.2*5) #11.0
print(3/2) #1.5
print(1.0/2.0) #0.5
print(2**5) # 2^5 = 2*2*2*2*2 = 32
print(7//3) # 몫 : 2
print(7%3) # 나머지 : 1

a=10
b=20
print(a*b) #200


#작은 따옴표나 큰 따옴표로 감싸짐
msg = "안녕하세요."
# 각기 다른 따옴표를 강조표시로 사용 가능
msg2 = '안녕하세요. 제 이름은 "이동준"입니다.'
# 큰 따옴표 안에 작은 따옴표가 있고, 작은 따옴표 안에 큰 따옴표가 있음
msg3 = "안녕, '이동준'"
#escape 문자 있음
msg4 = "\"이동준 선생님\" 안녕하세요."

print(msg) # 안녕하세요
print(msg2) # 안녕하세요. 제 이름은 "이동준"입니다.
print(msg3) # 안녕, '이동준'
print(msg4) # "이동준 선생님" 안녕하세요.

multi_line = '''
여러 줄 문장은 
이렇게 적을 수 있습니다.
'''
multi_line2 = """
큰 따옴표와 작은 따옴표 모두
가능 합니다.
"""
multi_line3 = "이렇게\n쓰는 것도 됩니다."

print(multi_line)
print(multi_line2)
print(multi_line3)

"""
이건 여러 줄 주석처럼
활용될 수도 있습니다.
신기한 파이썬
"""

# 리스트 : 자바스크립트의 배열과 같다. 여러 개의 데이터를 한 번에 관리하는 자료형
# 여러 타입의 값들이 하나의 리스트에 있다.
list1 = [1,2,3,4,5]
list2 = [1.0, 3.14, 2.0]
list3 = [34, 69.5, 173, '이동준']
list4 = [list1, list2, list3, [10,20,30]]

# [1,2,3,4,5]
print(list1)
# 두 번쨰 값 출력
# 파이썬은 인덱스를 0부터 시작(인덱스=순번)
# 즉 첫번째 값은 list1[0]으로 출력 가능
print(list1[1]) # 2

#뒤에서 첫 번째(-1) 선택
print(list1[-1]) # 5
#세 번째(2)부터 끝까지 선택
print(list1[2:]) # [3,4,5]
#뒤에서 두(-2)번째부터 끝까지
print(list1[-2:]) # [4,5]
#두 번째(1)부터 뒤에서 두 번째(-2)까지
print(list1[1:-2]) #[2,3]

# list1 = [1,2,3,4,5]
print(list1[0]) # 1
list1[0] = 100 # 첫 번째 값 변경
print(list1[0]) # 100
print(list1) # [100,2,3,4,5]

#길이가 5이므로, [0]부터 [4]까지 값 대입 가능
#[5]번째 즉 여섯 번째가 없으므로 에러 발생
#list1[5] = 1000

#append : 리스트 끝에 값을 추가. 길이가 늘어 난다.
list1.append(1000)
print(list1[5]) # 1000
print(list1) # [100, 2, 3, 4, 5, 1000]

list1.insert(1,3.14) # 지정한 인덱스에 값 추가
print(list1) # [100, 3.14, 2, 3, 4, 5, 1000]

# list1 = [100, 3.14, 2, 3, 4, 5, 1000]
#pop : list1의 끝 값을 변수에 대입 후, 리스트에서 제거
a = list1.pop()
print(a) # 1000
print(list1) # [100,3.14,2,3,4,5], 끝 값이 삭제됨
b = list1.pop(0) # 100
print(b)
print(list1) # [3.14,2,3,4,5], 첫번째(0) 값이 삭제됨
# del : pop과 달리 값 삭제만 수행
del list1[0] # 바로 삭제함
print(list1) # [2, 3, 4, 5]


# list1 = [2, 3, 4, 5]
print(len(list1)) # 길이 : 4

# 튜플 : 리스트와 동일하나
# 소괄호로 구분하며 순서와 내용 수정 불가
tuple1 = (1,2,3,4,5)
#tuple1[0] = 100

# tuple1 = (1,2,3,4,5)
# tuple1 = tuple1 + (100) # Error 발생
# 콤마를 이용하여 더하기 연산으로 튜플에 값 추가는 가능
tuple1 = tuple1 + (100,)
print(tuple1) # 1,2,3,4,5,100

# 더하기를 이용하여 값 추가 가능
print(list1) # [2,3,4,5]
list1 = list1+[10]
print(list1) # [2,3,4,5,10]
list1 = list1 + [20,]
print(list1) # [2, 3, 4, 5, 10, 20]
list1 = list1 + [30,40]
print(list1) # [2, 3, 4, 5, 10, 20, 30, 40]

# 딕셔너리 : 자바스크립트 객체와 동일
# key-value 쌍으로 됨
# key : 숫자와 문자열만 가능
# value : 형태 제한 없음
djlee = {
    'name' : '이동준',
    'age' : 34,
    1989 : '그가 태어난 해',
    'lang' : ['C','C#','Java'],
    'phone' : {
        'name' : '갤럭시',
        'os' : 'Android'
    }
}
print(djlee)

teacher = {
    'name' : '이동준',
    0 : '그의 가장 큰 가치는 잘 가르치는 것'
}
print(teacher[0]) # 그의 가장 큰 가치는 잘 가르치는 것, 인덱스가 아닌 키로써 접근
print(teacher['name']) # 이동준
teacher['birth'] = '19890430' # 새로운 값이 바로 추가 됨
print(teacher) # {'name': '이동준', 0: '그의 가장 큰 가치는 잘 가르치는 것', 'birth': '19890430'}
del teacher['name'] # 해당 키로 접근하여 key-value 쌍을 지움
print(teacher) # {0: '그의 가장 큰 가치는 잘 가르치는 것', 'birth': '19890430'}
teacher.clear() # 모든 key-value 쌍 삭제


# 참/거짓, Boolean
# True와 False 값만 갖고,
# 첫 글자는 대문자
# 조건문(if)과 반복문(for와 while)에서 쓰이며,
# 알고리즘을 짤 때 가장 중요한 개념
info1 = True
info2 = False
info3 = 1==1 # 1과 1은 같으므로 참(True)
info4 = 10>100 # 10은 100보다 크다고 적었으나 이는 거짓(False)

print(info1) # True
print(info2) # False
print(info3) # True
print(info4) # False


# if 뒤의 값이 True여야 밑의 코드 실행함
# True or False 여부 뒤에 반드시 콜론(:)을 붙여야 함
# 반드시 들여쓰기(space 4칸이)
# 파이참을 쓴다면 자동으로 들여쓰기가 된다.
myinfo = True
if myinfo:
    print("이 정보는 사실입니다.")

myinfo2 = 10>100 #거짓인 조건
if myinfo2:
    print("이게 사실이면 큰 일이다.") #출력 안 됨

dj_age = 34
if dj_age<30:
    print("20대? 10대는 아닐거고...")
else: #if에 해당하지 않는다면 else부분 출력
    print("20대 선생님은 아니시군요!")
    # str : 데이터나 변수 값을 문자열 타입으로 변환
    # 문자열끼리 덧셈 연산으로 이어 붙일 수 있음
    print("나이 : " + str( dj_age) )


# elif : if와 else 이외의 조건들
# 분기가 여러 개 일 경우 사용
dj_born = '뱀 띠'
if dj_born == '호랑이 띠':
    print("그는 호랑이 띠 입니다.")
elif dj_born == '뱀 띠':
    print("그는 뱀 띠에요.") # 출력됨
else:
    print("무슨 띠죠?")


# 무한 대로 반복
#while True:
#    print("안녕하세요.")
print()
print()
count = 0
while count<3: # 이 조건이 False가 되면 반복문 중단
    print("반갑습니다.")
    count += 1 # count = count + 1


while False:
    print('숫자 입력 : ')
    # input() : 문자열을 입력받음
    # int : 입력받은 문자열을 숫자로 변경
    num = int(input()) 
    if num==0:
        print("처음으로 돌아갈 것")
        continue # 밑의 코드들 skip하고 다음 반복 진행
    elif num==-1:
        print("반복문 종료")
        break # 반복문 종료
    else:
        print("입력한 숫자 %d" % num) # ex) 입력한


# range : 1부터 9까지의 리스트 생성
numbers = range(1,10)
#numbers 안의 값들을 하나씩 출력하는 코드
# for : while은 무한 반복에 주로 쓰이며,
# for는 유한 반복에서 주로 사용
for i in numbers: #numbers 길이 만큼 코드를 반복
    print(i) # i : numbers 안에 있는 값

# 튜플 여러 개로 된 리스트
simbols = [('파이썬','비단뱀'),('리눅스','펭귄'),('java','커피')]
for lang,sim in simbols: # 자동으로 lang과 sim에 튜플들의 값이 대입됨
    print(lang, sim) # 자동으로 한 칸 띄고 출력
    # 이와 같이 출력되려면 변수의 개수가 같아야 함

# 1부터 99까지의 값이 저장된 리스트
# continue와 break가 for에도 사용 가능
numbers = range(1,100)
for num in numbers:
    if num%2==0:
        continue # 다음 단계로 넘어감(while과 동일)
    elif num%7==0:
        print("7의 배수를 만나면 종료")
        break # 반복문 종료
    else:
        print(num)

dj = {
    #key : value
    'born' : '890430',
    '성별' : '남성',
    '성' : 'lee'
}

for keys in dj.keys(): # key들만 추출
    print(keys)
for vals in dj.values(): #value들만 추출
    print(vals)
for itms in dj.items(): #key-value 모두 가져 옴
    print(itms)
for k,v in dj.items(): #k에 key, v에 value 대입
    print(k,v)

