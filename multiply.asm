// [Line 1] loop: 
loop: 

// [Line 2] add a, result; // result += a
subleq a, _Z;
subleq _Z, result;
subleq _Z, _Z;

// [Line 3] sub one, b; // b--
subleq one, b;

// [Line 4] jeq b, finish; // jmp finish if b == 0
subleq b, _Z, _L1;
subleq _Z, _Z, _L2;
_L1: subleq _Z, _Z;
subleq _Z, b, finish;
_L2:

// [Line 5] jmp loop;
subleq _Z, _Z, loop;

// [Line 6] 

// [Line 7] finish: 
finish: 

// [Line 8] print_int result;
subleq result, _Z;
subleq _Z, _PRINT_INT;
subleq _Z, _Z;

// [Line 9] halt;
subleq _NEG_BELL, _PRINT_CHAR;

// [Line 10] 

// [Line 11] a: data 42;
a: 
data 42;

// [Line 12] b: data 7;
b: 
data 7;

// [Line 13] result: data 0;
result: 
data 0;

// [Line 14] 

// [Line 15] zero: data 0;
zero: 
data 0;

// [Line 16] one: data 1;
one: 
data 1;


_Z: data 0;
_NEG_BELL: data -7;
_PRINT_INT(-2):
_PRINT_CHAR(-1):
