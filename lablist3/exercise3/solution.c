#include <malloc.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

uint64_t nth_prime(uint64_t n) {
        if (0 == n)
                return 0;
        else if (1 == n)
                return 2;

        uint64_t prime_count = 1;
        uint64_t *primes = malloc(n * sizeof(uint64_t));
        primes[0] = 2;

        for (uint64_t number = 3; prime_count < n; number += 2) {
                bool is_prime = true;

                for (size_t i = 1; i < prime_count; i++) {
                        if (0 == number % primes[i]) {
                                is_prime = false;
                                break;
                        }
                }

                if (is_prime) {
                        primes[prime_count++] = number;
                }
        }

        uint64_t res = primes[prime_count - 1];

        free(primes);

        return res;
}

int main(void) {
        uint64_t n = 0;

        printf("Enter n: ");
        if (!scanf("%llu", &n)) {
                printf("Invalid n");

                return 1;
        }

        uint64_t res = nth_prime(n);

        printf("n-th prime number is equal %llu", res);
}
