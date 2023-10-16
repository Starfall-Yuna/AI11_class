#include<stdio.h>
void swap(int* a, int* b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}
void notswap(int a, int b)
{
	int temp = a;
	a = b;
	b = temp;
}
int main()
{
	int a = 3, b = 5;
	printf("a=%d, b=%d\n", a, b);
	swap(&a, &b);
	printf("a=%d, b=%d\n", a, b );
	notswap(a, b);
	printf("a=%d, b=%d\n", a, b);
}