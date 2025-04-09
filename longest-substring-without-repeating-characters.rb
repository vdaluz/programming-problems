# Given a string s, find the length of the longest

# without duplicate characters.

 

# Example 1:

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# Example 2:

# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Example 3:

# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


# Constraints:

#     0 <= s.length <= 5 * 104
#     s consists of English letters, digits, symbols and spaces.

def length_of_longest_substring(s)
  seen_chars = {}
  longest_substring_length = 0
  window_start = 0
  
  s.each_char.with_index do |c, window_end|
      current_substring_length = window_end - window_start + 1
      if seen_chars.key?(c) && seen_chars[c] >= window_start
          current_substring_length -= 1
          window_start = seen_chars[c] + 1
      end
      longest_substring_length = [longest_substring_length, current_substring_length].max
      seen_chars[c] = window_end
  end

  longest_substring_length
end