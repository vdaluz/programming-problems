# 16. 3Sum Closest
# Solved
# Medium
# Topics
# premium lock iconCompanies

# Given an integer array nums of length n and an integer target, find three integers in nums such that the sum is closest to target.

# Return the sum of the three integers.

# You may assume that each input would have exactly one solution.

 

# Example 1:

# Input: nums = [-1,2,1,-4], target = 1
# Output: 2
# Explanation: The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).

# Example 2:

# Input: nums = [0,0,0], target = 1
# Output: 0
# Explanation: The sum that is closest to the target is 0. (0 + 0 + 0 = 0).

 

# Constraints:

#     3 <= nums.length <= 500
#     -1000 <= nums[i] <= 1000
#     -104 <= target <= 104



def three_sum_closest(nums, target)
    nums.sort!
    closest_sum = nil
    nums.each_with_index do |num, index|
        next if index > 0 && nums[index] == nums[index - 1]
        j = index + 1
        k = nums.length - 1
        while j < k
            sum = num + nums[j] + nums[k]

            return sum if sum == target

            closest_sum = sum if closest_sum.nil? || (sum - target).abs < (closest_sum - target).abs
                
            if sum < target
                j += 1
                j += 1 while nums[j] == nums[j - 1] && j < k
            else
                k -= 1
                k -= 1 while nums[k] == nums[k + 1] && j < k
            end

        end
    end
    closest_sum
end