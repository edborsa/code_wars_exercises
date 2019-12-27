def moves(p):
    if p < 25 and p % 5 != 4: yield p + 1
    if p >= 5: yield p - 5
    if p >= 0 and p % 5 != 0: yield p - 1
    if p < 20: yield p + 5

def gerrymander(s):
    so = [1 if c == 'O' else 0 for c in s if c != '\n']
    mp = [0] * 25
    def dfs(pp, p0, k, ko, n, no):
        if k == 5:
            n += 1
            if ko >= 3: no += 1
            if n == 6: return no >= 3
            elif (n != 4 or no > 0) and (n != 5 or no > 1):
                p = mp.index(0)
                mp[p] = n
                if dfs(None, p, 1, so[p], n, no): return True
                mp[p] = 0
            return False
        for p in moves(p0):
            if mp[p] == 0:
                mp[p] = n
                if dfs(p0, p, k + 1, ko + so[p], n, no): return True
                mp[p] = 0
        return pp is not None and dfs(None, pp, k, ko, n, no)
    mp[0] = 1
    return '\n'.join(''.join(map(str, mp[i: i + 5])) for i in range(0, 25, 5)) \
            if dfs(None, 0, 1, so[0], 1, 0) else Noneef moves(p):
    if p < 25 and p % 5 != 4: yield p + 1
    if p >= 5: yield p - 5
    if p >= 0 and p % 5 != 0: yield p - 1
    if p < 20: yield p + 5

def gerrymander(s):
    so = [1 if c == 'O' else 0 for c in s if c != '\n']
    mp = [0] * 25
    def dfs(pp, p0, k, ko, n, no):
        if k == 5:
            n += 1
            if ko >= 3: no += 1
            if n == 6: return no >= 3
            elif (n != 4 or no > 0) and (n != 5 or no > 1):
                p = mp.index(0)
                mp[p] = n
                if dfs(None, p, 1, so[p], n, no): return True
                mp[p] = 0
            return False
        for p in moves(p0):
            if mp[p] == 0:
                mp[p] = n
                if dfs(p0, p, k + 1, ko + so[p], n, no): return True
                mp[p] = 0
        return pp is not None and dfs(None, pp, k, ko, n, no)
    mp[0] = 1
    return '\n'.join(''.join(map(str, mp[i: i + 5])) for i in range(0, 25, 5)) \
            if dfs(None, 0, 1, so[0], 1, 0) else None
