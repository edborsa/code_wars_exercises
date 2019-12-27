class State:
    DIRECTIONS = [
        ('Left', -1, 0),
        ('Up', 0, -1),
        ('Right', 1, 0),
        ('Down', 0, 1),
    ]

    def __init__(self, plan, starts, moves=None):
        self.plan = plan
        self.starts = starts
        self.moves = moves or []

    @staticmethod
    def parse_state(game_map):
        plan = [
            [
                0 if c == '.' else 1
                for c in row
                if c not in '|-+'
            ]
            for row in game_map.split('\n')
            if row.strip()
        ]
        plan = [r for r in plan if r]
        starts = [
            (x, y)
            for y, row in enumerate(plan)
            for x, c in enumerate(row)
            if c != 0
        ]
        for i, (x, y) in enumerate(starts, 1):
            plan[y][x] = i
        return State(plan, starts)

    def walk(self, start, direction):
        direction_name, dx, dy = self.DIRECTIONS[direction]
        new_plan = [list(row) for row in self.plan]
        x, y = start
        colour = new_plan[y][x]
        steps, moves = 0, 0
        while True:
            nx, ny = x + dx, y + dy
            if (
                    0 <= ny < len(new_plan) and
                    0 <= nx < len(new_plan[ny]) and
                    new_plan[ny][nx] == 0
            ):
                new_plan[ny][nx] = colour
                steps += 1
                moves += 1
                x, y = nx, ny
            else:
                direction = (direction + 1) % 4
                direction_name, dx, dy = self.DIRECTIONS[direction]
                if steps == 0:
                    break
                steps = 0

        if moves == 0:
            return None
        return new_plan

    def solve(self):
        if not self.starts and min(x for row in self.plan for x in row) > 0:
            yield self
        else:
            for i in range(len(self.starts)):
                start = self.starts[i]
                other_starts = [p for j, p in enumerate(self.starts) if j != i]
                for j in range(len(self.DIRECTIONS)):
                    new_plan = self.walk(start, j)
                    if new_plan is None:
                        continue
                    move = [start[1], start[0], self.DIRECTIONS[j][0]]
                    new_moves = self.moves + [move]
                    yield from State(new_plan, other_starts, new_moves).solve()

    def play_flou(game_map):
        initial_state = State.parse_state(game_map)
        for solution_state in initial_state.solve():
            return solution_state.moves
        return False
