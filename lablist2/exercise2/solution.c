// solution.py
// Maksymilian Garczynski

#include <math.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>

int is_prime(uint64_t num) {
        if (num <= 1) {
                return 0;
        }

        for (size_t i = 2; i < (size_t)sqrt(num) + 1; i++) {
                if (0 == num % i) {
                        return 0;
                }
        }

        return 1;
}

int main() {
        uint64_t num = 0;

        printf("Enter number:");
        if (!scanf("%llu", &num))
                return 1;

        if (is_prime(num)) {
                printf("Given number is a prime number");
        } else {
                printf("Given number is not a prime number");
        }
}
