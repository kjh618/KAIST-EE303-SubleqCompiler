import sys

Z = '_Z'
NEG_BELL = '_NEG_BELL'
PRINT_INT = '_PRINT_INT'
PRINT_CHAR = '_PRINT_CHAR'

l_num = 1


class Instruction:
    def __init__(self, instruction_str):
        self.opcode = ''
        self.operands = []
        operands_start = instruction_str.find(' ')
        if operands_start != -1:
            self.opcode = instruction_str[:operands_start].strip()
            operands_str = instruction_str[operands_start+1:].strip()
            for operand in operands_str.split(','):
                self.operands.append(operand.strip())
        else:
            self.opcode = instruction_str

    def __str__(self):
        if self.operands == []:
            return f'{self.opcode};'
        else:
            operands_str = ', '.join(self.operands)
            return f'{self.opcode} {operands_str};'

    def is_compiled_instruction(self):
        return self.opcode == 'subleq' or self.opcode == 'data'

    def compiled(self):
        if self.is_compiled_instruction():
            return [str(self)]
        elif self.opcode == 'mov':
            return [
                f'subleq {self.operands[1]}, {self.operands[1]};',
                f'subleq {self.operands[0]}, {Z};',
                f'subleq {Z}, {self.operands[1]};',
                f'subleq {Z}, {Z};'
            ]
        elif self.opcode == 'add':
            return [
                f'subleq {self.operands[0]}, {Z};',
                f'subleq {Z}, {self.operands[1]};',
                f'subleq {Z}, {Z};'
            ]
        elif self.opcode == 'sub':
            return [f'subleq {self.operands[0]}, {self.operands[1]};']
        elif self.opcode == 'jmp':
            return [f'subleq {Z}, {Z}, {self.operands[0]};']
        elif self.opcode == 'jeq':
            global l_num
            result = [
                f'subleq {self.operands[0]}, {Z}, _L{l_num};',
                f'subleq {Z}, {Z}, _L{l_num+1};',
                f'_L{l_num}: subleq {Z}, {Z};',
                f'subleq {Z}, {self.operands[0]}, {self.operands[1]};',
                f'_L{l_num+1}:'
            ]
            l_num += 2
            return result
        elif self.opcode == 'print_int':
            return [
                f'subleq {self.operands[0]}, {Z};',
                f'subleq {Z}, {PRINT_INT};',
                f'subleq {Z}, {Z};'
            ]
        elif self.opcode == 'print_char':
            return [
                f'subleq {self.operands[0]}, {Z};',
                f'subleq {Z}, {PRINT_CHAR};',
                f'subleq {Z}, {Z};'
            ]
        elif self.opcode == 'halt':
            return [f'subleq {NEG_BELL}, {PRINT_CHAR};']
        else:
            return ['*** UNSUPPORTED INSTRUCTION ***']


class ParsedLine:
    def __init__(self, line, line_num):
        self.comment = ''
        self.label = ''
        self.instruction = None
        self.line_num = line_num

        # line = '<label>: <instruction>; // <comment>'

        stripped = line.strip()

        comment_start = stripped.find('//')
        if comment_start != -1:
            self.comment = stripped[comment_start+2:].strip()
            decommented = stripped[:comment_start].strip()
        else:
            decommented = stripped

        label_end = decommented.find(':')
        if label_end != -1:
            self.label = decommented[:label_end].strip()
            delabeled = decommented[label_end+1:].strip()
        else:
            delabeled = decommented

        instruction_end = delabeled.find(';')
        if instruction_end != -1:
            instruction_str = delabeled[:instruction_end].strip()
            self.instruction = Instruction(instruction_str)

    def __str__(self):
        result = f'[Line {line_num}] '
        if self.label != '':
            result += f'{self.label}: '
        if self.instruction != None:
            result += str(self.instruction)
        if self.comment != '':
            result += f' // {self.comment}'
        return result

    def compiled(self):
        result = f'// {str(self)}\n'
        if self.label != '':
            result += f'{self.label}: \n'
        if self.instruction != None:
            result += '\n'.join(self.instruction.compiled()) + '\n'
        return result


print(f'Reading "{sys.argv[1]}"...')
hoasm = open(sys.argv[1], 'r')

print(f'Writing to "{sys.argv[2]}"...')
asm = open(sys.argv[2], 'w')

line_num = 1
for line in hoasm:
    asm.write(ParsedLine(line, line_num).compiled() + '\n')
    line_num += 1
asm.write(f'''
{Z}: data 0;
{NEG_BELL}: data -7;
{PRINT_INT}(-2):
{PRINT_CHAR}(-1):
''')

hoasm.close()
asm.close()
