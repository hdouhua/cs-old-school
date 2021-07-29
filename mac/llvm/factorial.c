#include <stdio.h>

int factorial(int x) {
   if (x > 1) return x * factorial(x-1);
   else return 1;
}

int main() {
  printf("factorial 10: %d\n", factorial(10));
}
