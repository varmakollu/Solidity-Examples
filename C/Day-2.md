# Day 2:  Introduction and Basics

- C Program to Swap Two Numbers

```
#include <stdio.h>

int main()
{
	int x, y;
	printf("Enter Value of x ");
	scanf("%d", &x);
	printf("\nEnter Value of y ");
	scanf("%d", &y);

	int temp = x;
	// Assign the value of y to x
	x = y;
	y = temp;

	printf("\nAfter Swapping: x = %d, y = %d", x, y);
	return 0;
}

```

-

```


```
