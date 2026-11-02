# solution.py
# Maksymilian Garczynski


def factorization(num: int) -> str:
    factors: list[str] = []
    d = 2

    while num > 1:
        exponent = 0

        while 0 == num % d:
            num //= d
            exponent += 1

        if exponent > 0:
            factors.append(f"{d}^{exponent}")

        d += 1

    return "*".join(factors)


num = int(input("Enter number: "))

if num < 2:
    print("Factorization is defined only for numbers greater than 1")
else:
    print(f"{num}={factorization(num)}")
