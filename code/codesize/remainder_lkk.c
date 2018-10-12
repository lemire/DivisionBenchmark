#include <stdint.h>
uint32_t d = DIVISOR;// your divisor > 0
// c = ceil( (1<<64) / d ) ; we take L = N
uint64_t c = UINT64_C(0xFFFFFFFFFFFFFFFF) / DIVISOR + 1;

uint32_t fastmod(uint32_t n) {
  uint64_t lowbits = c * n;
  return ((__uint128_t)lowbits * d) >> 64;
}