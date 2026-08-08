from collections import defaultdict
class Solution:
    def minEdgesReq(self, n, edges):
        graph = defaultdict(list)
        for u, v in edges:
            graph[u].append(v)
            graph[v].append(u)
        visited = [False] * n
        comp = 0
        def dfs(node):
            stack = [node]
            while stack:
                cur = stack.pop()
                if not visited[cur]:
                    visited[cur] = True
                    for nei in graph[cur]:
                        if not visited[nei]:
                            stack.append(nei)
        for i in range(n):
            if not visited[i]:
                comp += 1
                dfs(i)
        m = len(edges)
        if m < n - 1:
            return -1
        return comp - 1
