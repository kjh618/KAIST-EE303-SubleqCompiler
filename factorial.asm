// [Line 1] loop: 
loop: 

// [Line 2] mov result, multiply_a;
subleq multiply_a, multiply_a;
subleq result, _Z;
subleq _Z, multiply_a;
subleq _Z, _Z;

// [Line 3] mov a, multiply_b;
subleq multiply_b, multiply_b;
subleq a, _Z;
subleq _Z, multiply_b;
subleq _Z, _Z;

// [Line 4] sub one, a;
subleq one, a;

// [Line 5] jmp multiply;
subleq _Z, _Z, multiply;

// [Line 6] multiply_return: 
multiply_return: 

// [Line 7] mov multiply_result, result;
subleq result, result;
subleq multiply_result, _Z;
subleq _Z, result;
subleq _Z, _Z;

// [Line 8] jeq a, finish;
subleq a, _Z, _L1;
subleq _Z, _Z, _L2;
_L1: subleq _Z, _Z;
subleq _Z, a, finish;
_L2:

// [Line 9] jmp loop;
subleq _Z, _Z, loop;

// [Line 10] 

// [Line 11] finish: 
finish: 

// [Line 12] print_int result;
subleq result, _Z;
subleq _Z, _PRINT_INT;
subleq _Z, _Z;

// [Line 13] halt;
subleq _NEG_BELL, _PRINT_CHAR;

// [Line 14] 

// [Line 15] multiply: 
multiply: 

// [Line 16] mov zero, multiply_result;
subleq multiply_result, multiply_result;
subleq zero, _Z;
subleq _Z, multiply_result;
subleq _Z, _Z;

// [Line 17] multiply_loop: 
multiply_loop: 

// [Line 18] add multiply_a, multiply_result;
subleq multiply_a, _Z;
subleq _Z, multiply_result;
subleq _Z, _Z;

// [Line 19] sub one, multiply_b;
subleq one, multiply_b;

// [Line 20] jeq multiply_b, multiply_return;
subleq multiply_b, _Z, _L3;
subleq _Z, _Z, _L4;
_L3: subleq _Z, _Z;
subleq _Z, multiply_b, multiply_return;
_L4:

// [Line 21] jmp multiply_loop;
subleq _Z, _Z, multiply_loop;

// [Line 22] 

// [Line 23] a: data 5;
a: 
data 5;

// [Line 24] result: data 1;
result: 
data 1;

// [Line 25] multiply_a: data 0;
multiply_a: 
data 0;

// [Line 26] multiply_b: data 0;
multiply_b: 
data 0;

// [Line 27] multiply_result: data 0;
multiply_result: 
data 0;

// [Line 28] 

// [Line 29] zero: data 0;
zero: 
data 0;

// [Line 30] one: data 1;
one: 
data 1;


_Z: data 0;
_NEG_BELL: data -7;
_PRINT_INT(-2):
_PRINT_CHAR(-1):
