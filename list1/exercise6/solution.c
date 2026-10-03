#include <stdint.h>

typedef enum { true = 0, false = 1 } bool;

bool is_palindrome(uint64_t num) {
        uint64_t pom = 0;
        uint64_t pom_num = num;

        while (pom_num > 0) {
                pom *= 10;
                pom += pom_num % 10;

                pom_num /= 10;
        }

        return pom == num;
}
