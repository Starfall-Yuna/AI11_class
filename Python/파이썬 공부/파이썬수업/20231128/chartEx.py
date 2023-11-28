import matplotlib.pyplot as plt
plt.rcParams['font.family'] = 'D2Coding'

temperatures = [7.1,39,20,-1]
x = list(range(4))

plt.title('Bar chart')
plt.bar(x,temperatures)

x_labels = ['봄', '여름', '가을', '겨울']
plt.xticks(x,x_labels) # x축 항목
# y축 항목(기준 값(-1 부터 39까지를 순서대로 적음))
plt.yticks(sorted(temperatures))
plt.xlabel("season") # x축 제목
plt.ylabel("temperature") #y축 제목
plt.show()
