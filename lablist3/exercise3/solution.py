# solution.py
# Maksymilian Garczynski


def nth_prime(n: int) -> int:
    if 0 == n:
        return 0
    elif 1 == n:
        return 2

    primes = [2]

    number = 3
    while len(primes) < n:
        is_prime = True

        for i in range(1, len(primes)):
            if 0 == number % primes[i]:
                is_prime = False
                break

        if is_prime:
            primes.append(number)

        number += 2

    return primes[-1]


n = int(input("Enter n: "))

if n < 1:
    print("Invalid n")
else:
    res = nth_prime(n)

    print(f"n-th prime number is equal {res}")
