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
        
        guard var head = head, head.next != nil else{
            return nil
        }
        
        var i = 0
        var j = 0
        
        var newHead: ListNode = head
        while(newHead.next != nil){
            newHead = newHead.next!
            i+=1
        }
        
        print("index i: \(i)")
        
        let targetIndex = i-n
        print("target index: \(targetIndex)")
        
        if(targetIndex < 0){
            guard let head = head.next else{
                return nil
            }
            return head
        }
        
        var secondHead: ListNode = head
        while(j != targetIndex){
            secondHead = secondHead.next!
            j+=1
        }
        
        print("index j: \(j)")
        
        // Delete the node
        let toDeleteNode = secondHead.next
        
        secondHead.next = toDeleteNode?.next
        
        print(toDeleteNode?.val)
        return head
        
    }
}

let s = Solution()
