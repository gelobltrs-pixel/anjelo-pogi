maze = {
    "A": ["B"],
    "B": ["A", "C"],
    "C": ["B", "D"],
    "D": ["A", "C"]
}

start, goal = "A", "D"

frontier = maze[start]   
search_space = list(maze.keys())

print(frontier)
print(search_space)
print(goal in frontier)      



maze = {
"A": ["B", "C"],
"B": ["A", "B", "F"],
"C": ["A", "F"],
"D": ["B"],
"E": ["G"],
"F": ["D", "F"],
"G": ["A"],
}

def bfs_find_maze(maze, start, goal):
queue = deque([[start]])
visited = set()

while queue:
    path = queue.popleft()
    node = path[-1]

    print("Exploring:", path)

    if node == goal:
        return path

        if node not in visited:
            visited.add(node)
for neighbor in maze[node]:
    queue.append(path + [neighbor])

    return None
print(bfs_find_maze(maze, "A", "G"))
