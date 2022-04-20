/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        
        while slow != nil && fast != nil{
            guard slow !== fast else { return true}
            
            fast = fast?.next?.next
            slow = slow?.next
        }
        
        return false
    }
}
