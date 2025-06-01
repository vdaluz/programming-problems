# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 

# Example 1:

# Input: n = 3
# Output: ["((()))","(()())","(())()","()(())","()()()"]

# Example 2:

# Input: n = 1
# Output: ["()"]

 

# Constraints:

#     1 <= n <= 8

def generate_parenthesis(n)
    return [] if n <= 0

    result = []
    generate_parentheses_combinations(n, n, "", result)
    result
end

def generate_parentheses_combinations(opened, closed, current_combination, result)
    return result << current_combination if opened == 0 && closed == 0
    return if opened < 0 || closed < 0 || closed < opened

   if opened > 0
    generate_parentheses_combinations(opened-1, closed, current_combination+'(', result)
   end

   if closed > 0
    generate_parentheses_combinations(opened, closed-1, current_combination+')', result) 
   end
end
