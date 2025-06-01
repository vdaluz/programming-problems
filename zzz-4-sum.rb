# Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

#     0 <= a, b, c, d < n
#     a, b, c, and d are distinct.
#     nums[a] + nums[b] + nums[c] + nums[d] == target

# You may return the answer in any order.

 

# Example 1:

# Input: nums = [1,0,-1,0,-2,2], target = 0
# Output: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]

# Example 2:

# Input: nums = [2,2,2,2,2], target = 8
# Output: [[2,2,2,2]]

 

# Constraints:

#     1 <= nums.length <= 200
#     -109 <= nums[i] <= 109
#     -109 <= target <= 109

# Not solved yet

def four_sum(nums, target)
    nums.sort!
    result = []
    nums.each_with_index do |num_i, i|
        next if i > 0 && nums[i] == nums[i - 1]
        nums[i+1..-1].each_with_index do |num_j_val_from_slice, j_from_slice|
            j = i + j_from_slice -1
            next if j > 0 && nums[j] == nums[j - 1]
            num_j = nums[j]
            half_sum = num_i + num_j
            k = j + 1
            l = nums.length - 1
            while k < l
                sum = half_sum + nums[k] + nums[l]
                if sum == 0
                    result << [nums[i], nums[j], nums[k], nums[l]]
                    k += 1  
                    l -= 1
                    k += 1 while nums[k] == nums[k - 1] && k < l
                    l -= 1 while nums[l] == nums[l + 1] && k < l
                elsif sum < 0
                    k += 1
                else
                    l -= 1
                end
            end
            
        end
    end
    result
end
