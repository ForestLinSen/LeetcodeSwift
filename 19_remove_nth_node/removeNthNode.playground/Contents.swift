/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

import Foundation

public class ListNode{
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int){
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode){
        self.val = val
        self.next = next
    }
    
}

// Given the head of a linked list, remove the nth node from the end of the list and return its head.

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let dummy = ListNode(-1)
        dummy.next = head
        
        var curr: ListNode? = dummy
        var nth: ListNode? = dummy
        
        for _ in 0..<n{
            curr = curr?.next
            guard curr != nil else { return head}
        }
        
        while curr?.next != nil{
            nth = nth?.next
            curr = curr?.next
        }
        
        nth?.next = nth?.next?.next
        
        return dummy.next
        
    }
}


let s = Solution()
