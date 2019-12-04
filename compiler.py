import sys

class Instruction:
    def __init__(self, arg1, arg2=None):
        self.opcode = ''
        self.operands = []

        if arg2 == None:
            instruction_str = arg1
            operands_start = instruction_str.find(' ')
            if operands_start != -1:
                self.opcode = instruction_str[:operands_start].strip()
                operands_str = instruction_str[operands_start+1:].strip()
                for operand in operands_str.split(','):
                    self.operands.append(operand.strip())
            else:
                self.opcode = instruction_str
        else:
            self.opcode = arg1
            self.operands = arg2

    def __str__(self):
        if self.operands == []:
            return f'{self.opcode};'
        else:
            operands_str = ', '.join(self.operands)
            return f'{self.opcode} {operands_str};'

    def is_compiled_instruction(self):
        return self.opcode == 'subleq' or self.opcode == 'data'

    def to_compiled_instructions(self):
        if self.is_compiled_instruction():
            return [self]
        elif self.opcode == 'add':
            return [
                Instruction('subleq', [self.operands[0], 'Z']),
                Instruction('subleq', ['Z', self.operands[1]]),
                Instruction('subleq', ['Z', 'Z'])
            ]
        elif self.opcode == 'print_int':
            return [
                Instruction('subleq', [self.operands[0], 'Z']),
                Instruction('subleq', ['Z', 'PRINT_INT']),
                Instruction('subleq', ['Z', 'Z'])
            ]
        elif self.opcode == 'halt':
            return [Instruction('subleq', ['NEG_BELL', 'PRINT_CHAR'])]
        else:
            return ['*** UNSUPPORTED INSTRUCTION ***']


class ParsedLine:
    def __init__(self, line):
        self.comment = ''
        self.label = ''
        self.instruction = None

        # '<label>: <instruction>; // <comment>'

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
        result = ''
        if self.label != '':
            result += self.label + ': '
        if self.instruction != None:
            result += str(self.instruction)
        if self.comment != '':
            result += ' // ' + self.comment
        return result

    def compiled(self):
        if self.instruction == None or self.instruction.is_compiled_instruction():
            return str(self)
        else:
            compiled_instructions = self.instruction.to_compiled_instructions()
            return f'// {str(self)}\n' + '\n'.join(map(str, compiled_instructions)) + '\n'


print(f"Reading '{sys.argv[1]}'...")
hoasm = open(sys.argv[1], 'r')

print(f"Writing to '{sys.argv[2]}'...")
asm = open(sys.argv[2], 'w')

for line in hoasm:
    asm.write(ParsedLine(line).compiled() + '\n')
asm.write('''
Z: data 0;
NEG_BELL: data -7;
PRINT_INT(-2):
PRINT_CHAR(-1):
''')

hoasm.close()
asm.close()
