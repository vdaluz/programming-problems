# Write a function to find the longest common prefix string amongst an array of strings.

# If there is no common prefix, return an empty string "".

 

# Example 1:

# Input: strs = ["flower","flow","flight"]
# Output: "fl"

# Example 2:

# Input: strs = ["dog","racecar","car"]
# Output: ""
# Explanation: There is no common prefix among the input strings.

 

# Constraints:

#     1 <= strs.length <= 200
#     0 <= strs[i].length <= 200
#     strs[i] consists of only lowercase English letters if it is non-empty.


# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
    
  prefix = []
  index = 0
  continue = true

  while continue

      current_char = strs[0][index]
      break if current_char.nil?
      strs.each do |str|
          if str[index] != current_char
              continue = false
              break
          end
      end
      prefix << current_char if continue
      index += 1

  end

  prefix.join

end