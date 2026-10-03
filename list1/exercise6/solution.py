def is_palindrome(num: int):
    pom = 0
    pom_num = num

    while pom_num > 0:
        pom *= 10
        pom += pom_num % 10

        pom_num //= 10

    return pom == num
