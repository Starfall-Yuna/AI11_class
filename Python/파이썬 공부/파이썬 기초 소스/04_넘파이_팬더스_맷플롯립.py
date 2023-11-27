

import numpy as np #numpy를 np로 줄임

arr = np.array([1,2,3]) #넘파이 배열
matrix = np.array([ [1,2,3],[4,5,6] ]) #2x3 행렬
print(arr)
print(matrix)


matrix1 = np.array([ [10,20,30],[40,50,60] ])
matrix2 = np.array([ [1,2,3],[4,5,6] ])
matrix3 = matrix1+matrix2
print(matrix3)

# 행렬 곱
# m행 k열과 k행 n열인 두 행렬을 이용하여
# m행 n열인 행렬을 만들 수 있다.
matrix1 = np.array([ [10,20],[30,40],[50,60]  ])
matrix2 = np.array([ [1,2],[3,4] ])
matrix3 = np.matmul(matrix1,matrix2)
print(matrix3)

matrix = np.array([[1,2],[3,4]])
matrix = 10 * matrix
print(matrix)


import pandas as pd
numbers = pd.Series([173,70.1,1989], index=['키','몸무게','출생연도'])
print(numbers) # 전체 출력
print(numbers.index[1]) # 두 번째 인덱스 => 몸무게
print(numbers.values[1]) # 두 번째 값 => 70.1

temperatures = [[3.3,34.5,14.2,-10],[7.1,39,20,-1]]
seasons = ['봄','여름','가을','겨울']
regions = ['서울','대구']

data = pd.DataFrame(temperatures,index=regions,columns=seasons)
print(data) # 전체 출력
print(data['여름']['대구']) # 39.0
print(data.head(1)) # 첫번째 행(서울)의 온도만 출력
print(data.tail(1)) # 뒤에서 첫번째 행(대구)의 온도만 출력


#import matplotlib.pyplot as plt
#x = [a*10 for a in range(0,11)] # 0부터 10까지의 값들을 10씩 곱한 것이 x값
#y = list(range(0,11)) # range 함수 결과를 list 객체로 변환
#print('x축',x)
#print('y축',y)
#plt.plot(x,y)
#plt.show()

# 한글은 깨지므로 추후 조치해야 함
#import matplotlib.pyplot as plt
#f = lambda x:x**2
#x = [a for a in range(-8,9)]
#y = [f(b) for b in range(-8,9)]
#print('x축',x)
#print('y축',y)
#plt.plot(x,y)
#plt.show()

import matplotlib.pyplot as plt
temperatures = [7.1,39,20,-1]
x = list(range(4))

plt.title('Bar chart')
plt.bar(x,temperatures)

x_labels = ['Spring', 'Summer', 'Autumn', 'Winter']
plt.xticks(x,x_labels) # x축 항목
# y축 항목(기준 값(-1 부터 39까지를 순서대로 적음))
plt.yticks(sorted(temperatures))
plt.xlabel("season") # x축 제목
plt.ylabel("temperature") #y축 제목
plt.show()

