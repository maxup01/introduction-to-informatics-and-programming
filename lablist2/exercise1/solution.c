// solution.py
// Maksymilian Garczynski

#include <stdint.h>
#include <stdio.h>

uint64_t greatest_common_divisor(uint64_t a, uint64_t b) {
        if (b > a) {
                uint64_t pom = b;
                b = a;
                a = pom;
        }

        while (0 != a % b) {
                uint64_t pom = a % b;
                a = b;
                b = pom;
        }

        return b;
}

int main() {
        uint64_t a = 0;
        uint64_t b = 0;

        printf("Enter first number:");
        if (!scanf("%lu", &a))
                return 1;

        printf("Enter second number:");
        if (!scanf("%lu", &b))
                return 1;

        uint64_t gcd = greatest_common_divisor(a, b);
        printf("Greatest common divisor of two given numbers is: %lu", gcd);

        return 0;
}
