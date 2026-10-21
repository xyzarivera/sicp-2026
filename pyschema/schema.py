# scheme.py
#
# Challenge: Can you implement a scheme interpreter in Python that's
# capable of executing the following procedure?

# A procedure definition for:
#
#   (define fact
#      (lambda (n) (if (= n 1)
#                   1
#                   (* n (fact (- n 1))))))
#
# It's represented in Python using the following tuple:

fact = ('define', 'fact',
        ('lambda', ('n',), ('if', ('=', 'n', 1),
                            1,
                            ('*', 'n', ('fact', ('-', 'n', 1))))))


ENVIRONMENT = {}

OPERATORS = {
    '+': lambda x, y: eval(x) + eval(y),
    '-': lambda x, y: eval(x) - eval(y),
    '*': lambda x, y: eval(x) * eval(y),
    '/': lambda x, y: eval(x) / eval(y),
    '=': lambda x, y: eval(x) == eval(y),
    'if': lambda x, y, z: y if x else z,
}

def is_primitive(exp):
    if type(exp) == int:
        return True
    if type(exp) == float:
        return True
    return False

def is_operator(exp):
    if type(exp) != tuple:
        return False
    if exp[0] in OPERATORS:
        return True
    return False

def apply_to_all(func, args):
    return list(map(func, args))

def applyOperator(exp):
    op, *args = exp


    return eval(OPERATORS[op](*args))

def is_define(exp):
    if type(exp) != tuple:
        return False
    if exp[0] == 'define':
        return True
    return False

def define(exp):
    _, name, value = exp
    ENVIRONMENT.update({name: value})
    print('define', ENVIRONMENT[name])
    return

def is_variable(exp):
    op, *args = exp
    if type(op) == str:
        return True
    return False

def lookup(exp):
    op, *args = exp
    print('lookup', op, ENVIRONMENT[op])
    return eval(ENVIRONMENT[op])

def is_boolean(exp):
    if type(exp) == bool:
        return True
    return False

def is_lambda(exp):
    if type(exp) != tuple:
        return False
    print('is_lambda', exp[0])
    # assuming a tuple will be a lambda expression
    return True

def apply_lambda(exp):
    func, arg= exp
    print('apply_lambda', func, arg)
    return eval(func)(eval(arg))

# You will define the following procedure for evaluating an expression
def eval(exp):
    print('eval', exp)
    if is_primitive(exp):
        return exp
    if is_define(exp):
        return define(exp)
    if is_operator(exp):
        return applyOperator(exp)
    if is_variable(exp):
        return lookup(exp)
    if is_lambda(exp):
        return apply_lambda(exp)

    (print('unknown'))
    return KeyError('Unknown expression')

# In writing eval, you are ONLY allowed to use the rules of Scheme
# evaluation that you currently know about.  So far, this includes the
# substitution model and the notion of special forms.

# Some basic tests

# primitive
# assert eval(42) == 42

# builtin operators
# assert eval(('+', 2, 3)) == 5

# define
# eval(('define', 'n', 5))
# assert eval('n') == 5

# nested expressions
# assert eval(('+', 2, ('*', 3, 4))) == 14

# if
# assert eval(('if', True, 1, 2)) == 1
#assert eval(('if', False, 1, 2)) == 2

# lambda application
assert eval((("lambda", ("x",), ("+", "x", 1)), 3)) == 4

# consider adding some more tests here,
# eg if, nested expressions, lambdas

# Now the ultimate test--can you run your procedure?
# eval(fact)
#assert eval(('fact', 'n')) == 120
