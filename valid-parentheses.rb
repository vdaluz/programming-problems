# Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

# An input string is valid if:

#     Open brackets must be closed by the same type of brackets.
#     Open brackets must be closed in the correct order.
#     Every close bracket has a corresponding open bracket of the same type.

 

# Example 1:

# Input: s = "()"

# Output: true

# Example 2:

# Input: s = "()[]{}"

# Output: true

# Example 3:

# Input: s = "(]"

# Output: false

# Example 4:

# Input: s = "([])"

# Output: true

 

# Constraints:

#     1 <= s.length <= 104
#     s consists of parentheses only '()[]{}'.

def is_valid(s)
    open_stack = []
    open_parentheses = ["(", "[", "{"]
    closed_parentheses = [")", "]", "}"]
    s.each_char do |c|
        open_index = open_parentheses.find_index(c)
        closed_index = closed_parentheses.find_index(c)
        if !open_index.nil?
            open_stack.push(c)
        elsif !closed_index.nil?
            return false if open_stack.empty?
            return false if open_stack.last != open_parentheses[closed_index]
            open_stack.pop
        else
            return false #Invalid character
        end
    end
    return false unless open_stack.empty?
    true
end
