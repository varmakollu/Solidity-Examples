# Day 1: Introduction and Basics

- Hello, World! program in C.

```
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}

```
- C Program To Print Your Own Name

```
#include <stdio.h> 

int main() 
{ 
	// print name 
	printf("Name : GeeksforGeeks"); 
	return 0; 
}

```
- Print an Integer Value in C

```

#include <stdio.h>

int main()
{
	int x = 5;

	// Printing values
	printf("Printing Integer value %d", x);
	return 0;
}


```

- C Program to Add Two Integers

```
#include <stdio.h> 

int main() 
{ 
	int A, B, sum = 0; 

	printf("Enter two numbers A and B : \n"); 

	scanf("%d%d", &A, &B); 

	sum = A + B; 

	// Print the sum 
	printf("Sum of A and B is: %d", sum); 

	return 0; 
}


```

- Prime Number Program in C

```
#include <stdio.h>

int main() {

  int n, i, flag = 0;
  printf("Enter a positive integer: ");
  scanf("%d", &n);

  // 0 and 1 are not prime numbers
  // change flag to 1 for non-prime number
  if (n == 0 || n == 1)
    flag = 1;

  for (i = 2; i <= n / 2; ++i) {

    // if n is divisible by i, then n is not prime
    // change flag to 1 for non-prime number
    if (n % i == 0) {
      flag = 1;
      break;
    }
  }

  // flag is 0 for prime numbers
  if (flag == 0)
    printf("%d is a prime number.", n);
  else
    printf("%d is not a prime number.", n);

  return 0;
}


```
