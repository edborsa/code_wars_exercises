from itertools import count
def num_index(n):
    if(n<10): return n-1
    c = 0
    for i in count(1):
        c += i*9 * 10**(i-1)
        if(n < 10**(i+1)): return c + (i+1)*(n - 10**i)

def find_position(s):
    if not int(s): return num_index(int('1'+s))+1
    for l in range(1,len(s)+1):
        poss = []
        for i in range(0,l+1):
            sdt = s[0:l-i]; end = s[l-i:l]
            for c in ([end+sdt, str(int(end)-1)+sdt] if end and int(end)!=0 else [end+sdt]):
                if(c[0]=='0'): continue
                ds = c; n = int(c)
                while(len(ds) < len(s)+l): n += 1; ds += str(n)
                idx = ds.find(s)
                if(idx != -1): poss.append(num_index(int(c)) + idx)
        if(len(poss) > 0): return min(poss)
