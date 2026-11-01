# solution.py
# Maksymilian Garczynski

from math import sqrt


def is_prime(num: int) -> bool:
    if num <= 1:
        return False

    for i in range(2, int(sqrt(num)) + 1):
        if 0 == num % i:
            return False

    return True


num = int(input("Enter number: "))

if is_prime(num):
    print("Given number is a prime number")
else:
    print("Given number is not a prime number")
