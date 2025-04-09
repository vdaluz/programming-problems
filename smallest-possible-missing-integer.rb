# Write a function:

#     def solution(a)

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

#         N is an integer within the range [1..100,000];
#         each element of array A is an integer within the range [−1,000,000..1,000,000].

def solution(a)
  options = a.uniq.sort
  previous = options.first
  return 1 if previous > 1 || options.last <= 0

  result = options.last + 1

  options[1, options.count].each do |current|
    if current - previous > 1
      result = previous + 1
      break
    else
      previous = current
    end
  end
  
  result

end