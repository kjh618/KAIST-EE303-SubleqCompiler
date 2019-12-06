// [Line 1] add a, b; // b += a
subleq a, _Z;
subleq _Z, b;
subleq _Z, _Z;

// [Line 2] print_int b;
subleq b, _Z;
subleq _Z, _PRINT_INT;
subleq _Z, _Z;

// [Line 3] halt;
subleq _NEG_BELL, _PRINT_CHAR;

// [Line 4] 

// [Line 5] a: data 42;
a: 
data 42;

// [Line 6] b: data 7;
b: 
data 7;


_Z: data 0;
_NEG_BELL: data -7;
_PRINT_INT(-2):
_PRINT_CHAR(-1):
