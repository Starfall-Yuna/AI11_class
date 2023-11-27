import matplotlib.pyplot as plt

f = lambda x : x ** 2

x = [x for x in range(-8,9)]
y = [f(y) for y in range(-8,9)]
#y = [lambda a : a ** 2 for y in range(-8,9)]

print('x축',x)
print('y축',y)

plt.plot(x,y)
plt.show()


