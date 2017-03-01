#include <stdint.h>

volatile int16_t x, x1;
volatile int32_t y, y2;
volatile int64_t z, z1;

int main(int argc, char **argv)
{
  x1 = __builtin_bswap16(x);
  y2 = __builtin_bswap32(y);
  z1 = __builtin_bswap64(z);
}
