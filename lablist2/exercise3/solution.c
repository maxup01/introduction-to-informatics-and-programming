// solution.c
// Maksymilian Garczynski

#include <stdint.h>
#include <stdio.h>

void print_factor(uint64_t factor, uint64_t exponent, int *first) {
        if (!*first) {
                printf("*");
        }

        *first = 0;

        printf("%llu", factor);
        printf("^%llu", exponent);
}

void print_factorization(uint64_t num) {
        int first = 1;

        printf("%llu=", num);

        for (uint64_t d = 2; num > 1; d++) {
                uint64_t exponent = 0;

                while (0 == num % d) {
                        num /= d;
                        exponent++;
                }

                if (exponent > 0) {
                        print_factor(d, exponent, &first);
                }
        }

        printf("\n");
}

int main() {
        uint64_t num = 0;

        printf("Enter number:");
        if (1 != scanf("%llu", &num))
                return 1;

        if (num < 2) {
                printf("Factorization is defined only for numbers greater than "
                       "1\n");
                return 1;
        }

        print_factorization(num);
}
