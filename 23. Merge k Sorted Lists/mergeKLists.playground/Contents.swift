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

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var sorted = [Int]()
        
        for list in lists.compactMap({$0}){
            var head: ListNode? = list
            while head != nil{
                sorted.append(head!.val)
                head = head!.next
            }
        }
        sorted.sort()
        
        if(sorted.isEmpty){
            return nil
        }
        
        var node = ListNode(0)
        var curr = ListNode(sorted[0])
        node.next = curr
        
        for value in sorted.dropFirst(){
            let tmp: ListNode? = ListNode(value)
            curr.next = tmp
            if let next = curr.next{
                curr = next
            }
        }
        return node.next
    }
}
