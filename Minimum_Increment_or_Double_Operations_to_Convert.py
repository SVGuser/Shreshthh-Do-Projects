class Solution:
    def countMinOperations(self, arr):
        n = len(arr)
        res = 0
        max_doubles = 0
        
        for num in arr:
            # Count increments (number of 1s in binary representation)
            while num > 0:
                if num & 1:
                    res += 1
                num >>= 1
                if num > 0:
                    max_doubles = max(max_doubles, num.bit_length())
        
        return res + max_doubles


# Local driver with sample test cases
if __name__ == "__main__":
    test_cases = [
        ([16, 16, 16], 7, "First, increase each element to [1,1,1] (3 steps). "
                          "Then multiply by 2 four times to reach [16,16,16]. "
                          "Total = 3 + 4 = 7."),
        ([2, 3], 4, "Start from [0,0]. Increase both to [1,1] (2 steps). "
                    "Multiply once to [2,2] (1 step). "
                    "Increase second element to [2,3] (1 step). "
                    "Total = 2 + 1 + 1 = 4.")
    ]
    
    ob = Solution()
    for arr, expected, explanation in test_cases:
        result = ob.countMinOperations(arr)
        print(f"Input: arr = {arr}")
        print(f"Output: {result}")
        print(f"Expected: {expected}")
        print(f"Explanation: {explanation}")
        print("-" * 50)