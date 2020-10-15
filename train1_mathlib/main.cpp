#include "mymath.h"

#include <iostream>

int main(void)
{
    std::cout << "Math: add(2, 3) = " << mymath::plus(2, 3) << "\n";
    std::cout << "Math: substract(5, 3) = " << mymath::minus(5, 3) << "\n";
    std::cout << "Math: pow(2, 2) = " << mymath::pow(2, 2) << "\n";    
}