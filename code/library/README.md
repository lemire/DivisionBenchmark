# fastmod

A header file for fast 32-bit division remainders  on 64-bit hardware.

##  Usage

```
#include "fastmod.h"

// unsigned...

uint32_t d = ... ; // divisor, should be non-zero
uint64_t M = computeM_u32(d); // do once

fastmod_u32(a,M,d) is a % d for all 32-bit unsigned values a.


// signed...

int32_t d = ... ; // should be non-zero and between [-2147483647,2147483647]
int32_t positive_d = d < 0 ? -d : d; // absolute value
uint64_t M = computeM_s32(d); // do once

fastmod_s32(a,M,positive_d) is a % d for all 32-bit a
```
