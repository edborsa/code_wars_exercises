import re

NAME        =  r'[a-zA-Z_]\w*'
NUM         =  r'\d+'
SYMS        =  r'[{}(),]|->'
NAME_OR_NUM = rf'{NAME}|{NUM}'

TOKENIZER = re.compile(r'|'.join((NAME,NUM,SYMS,'.')))

class FatalException(Exception): pass
def FATAL(s): raise FatalException(s)


def transpile(expr):
    expr      = re.sub(r'\s+', ' ', expr)
    i, tokens = 0, TOKENIZER.findall(expr)
    
    #----------------------------------------
    
    def walk():
        nonlocal i
        while taste(' '): i+=1
    
    def eat(what):
        nonlocal i
        if taste(what):
            stuff = tokens[i]
            i += 1
            walk()
            return stuff
        else:
            FATAL(f"Wrong offered token. Expected: '{what}' but got: '{taste(what)}'")

    def taste(what):    return i<len(tokens) and re.match(what, tokens[i]) and tokens[i]
    def isLambda():     return taste(r'{')
    def isNameOrNum():  return taste(NAME_OR_NUM)
    
    #----------------------------------------
    
    def parseFunc():
        hasParams, lst = False, []
        
        name = parseExpr()                                                            # name or lambda
        
        if taste(r'\('):                                                              # normal parameters
            hasParams = True
            lst.extend( parseParams() )
        
        hasLambda = isLambda()                                                        # handle "block like" extra lambda
        if not hasParams and not hasLambda:  FATAL("needs a lambda here")
        if hasLambda:                        lst.append(parseLambda())
        
        if i!=len(tokens): FATAL("invalid string")                                    # validate the end of the string
        
        return f"{name}({','.join(lst)})"
    
    def parseExpr():         return parseLambda() if isLambda() else parseNameOrNumber()
    def parseNameOrNumber(): return eat(NAME_OR_NUM)
    
    def parseParams():
        eat(r'\(')
        lst=[]
        if not taste(r'\)'):
            while 1:
                lst.append( parseExpr() )
                if taste(r'\)'): break
                eat(',')
        eat(r'\)')
        return lst
    
    def parseLambda():
        eat('{')
        params,stat = [], []
        while isNameOrNum():
            params.append( parseNameOrNumber() )
            if taste('->'):
                eat('->') ; break
            if not taste(',') and len(params)==1: 
                params,stat = [],params
                break
            eat(',')
        
        while not taste('}'):
            stat.append( parseNameOrNumber() )
        eat('}')
        
        paramsStr = ','.join(params)
        statStr   = ';'.join(stat) + ';'*bool(stat)
        return f"({paramsStr}){'{'}{statStr}{'}'}"
    
    
    try:
        walk()
        return parseFunc()
    except FatalException as e:
        return ""
