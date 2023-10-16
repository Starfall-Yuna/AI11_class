#include<stdio.h>
void notswap(int a, int b)
{
	int temp = a;
	a = b;
	b = temp;
}
int main()
{  //함수 없이 두 개의 값 바꿈 
	int a = 3, b = 5;
	//int a = 3;
	//int b = 5;
	printf("a=%d, b=%d\n", a, b);
	int temp = a;
	a = b;
	b = temp;
	printf("a=%d, b=%d\n", a, b);
	return 0;
}