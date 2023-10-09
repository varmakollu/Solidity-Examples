# Day 3: Introduction and Basics

- C Program to Add Two Complex Numbers

```
#include <stdio.h>

struct Complex {
    float real;
    float imag;
};

int main() {
    struct Complex num1, num2, sum;

    printf("Enter the real and imaginary parts of the first complex number:\n");
    scanf("%f %f", &num1.real, &num1.imag);

    printf("Enter the real and imaginary parts of the second complex number:\n");
    scanf("%f %f", &num2.real, &num2.imag);

    sum.real = num1.real + num2.real;
    sum.imag = num1.imag + num2.imag;

    printf("Sum: %.2f + %.2fi\n", sum.real, sum.imag);

    return 0;
}

```

- C Program to Print Prime Numbers From 1 to N

```
#include <stdio.h>

int isPrime(int n) {
    if (n <= 1) {
        return 0; // 0 and 1 are not prime numbers
    }
    for (int i = 2; i * i <= n; i++) {
        if (n % i == 0) {
            return 0; // n is not prime
        }
    }
    return 1; // n is prime
}

int main() {
    int N;

    // Input the value of N
    printf("Enter a positive integer (N): ");
    scanf("%d", &N);

    printf("Prime numbers from 1 to %d are:\n", N);

    for (int i = 2; i <= N; i++) {
        if (isPrime(i)) {
            printf("%d ", i);
        }
    }

    printf("\n");

    return 0;
}

```
