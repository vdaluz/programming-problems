# Given the head of a linked list, remove the nth node from the end of the list and return its head.

 

# Example 1:

# Input: head = [1,2,3,4,5], n = 2
# Output: [1,2,3,5]

# Example 2:

# Input: head = [1], n = 1
# Output: []

# Example 3:

# Input: head = [1,2], n = 1
# Output: [1]

 

# Constraints:

#     The number of nodes in the list is sz.
#     1 <= sz <= 30
#     0 <= Node.val <= 100
#     1 <= n <= sz

 

# Follow up: Could you do this in one pass?

def remove_nth_from_end(head, n)

    list = ListNode.new(0)
    list.next = head
    fast = list
    slow = list
    (n+1).times do
        fast = fast.next
    end

    while !fast.nil?
        fast = fast.next
        slow = slow.next
    end

    slow.next = slow.next.next

    list.next

end
