import Cocoa

public class ListNode {
    
     public var val: Int
     public var next: ListNode?
    
     public init() {
        self.val = 0;
        self.next = nil
     }
    
     public init(_ val: Int) {
        self.val = val
        self.next = nil
     }
    
     public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
     }
    
}

var carry = 0

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    if(l1 == nil && l2 == nil && carry == 0){
        return nil
    }
    
    let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + carry
    carry = sum / 10
    
    return ListNode(sum % 10, addTwoNumbers(l1?.next, l2?.next))
    
}

