#include <stdio.h>

extern int fibonacci(int x);
extern int non_recursive_fib(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;

  scanf("%d",&number);
  if(atoi(argv[1]) == 0){
    result = fibonacci(number);
    printf("The fibonacci sequence at %d is: %d\n", number, result);
  } else {
    result = non_recursive_fib(number);
    printf("The non-recursive fibonacci sequence at %d is: %d\n", number, result);
  }
}

