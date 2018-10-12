#include <stdint.h>
#include <stdbool.h>


// given precomputed c, checks whether n % d == 0
bool lkk_divisible(uint32_t n,
    uint64_t c) {
  // rhs is large when m==0
  return n * c <= c - 1;
}

