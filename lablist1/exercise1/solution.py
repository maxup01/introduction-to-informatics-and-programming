# solution.py
# Maksymilian Garczynski


def greatest_common_divisor(a: int, b: int) -> int:
    while b != 0:
        pom = a % b
        a = b
        b = pom

    return a


a = int(input("Enter first number: "))
b = int(input("Enter second number: "))

print(f"Greatest common divisor is: {greatest_common_divisor(a, b)}")
