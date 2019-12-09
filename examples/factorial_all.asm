// [Line 1]  // Main Routine

// [Line 2] loop: 
loop: 

// [Line 3] 

// [Line 4] mov n, factorial_n;
subleq factorial_n, factorial_n;
subleq n, _Z;
subleq _Z, factorial_n;
subleq _Z, _Z;

// [Line 5] jmp factorial;
subleq _Z, _Z, factorial;

// [Line 6] factorial_return: 
factorial_return: 

// [Line 7] mov factorial_result, result;
subleq result, result;
subleq factorial_result, _Z;
subleq _Z, result;
subleq _Z, _Z;

// [Line 8] 

// [Line 9]  // "n! = result"

// [Line 10] print_int n;
subleq n, _Z;
subleq _Z, _PRINT_INT;
subleq _Z, _Z;

// [Line 11] print_char BANG;
subleq BANG, _Z;
subleq _Z, _PRINT_CHAR;
subleq _Z, _Z;

// [Line 12] print_char SPACE;
subleq SPACE, _Z;
subleq _Z, _PRINT_CHAR;
subleq _Z, _Z;

// [Line 13] print_char EQUALS;
subleq EQUALS, _Z;
subleq _Z, _PRINT_CHAR;
subleq _Z, _Z;

// [Line 14] print_char SPACE;
subleq SPACE, _Z;
subleq _Z, _PRINT_CHAR;
subleq _Z, _Z;

// [Line 15] print_int result;
subleq result, _Z;
subleq _Z, _PRINT_INT;
subleq _Z, _Z;

// [Line 16] print_char ENTER;
subleq ENTER, _Z;
subleq _Z, _PRINT_CHAR;
subleq _Z, _Z;

// [Line 17] 

// [Line 18] sub ONE, n;
subleq ONE, n;

// [Line 19] jeq n, finish;
subleq n, _Z, _L1;
subleq _Z, _Z, _L2;
_L1: subleq _Z, _Z;
subleq _Z, n, finish;
_L2:

// [Line 20] jmp loop;
subleq _Z, _Z, loop;

// [Line 21] 

// [Line 22] finish: 
finish: 

// [Line 23] halt;
subleq _NEG_BELL, _PRINT_CHAR;

// [Line 24] 

// [Line 25] 

// [Line 26]  // Function: factorial_result = factorial(factorial_n)

// [Line 27] factorial: 
factorial: 

// [Line 28] mov ONE, factorial_result;
subleq factorial_result, factorial_result;
subleq ONE, _Z;
subleq _Z, factorial_result;
subleq _Z, _Z;

// [Line 29] 

// [Line 30] factorial_loop: 
factorial_loop: 

// [Line 31] 

// [Line 32] mov factorial_result, multiply_a;
subleq multiply_a, multiply_a;
subleq factorial_result, _Z;
subleq _Z, multiply_a;
subleq _Z, _Z;

// [Line 33] mov factorial_n, multiply_b;
subleq multiply_b, multiply_b;
subleq factorial_n, _Z;
subleq _Z, multiply_b;
subleq _Z, _Z;

// [Line 34] jmp multiply;
subleq _Z, _Z, multiply;

// [Line 35] multiply_return: 
multiply_return: 

// [Line 36] 

// [Line 37] mov multiply_result, factorial_result;
subleq factorial_result, factorial_result;
subleq multiply_result, _Z;
subleq _Z, factorial_result;
subleq _Z, _Z;

// [Line 38] 

// [Line 39] sub ONE, factorial_n;
subleq ONE, factorial_n;

// [Line 40] jeq factorial_n, factorial_return;
subleq factorial_n, _Z, _L3;
subleq _Z, _Z, _L4;
_L3: subleq _Z, _Z;
subleq _Z, factorial_n, factorial_return;
_L4:

// [Line 41] jmp factorial_loop;
subleq _Z, _Z, factorial_loop;

// [Line 42] 

// [Line 43] 

// [Line 44]  // Function: multiply_result = multiply(multiply_a, multiply_b)

// [Line 45] multiply: 
multiply: 

// [Line 46] mov ZERO, multiply_result;
subleq multiply_result, multiply_result;
subleq ZERO, _Z;
subleq _Z, multiply_result;
subleq _Z, _Z;

// [Line 47] 

// [Line 48] multiply_loop: 
multiply_loop: 

// [Line 49] add multiply_a, multiply_result;
subleq multiply_a, _Z;
subleq _Z, multiply_result;
subleq _Z, _Z;

// [Line 50] sub ONE, multiply_b;
subleq ONE, multiply_b;

// [Line 51] jeq multiply_b, multiply_return;
subleq multiply_b, _Z, _L5;
subleq _Z, _Z, _L6;
_L5: subleq _Z, _Z;
subleq _Z, multiply_b, multiply_return;
_L6:

// [Line 52] jmp multiply_loop;
subleq _Z, _Z, multiply_loop;

// [Line 53] 

// [Line 54] 

// [Line 55]  // Variables

// [Line 56] result: data 0;
result: 
data 0;

// [Line 57] n: data 5;
n: 
data 5;

// [Line 58] 

// [Line 59] factorial_n: data 0;
factorial_n: 
data 0;

// [Line 60] factorial_result: data 0;
factorial_result: 
data 0;

// [Line 61] 

// [Line 62] multiply_a: data 0;
multiply_a: 
data 0;

// [Line 63] multiply_b: data 0;
multiply_b: 
data 0;

// [Line 64] multiply_result: data 0;
multiply_result: 
data 0;

// [Line 65] 

// [Line 66] 

// [Line 67]  // Constants

// [Line 68] ZERO: data 0;
ZERO: 
data 0;

// [Line 69] ONE: data 1;
ONE: 
data 1;

// [Line 70] BANG: data '!';
BANG: 
data '!';

// [Line 71] SPACE: data ' ';
SPACE: 
data ' ';

// [Line 72] EQUALS: data '=';
EQUALS: 
data '=';

// [Line 73] ENTER: data '\n';
ENTER: 
data '\n';


_Z: data 0;
_NEG_BELL: data -7;
_PRINT_INT(-2):
_PRINT_CHAR(-1):
