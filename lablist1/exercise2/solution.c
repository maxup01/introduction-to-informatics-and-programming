#include <stdio.h>

void solve_quadratic_equation(double a, double b, double c) {
        double delta = b * b - 4 * a * c;

        printf("%g * x^2 + %g * x + %g = 0\n", a, b, c);

        if (delta < 0.0) {
                printf("Equation has no solution\n");
        } else if (0.0 == delta) {
                printf("x = %g / %g\n", -b, 2 * a);
        } else {
                printf("x1 = (%g - √%g) / %g\n", -b, delta, 2 * a);
                printf("x2 = (%g + √%g) / %g\n", -b, delta, 2 * a);
        }
}

int main() {
        double a = 0;
        double b = 0;
        double c = 0;

        printf("Enter a: ");
        if (!scanf("%lf", &a))
                return 1;

        printf("Enter b: ");
        if (!scanf("%lf", &b))
                return 1;

        printf("Enter c: ");
        if (!scanf("%lf", &c))
                return 1;

        solve_quadratic_equation(a, b, c);

        return 0;
}
