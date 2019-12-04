// add a, b; // b += a
subleq a, Z;
subleq Z, b;
subleq Z, Z;

// print_int b;
subleq b, Z;
subleq Z, PRINT_INT;
subleq Z, Z;

// halt;
subleq NEG_BELL, PRINT_CHAR;


a: data 42;
b: data 7;

Z: data 0;
NEG_BELL: data -7;
PRINT_INT(-2):
PRINT_CHAR(-1):
