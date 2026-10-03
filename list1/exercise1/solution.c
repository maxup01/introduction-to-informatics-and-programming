#include <printf.h>
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

// Returns null if memory on heap cannot be allocated by
// allocator or (base > 10 v base == 0).
// Algorithm doesn't work correctly if num is not given in
// base based numerical system
uint64_t *from_c_to_dec(uint64_t base, uint64_t num) {
        if (base > 10 || 0 == base) {
                return NULL;
        }

        uint64_t *dec = calloc(1, sizeof(uint64_t));

        if (NULL == dec) {
                return NULL;
        }

        uint64_t p = 1;

        while (num > 0) {
                *dec += p * (num % 10);
                num /= 10;
                p *= 2;
        }

        return dec;
}

uint64_t from_hex_to_dec(char *hex) {
        size_t len = strlen(hex);
        uint64_t p = 1;
        uint64_t dec = 0;

        for (size_t i = len; i > 0; i--) {
                const char *digit = (hex + i - 1);

                if (*digit >= 'A') {
                        dec += (*digit - 'A' + 10) * p;
                } else {
                        dec += (*digit - '0') * p;
                }

                p *= 16;
        }

        return dec;
}

int main(void) {
        uint64_t *a = from_c_to_dec(2, 101010);
        printf("a) %llu\n", *a);

        uint64_t *b = from_c_to_dec(8, 1357);
        printf("b) %llu\n", *b);

        uint64_t c = from_hex_to_dec("DEAD");
        printf("c) %llu\n", c);

        uint64_t d = from_hex_to_dec("BEAF");
        printf("d) %llu\n", d);

        free(a);
        free(b);
}
