def train_crash(track, a_train, a_train_pos, b_train, b_train_pos, limit):
    n, stops, xings = parse_track(track)
    class train:
        def __init__(self, train, pos):
            self.l = len(train)                                           
            self.d = train[-1].isupper() or -1                            
            self.w = 0                                                    
            self.x = 'X' in train                                         
            self.p = [i%n for i in range(pos,pos-self.l*self.d,-self.d)]  
        def move(self):
            """ Moves the train 1 unit if not waiting"""
            if not self.w: # if not waiting
                self.p = [(self.p[0]+self.d)%n] + self.p[:-1]
                self.w = not self.x and self.p[0] in stops and self.l - 1
            else: self.w -= 1
        def pieces(self):
            """ Returns the set of positions of all pieces"""
            return set(xings.get(i,i) for i in self.p)
    
    a, b = train(a_train,a_train_pos), train(b_train,b_train_pos)
    for i in range(limit+1):
        if len(a.pieces() | b.pieces()) < a.l + b.l: return i
        a.move()
        b.move()
    return -1
    
def parse_track(track):
    """Returns the length of the track, the set of stations, and dict of crossings"""
    pos, stops, xings, path = 0, set(), {}, {}
    rows = track.split('\n')
    T = {(i,j):c for i,r in enumerate(rows) for j,c in enumerate(r) if c!=' '}  
    s = (0, min(j for i,j in T if i==0))                                         
    p, d = (0, s[1]+1), (0, 1)                                                   
    while p != s:
        pos += 1
        if p in path:             
            xings[pos] = path[p]   
        path[p] = pos
        if T[p] == 'S':
            stops.add(pos)
        if T[p] in '/\\': 
            y = T[p]=='\\' or -1
            x = d[0] or d[1]*y
            d = [(i,j) for i,j,k in [(x,0,'|'),(0,x*y,'-'),(x,x*y,T[p]+'SX')] if T.get((p[0]+i,p[1]+j),'!') in k].pop()
        p = (p[0]+d[0],p[1]+d[1]) 
    return (pos+1, stops, xings)
