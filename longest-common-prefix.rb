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
    return "" if strs.length == 0
    return strs[0] if strs.length == 1
    
    smallest_str = strs.min_by(&:length)
    max_prefix_length = smallest_str.length
    prefix = ""

    max_prefix_length.times do |i|
        strs.each do |str|
            if str[i] != smallest_str[i]
                return prefix
            end
        end
        prefix += smallest_str[i]
    end

    prefix

end