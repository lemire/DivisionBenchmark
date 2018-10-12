#include <stdint.h>
#include <stdbool.h> 
static inline uint32_t rotr32(uint32_t n, uint32_t e) {
  return (n << e) | ( n >> ( (-e)&31) );
}

// does d divide n?
// d = 2**e * d_odd; dbar = multiplicative_inverse(d_odd)
// thresh = 0xffffffff / d
bool gm_divisible(uint32_t n,
    uint32_t e, uint32_t dbar,
    uint32_t thresh) {
  return rotr32(n * dbar, e) <= thresh;
}

