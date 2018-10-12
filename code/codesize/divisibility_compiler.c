#include <stdint.h>
#include <stdbool.h> 
bool isdivisible(uint32_t x) {
    return (x % DIVISOR) == 0;
}
