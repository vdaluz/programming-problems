# Given a string s, return the longest palindromic substring in s.
# A substring is a contiguous sequence of characters within the string.
# A palindrome is a string that reads the same backward as forward.
# Example 1:

# Input: s = "babad"
# Output: "bab"
# Explanation: "aba" is also a valid answer.

# Example 2:

# Input: s = "cbbd"
# Output: "bb"

# Constraints:

#     1 <= s.length <= 1000
#     s consist of only digits and English letters.

def longest_palindrome(s)
  return s if s.length <= 1

  longest_palindrome = ''
  longest_palindrome_length = 0

  (0..s.length).each do |i|
     odd = expand_around_center(s,i,i)
     even = expand_around_center(s,i,i+1)

     current_max = [odd, even].max

     if current_max > longest_palindrome_length
          longest_palindrome_length = current_max
          longest_palindrome = s[i - (longest_palindrome_length -1) / 2,longest_palindrome_length]
     end
     
  end
  longest_palindrome
end

def expand_around_center(s, left, right)
while left >= 0 && right < s.length && s[left] == s[right]
  left -= 1
  right += 1
end
right - left - 1
end