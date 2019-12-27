from operator import mul, truediv as div, add, sub
decoding = {2: mul, 3: div, 1: sub, 0: add, 4: mul}
encoding = {"(": 6, ")": -6, "+": 0, "#": 1, "*": 2, "/": 3, "-": 4}


def evaluation(numbers, operators):
    if len(operators) == 0:
        return numbers[0]
    sequence = [int(_/2) for _ in operators]
    sequence.reverse()
    i = len(sequence)-sequence.index(min(sequence))-1
    min_operator = operators[i] % 6
    a = evaluation(numbers[0:i+1],
                   operators[0:i])
    b = evaluation(numbers[i+1:],
                   operators[i+1:])
    return decoding[min_operator](a, b)


def calc(expression):
    numbers = []
    operators = []
    bracket_adding = 0
    num = ""
    expression = expression.replace(" ", "")
    for i in "0987654321.)":
        expression = expression.replace(i+"-", i+"#")
    for i in expression:
        if i in "0987654321.":
            num = num+i
        else:
            if len(num) > 0:
                numbers.append(float(num))
                num = ""
            if i in "()":
                bracket_adding += encoding[i]
            if i in "+-*/#":
                operators.append(bracket_adding+encoding[i])
                if i == "-":
                    numbers.append(-1)
    if len(num) > 0:
        numbers.append(float(num))
    return evaluation(numbers, operators)
