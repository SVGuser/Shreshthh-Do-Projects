from collections import Counter

class Solution:
    def transform(self, s1: str, s2: str) -> int:
        if len(s1) != len(s2):
            return -1
        if Counter(s1) != Counter(s2):
            return -1
        
        i, j, c = len(s1) - 1, len(s2) - 1, 0
        while i >= 0 and j >= 0:
            if s1[i] == s2[j]:
                i -= 1
                j -= 1
            else:
                c += 1
                i -= 1
        return c


# --- Test Runner ---
if __name__ == "__main__":
    sol = Solution()
    
    test_cases = [
        # (s1, s2, expected_output, description)
        ("EACBD", "EABCD", 3, "Standard character shifts"),
        ("ABD", "BAD", 1, "Single move needed"),
        ("Geeks", "Geeks", 0, "Identical strings (no moves)"),
        ("ABC", "ABD", -1, "Same length, but not anagrams"),
        ("ABCD", "ABC", -1, "Different lengths")
    ]

    for idx, (s1, s2, expected, desc) in enumerate(test_cases, 1):
        result = sol.transform(s1, s2)
        status = "PASSED" if result == expected else "FAILED"
        print(f"Test Case {idx} ({desc}):")
        print(f"  Inputs: s1 = '{s1}', s2 = '{s2}'")
        print(f"  Expected: {expected} | Got: {result} [{status}]\n")