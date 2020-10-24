#include <mymath/mymath.h>
#include <add/add.h>
#include <substract/substract.h>

int math::plus(int x, int y) noexcept
{
    return plus_def(x, y);
}

int math::minus(int x, int y) noexcept
{
    return substraction::minus(x, y);
}

int math::pow(int x, int n) noexcept
{
    return x^n;
}
