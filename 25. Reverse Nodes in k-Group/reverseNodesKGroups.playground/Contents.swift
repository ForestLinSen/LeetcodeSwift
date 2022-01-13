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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var sorted = [Int]()
        
        var head = head
        while(head != nil){
            sorted.append(head!.val)
            head = head?.next
        }
        
        if sorted.isEmpty{
            return nil
        }
        
        var i = 0
        var result = [Int]()
        
        if k==1{
            result = sorted
        }else{
            while i < sorted.count{
                var tmp: [Int]

                if(i+k > sorted.count){
                    tmp = Array(sorted[i...sorted.count-1])
                }else{
                    tmp = Array(sorted[i...i+k-1])
                    tmp = tmp.reversed()
                }

                result.append(contentsOf: tmp)
                i = i + k
            }
        }
        
        let final = ListNode(-1)
        var curr: ListNode? = ListNode(result[0])
        final.next = curr
        
        for val in result.dropFirst(){
            let tmp = ListNode(val)
            curr?.next = tmp
            curr = curr?.next
        }
        
        return final.next
    }
}


let n1 = ListNode(1)
let n2 = ListNode(2)
n1.next = n2

let solver = Solution()
solver.reverseKGroup(n1, 2)
