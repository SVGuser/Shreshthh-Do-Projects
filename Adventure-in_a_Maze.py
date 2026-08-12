MOD = 1_000_000_007
class Solution:
    def solve(self, grid, i, j, dp):
        n = len(grid)
        if i >= n or j >= n:
            return [0, 0]
        if i == n - 1 and j == n - 1:
            return [1, grid[i][j]]
        if dp[i][j]:
            return dp[i][j]
        ans = [0, 0]
        if grid[i][j] == 1:
            right = self.solve(grid, i, j + 1, dp)
            if right[0]:
                ans[0] = right[0]
                ans[1] = right[1] + grid[i][j]
        elif grid[i][j] == 2:
            down = self.solve(grid, i + 1, j, dp)
            if down[0]:
                ans[0] = down[0]
                ans[1] = down[1] + grid[i][j]
        else:
            right = self.solve(grid, i, j + 1, dp)
            down = self.solve(grid, i + 1, j, dp)
            if right[0]:
                ans[0] = right[0]
                ans[1] = right[1] + grid[i][j]
            if down[0]:
                ans[0] = (ans[0] + down[0]) % MOD
                ans[1] = max(ans[1], down[1] + grid[i][j])
        dp[i][j] = ans
        return ans
    def findWays(self, grid):
        n = len(grid)
        dp = [[[] for _ in range(n + 1)] for _ in range(n + 1)]
        return self.solve(grid, 0, 0, dp)
