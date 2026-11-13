// solution.c
// Maksymilian Garczyński

#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

bool is_prime(uint64_t n) {
        if (n < 2)
                return false;
        if (n < 4)
                return true;
        if (n % 2 == 0 || n % 3 == 0)
                return false;

        for (uint64_t i = 5; i <= n / i; i += 6) {
                if (n % i == 0 || n % (i + 2) == 0)
                        return false;
        }
        return true;
}

uint64_t prime_number_count(uint64_t n) {
        if (n < 2) {
                return 0;
        }

        uint64_t count = 1;

        for (uint64_t i = 3; i <= n; i += 2) {
                if (is_prime(i)) {
                        count++;
                }
        }

        return count;
}

int main(void) {
        uint64_t num = 0;

        printf("Enter a number: ");
        if (!scanf("%llu", &num))
                return 1;

        uint64_t c = prime_number_count(num);

        printf("\nThere are %llu prime numbers from 0 to %llu", c, num);
}
