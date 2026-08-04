class Solution:
    def countPairs(self, arr: list[int], k: int) -> int:
        arr.sort()
        n = len(arr)
        cnt = 0
        i, j = 0, 1
        while j < n:
            if arr[j] - arr[i] < k:
                cnt += (j - i)
                j += 1
            else:
                i += 1
                if i == j:
                    j += 1
        return cnt
