import sys

class Solution:
    def minProd(self, arr):
        negative = 0
        product = 1
        largestNegative = -sys.maxsize  # mimic INT_MIN
        hasZero = False
        smallestPositive = sys.maxsize  # mimic INT_MAX

        for x in arr:
            if x < 0:
                negative += 1
                product *= x
                largestNegative = max(largestNegative, x)
            elif x == 0:
                hasZero = True
            else:
                product *= x
                smallestPositive = min(smallestPositive, x)

        if negative == 0:
            return 0 if hasZero else smallestPositive

        if negative % 2 == 1:
            return product

        if negative:
            return product // largestNegative

        return 0


# ---------- Test Cases ----------
sol = Solution()

# 1. Mixed negatives and positives
print(sol.minProd([1, 2, 3]))   # Expected: product = 24 (even negatives → divide by largestNegative = -1 → -24)

# 2. All positives
print(sol.minProd([4, -2, 5]))        # Expected: smallest positive = 2

# 3. Contains zero, no negatives
print(sol.minProd([0, 4, 6]))        # Expected: 4 (smallest positive)

# 4. Single negative
print(sol.minProd([-5]))             # Expected: -5

# 5. Even negatives with zero
print(sol.minProd([-2, -4, 0]))      # Expected: product = 8 (even negatives → divide by largestNegative = -2 → -4)