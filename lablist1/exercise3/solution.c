// solution.c
// Maksymilian Garczynski

#include <stdint.h>
#include <stdio.h>

int is_palindrome(uint64_t num) {
        uint64_t pom = 0;
        uint64_t pom_num = num;

        while (pom_num > 0) {
                pom *= 10;
                pom += pom_num % 10;

                pom_num /= 10;
        }

        return pom == num;
}

int main() {
        uint64_t number = 0;

        printf("Enter number: ");
        if (!scanf("%lu", &number))
                return 1;

        if (is_palindrome(number))
                printf("%lu is a palindrome", number);
        else
                printf("%lu is not a palindrome", number);

        return 0;
}
