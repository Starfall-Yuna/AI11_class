#include<stdio.h>
#include<stdlib.h>
#include<windows.h>
int main()
{
	//srand(time(NULL)); //시간 활용시 동시에 시작하면 똑같은 랜덤값 나옴
	srand(GetCurrentProcessId()); //프로세스 ID를 활용

	int random = rand() % 45 + 1;
	printf("%d\n", random);

	return 0;
}