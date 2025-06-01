# You are given the heads of two sorted linked lists list1 and list2.

# Merge the two lists into one sorted list. The list should be made by splicing together the nodes of the first two lists.

# Return the head of the merged linked list.

 

# Example 1:

# Input: list1 = [1,2,4], list2 = [1,3,4]
# Output: [1,1,2,3,4,4]

# Example 2:

# Input: list1 = [], list2 = []
# Output: []

# Example 3:

# Input: list1 = [], list2 = [0]
# Output: [0]

 

# Constraints:

#     The number of nodes in both lists is in the range [0, 50].
#     -100 <= Node.val <= 100
#     Both list1 and list2 are sorted in non-decreasing order.

def merge_two_lists(list1, list2)
    return list2 if list1.nil?
    return list1 if list2.nil?

    l1 = list1
    l2 = list2
    merged = []

    if !l1.nil? && (l2.nil? || l1.val <= l2.val)
        merged = l1
        l1 = l1.next
    else
        merged = l2
        l2 = l2.next
    end
    current_node = merged

    while  !l1.nil? && !l2.nil?
        if !l1.nil? && (l2.nil? || l1.val <= l2.val)
                current_node.next = l1
                l1 = l1.next
        else
            current_node.next = l2
            l2 = l2.next
        end
        current_node = current_node.next
    end

    current_node.next = l1 || l2

    merged
end
