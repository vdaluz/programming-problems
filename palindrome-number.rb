# Given an integer x, return true if x is a

# , and false otherwise.

 

# Example 1:

# Input: x = 121
# Output: true
# Explanation: 121 reads as 121 from left to right and from right to left.

# Example 2:

# Input: x = -121
# Output: false
# Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.

# Example 3:

# Input: x = 10
# Output: false
# Explanation: Reads 01 from right to left. Therefore it is not a palindrome.

 

# Constraints:

#     -231 <= x <= 231 - 1

 
# Follow up: Could you solve it without converting the integer to a string?

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0
  return true if x < 10

  next_x = x
  magnitude = Math.log(next_x, 10).floor

  while magnitude > 0
      first_digit = next_x / 10 ** magnitude
      last_digit = next_x % 10
      return false unless first_digit == last_digit
      return true if magnitude.between?(1,2)

      next_x = (next_x / 10) % (10 ** (magnitude - 1))
      magnitude -= 2
  end

  return true
end