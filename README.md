# Subleq Compiler
Compiles higher-level assembly code to `subleq` instructions.


## Usage
```
>python compiler.py code.hasm code.asm
```
This will compile `code.hasm` file and write the result to `code.asm` file.


## Supported Instructions

| Instruction | Description |
| --- | --- |
| `mov a, b;` | mem[b] = mem[a] |
| `add a, b;` | mem[b] += mem[a] |
| `sub a, b;` | mem[b] -= mem[a] |
| `jmp c;` | jump to c |
| `jeq b, c;` | jmp c if mem[b] == 0 |
| `print_int a;` | print mem[a] as int |
| `print_char a;` | print mem[a] as char |
| `halt;` | halt program |
