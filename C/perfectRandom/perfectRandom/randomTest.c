#include<stdio.h>
#include<stdlib.h>
#include<windows.h>
int main()
{
	//srand(time(NULL)); //�ð� Ȱ��� ���ÿ� �����ϸ� �Ȱ��� ������ ����
	srand(GetCurrentProcessId()); //���μ��� ID�� Ȱ��

	int random = rand() % 45 + 1;
	printf("%d\n", random);

	return 0;
}