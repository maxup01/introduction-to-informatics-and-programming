def from_c_to_dec(base: int, num: int):
    p = 1
    dec = 0

    while num > 0:
        dec += (num % 10) * p
        num //= 10
        p *= base

    return dec


def from_hex_to_dec(hex: str):
    p = 1
    dec = 0

    for digit in reversed(hex):
        if ord(digit) >= ord("A"):
            dec += (ord(digit) - ord("A") + 10) * p
        else:
            dec += (ord(digit) - ord("0")) * p
        p *= 16

    return dec


print(f"a) {from_c_to_dec(2, 101010)}")
print(f"b) {from_c_to_dec(8, 1357)}")
print(f"c) {from_hex_to_dec("DEAD")}")
print(f"d) {from_hex_to_dec("BEAF")}")
