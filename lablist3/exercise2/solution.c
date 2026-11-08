#include <stdint.h>
#include <stdio.h>

uint64_t binomial(uint64_t n, uint64_t k) {
        if (k > n)
                return 0;

        if (k > n - k)
                k = n - k;

        uint64_t res = 1;

        for (uint64_t i = 1; i <= k; i++)
                res *= (n - k + i) / i;

        return res;
}

int main(void) {
        uint64_t n = 0;
        uint64_t k = 0;

        printf("Enter n: ");
        if (!scanf("%llu", &n))
                return 1;

        printf("Enter k: ");
        if (!scanf("%llu", &k))
                return 1;

        uint64_t res = binomial(n, k);

        printf("Binomial of n = %llu and k = %llu is equal to %llu", n, k, res);
}
