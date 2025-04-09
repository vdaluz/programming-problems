# Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

# Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

 

# Example 1:

# Input: x = 123
# Output: 321

# Example 2:

# Input: x = -123
# Output: -321

# Example 3:

# Input: x = 120
# Output: 21

 

# Constraints:

#     -231 <= x <= 231 - 1

def reverse(x)
  return x if x.between?(-9,9)

  signed_integer_min, signed_integer_max = -2**31, 2**31 - 1
  is_negative = x.negative?
  x *= -1 if is_negative
  answer = x.digits
  answer.unshift('-') if is_negative
  answer = answer.join.to_i
  answer = 0 unless answer.between?(signed_integer_min, signed_integer_max)
  answer
end
