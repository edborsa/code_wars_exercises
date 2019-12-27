from itertools import count

getRevStep = lambda step: ((step<<2) + (step>>2)) & 15

CONFIG = ((8, -1,0, 'N'), (4, 0,-1, 'W'), (2, 1,0, 'S'), (1, 0,1, 'E'))
SWARM  = [ tuple((step, getRevStep(step), dx, dy, dir) for step,dx,dy,dir in CONFIG if not step & n)
           for n in range(16)]


def maze_solver(arr):
    
    for x,row in enumerate(arr):
        for y,v in enumerate(row):
            if   v=='B': ball = (x,y)
            elif v=='X': end  = (x,y)
    
    bag   = {ball}
    lX,lY = len(arr), len(arr[0])
    paths = [[ [] for _ in range(lY)] for _ in range(lX)]
    
    lastModifiedBagGen = -1
    for nIter in count(0):
        
        for x,y in bag: paths[x][y].append('')                                          
        
        oldBagLen = len(bag)
        while 1:
            addToBag = set()
            for x,y in bag:
                doors = 0 if isinstance(arr[x][y],str) else arr[x][y]
                
                for step,revStep,dx,dy,dir in SWARM[doors]:
                    a, b   = x+dx,y+dy
                    if (0 <= a < lX and 0 <= b < lY                                     
                        and len(paths[a][b]) <= nIter                                   
                        and (isinstance(arr[a][b],str) or not revStep & arr[a][b])):    
                        
                        addToBag.add((a,b))
                        paths[a][b] = paths[x][y][:]
                        paths[a][b][-1] += dir
                        
                        if end == (a,b): return paths[a][b]
            
            if not addToBag: break
            bag |= addToBag
        
        if oldBagLen != len(bag):             lastModifiedBagGen = nIter
        elif nIter - lastModifiedBagGen > 4:  return None
        
        arr  = [[ ((n<<1) + (n>>3)) & 15 if isinstance(n,int) else n for n in row ]
                for row in arr]     
