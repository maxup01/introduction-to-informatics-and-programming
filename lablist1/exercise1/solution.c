// solution.c
// Maksymilian Garczynski

#include <stdint.h>
#include <stdio.h>

uint64_t greatest_common_divisor(uint64_t a, uint64_t b) {
        while (0 != b) {
                uint64_t pom = a % b;
                a = b;
                b = pom;
        }

        return a;
}

int main() {
        uint64_t a = 0;
        uint64_t b = 0;

        printf("Enter first number:");
        if (!scanf("%llu", &a))
                return 1;

        printf("Enter second number:");
        if (!scanf("%llu", &b))
                return 1;

        uint64_t gcd = greatest_common_divisor(a, b);
        printf("Greatest common divisor of two given numbers is: %llu", gcd);

        return 0;
}
