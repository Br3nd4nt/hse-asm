#include <stdio.h>
int main(){
    int a, b;
    int q = 0;
    int sign = 0;
    printf("Type a: \n");
    scanf("%d", &a);
    printf("Type b: \n");
    scanf("%d", &b);
    if (a * b > 0) {
        sign = 1;
    } else {
        sign = -1;
    }
    b = (b ^ (b >> 31) - (b >> 31));
    a = (a ^ (a >> 31) - (a >> 31));
    while (a > b) {
        a -= b;
        q += 1;
    }
    printf("%d\n", q * sign);
    printf("%d\n", a);
    return 0;
}
