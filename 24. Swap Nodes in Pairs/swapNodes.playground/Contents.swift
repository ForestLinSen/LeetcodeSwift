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

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;}
}

    
class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var sorted = [Int]()
        var curr = head
        
        while(curr != nil){
            sorted.append(curr!.val)
            curr = curr!.next
        }
        
        if(sorted.isEmpty){
            return nil
        }
        
        var i = 0
        var j = 1
        
        while(j < sorted.count){
            sorted.swapAt(i, j)
            i += 2
            j += 2
        }
        
        var result = ListNode(-1)
        var helperNode: ListNode? = ListNode(sorted[0])
        result.next = helperNode
        
        for val in sorted.dropFirst(){
            let tmp = ListNode(val)
            helperNode?.next = tmp
            helperNode = helperNode?.next
        }
        
        
        return result.next
        
    }
}
