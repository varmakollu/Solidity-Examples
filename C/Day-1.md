# Day 1: Introduction and Basics

- Write your first "Hello, World!" program in C.

```
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}

```
- Write your "Welcome to the world of C programming" program in C.

```
  #include <stdio.h>

  int main() {
    printf("Welcome to the world of C programming!");
    return 0;
  }

```
- Write a C Program to Print an Integer (Entered by the User)

```
#include <stdio.h>
int main() {   
    int number;
   
    printf("Enter an integer: ");  
    
    // reads and stores input
    scanf("%d", &number);

    // displays output
    printf("You entered: %d", number);
    
    return 0;
}

```
