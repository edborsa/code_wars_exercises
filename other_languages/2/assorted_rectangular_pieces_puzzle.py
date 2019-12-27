from itertools import combinations

def solve_puzzle(board,pieces):
    available = dict()
    for piece in pieces:
        key = tuple(sorted(piece))
        available[key] = available.setdefault(key,0) + 1
    S = {(i,j) for i,r in enumerate(board) for j,c in enumerate(r) if c is '0'}
    global i
    i = 0
    def recurse(available, S, f=lambda k:(k[0]*k[1],available[k]), placements=list()):
        global i
        i += 1
        assert i < 2000
        if not S:
            for hw, (x,y,rotate) in placements:
                hw = list(hw)
                try:
                    i = pieces.index(hw)
                except ValueError:
                    i = pieces.index(list(reversed(hw)))
                    rotate = abs(rotate-1)
                pieces[i] = [x,y,rotate]
            return True
        h,w = k = max(available, key=f)
        n = available[k]
        size = n*h*w
        domain = [((x,y,r),{(x+i, y+j) for i in range(w if r else h) for j in range(h if r else w)})
                  for r in ((0,1) if h!=w else (0,)) for x,y in S]
        domain = [(l,s) for l,s in domain if s<=S]
        for c in combinations(domain,n):
            locs, sets = zip(*c)
            union = set().union(*sets)
            if len(union) == size:
                a_copy = available.copy()
                del a_copy[k]
                res = recurse(a_copy, S-union, f, placements+[(k,l) for l in locs])
                if res:
                    return res
    try:
        recurse(available, S)
    except AssertionError:
        i = 0
        recurse(available, S, lambda x:x)
    return pieces
