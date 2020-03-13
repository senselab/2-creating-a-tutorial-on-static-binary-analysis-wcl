#include <stdio.h>

int test(int a) {
    int c = a % 1;
    return c;
}

int main(){
	int x;
	scanf("%d", &x);
	if(test(x)){
		printf("odd\n");
	}else{
		printf("even\n");
	}
	return 0;
}

