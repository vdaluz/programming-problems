# Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

# Notice that the solution set must not contain duplicate triplets.

 

# Example 1:

# Input: nums = [-1,0,1,2,-1,-4]
# Output: [[-1,-1,2],[-1,0,1]]
# Explanation: 
# nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
# nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
# nums[0] + nums[3] + nums[4] = (-1) + 2 + (-1) = 0.
# The distinct triplets are [-1,0,1] and [-1,-1,2].
# Notice that the order of the output and the order of the triplets does not matter.

# Example 2:

# Input: nums = [0,1,1]
# Output: []
# Explanation: The only possible triplet does not sum up to 0.

# Example 3:

# Input: nums = [0,0,0]
# Output: [[0,0,0]]
# Explanation: The only possible triplet sums up to 0.

 

# Constraints:

#     3 <= nums.length <= 3000
#     -105 <= nums[i] <= 105

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  target = 0
  sorted_nums = nums.sort
  answer = Set.new

  sorted_nums.each_with_index do |num, k|
      two_sum_indexes = two_sum(sorted_nums, target - num, k)
      unless two_sum_indexes.nil?
          x = sorted_nums[two_sum_indexes[0]]
          y = sorted_nums[two_sum_indexes[1]]
          z = num
          answer.add([x, y, z].sort) 
      end
  end

  answer.to_a
end

def two_sum(nums, target, k)
  nums.each_with_index do |num, i|
      j = nums.index(target-num)
      puts [nums[k], num, target - num].join(' ')
      return [i, j] unless j.nil? || (i == j || i == k || j == k)
  end

  nil
end