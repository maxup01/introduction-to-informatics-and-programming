import sys
from typing import Optional


def solve_quadratic_equation(a: float, b: float, c: float):
    delta = (b**2) - 4 * a * c

    print(f"{a} * x^2 + {b} * x + {c} = 0")

    if delta < 0.0:
        print("Equation has no solution")
    elif 0.0 == delta:
        print(f"x = {-b} / {2 * a}")
    else:
        print(f"x1 = ({-b} - √{delta}) / {2 * a}")
        print(f"x2 = ({-b} + √{delta}) / {2 * a}")


a = float(input("Enter a: "))
b = float(input("Enter b: "))
c = float(input("Enter c: "))

solve_quadratic_equation(a, b, c)
