def binomial(n: int, k: int) -> int:
    if k > n or n < 0 or k < 0:
        return 0

    if k > n - k:
        k = n - k

    res = 1

    for i in range(1, k + 1):
        res *= (n - k + i) // i

    return res


n = int(input("Enter n: "))
k = int(input("Enter k: "))

res = binomial(n, k)

if res == 0:
    print("Invalid inputs")
else:
    print(f"Binomial of n = {n} and k = {k} is equal to {res}")
