# You are given two non-empty linked lists representing two non-negative integers.
# The digits are stored in reverse order, and each of their nodes contains a single digit.
# Add the two numbers and return the sum as a linked list.
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
# Example 1:

# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.

# Example 2:

# Input: l1 = [0], l2 = [0]
# Output: [0]

# Example 3:

# Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# Output: [8,9,9,9,0,0,0,1]

# Constraints:

#     The number of nodes in each linked list is in the range [1, 100].
#     0 <= Node.val <= 9
#     It is guaranteed that the list represents a number that does not have leading zeros.

# Solution 1

def add_two_numbers(l1, l2)
  num1 = calculate_int_from_reverse_digit_list(l1)
  num2 = calculate_int_from_reverse_digit_list(l2)
  sum = num1 + num2
  result = ListNode.new
  current = result
  sum_chars = sum.to_s.reverse.chars
  sum_chars.each_with_index do |char, i|
    current.val = char.to_i
    current.next = ListNode.new unless i == sum_chars.length - 1
    current = current.next
  end
  result
end

def calculate_int_from_reverse_digit_list(list_head)
  digits = []
  current = list_head
  until current.nil?
    digits.push(current.val)
    current = current.next
  end
  digits.join('').reverse.to_i
end

# Solution 2

def add_two_numbers(l1, l2)
  result = ListNode.new
  current1 = l1
  current2 = l2
  current_result = result
  carry = 0

  until current_result.nil?
    num1 = current1 ? current1.val : 0
    num2 = current2 ? current2.val : 0

    current1 = current1.next if current1
    current2 = current2.next if current2

    sum = num1 + num2 + carry
    carry = sum / 10
    current_result.val = sum % 10

    if current1.nil? && current2.nil?
      current_result.next = ListNode.new(carry, nil) if carry > 0
      break
    else
      current_result.next = ListNode.new
    end

    current_result = current_result.next
  end

  result
end
