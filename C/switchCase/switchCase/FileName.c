#include<stdio.h>
int main()
{
	int num = 4;

	int n[] = { 1,2,3,4 };
	int n2[10];
	//int[] n2 = { 1,2,3,4 };
	//int[10] n3;
	//int[10] n3 = new 

	switch (num) 
	{
	case 0:
		printf("zero");
		break;
	case 1:
	case 2:
	case 3:
		printf("one~three");
		break;
	case 4:
		printf("four"); //break가 없어도 오류가 나지 않음
	case 5:
		printf("five");
		break;
	}

	return 0;
}