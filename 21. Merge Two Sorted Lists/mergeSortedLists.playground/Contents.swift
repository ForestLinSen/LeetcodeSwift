class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        
        if list1 == nil {
            return list2
        }else if list2 == nil{
            return list1
        }
        
        var finalResult = ListNode(-1)
        var returnValue = finalResult
        var list1: ListNode? = list1
        var list2: ListNode? = list2
        // boundary checking
        
        
        while(list1 != nil && list2 != nil){
            //print("list1: \(list1!.val); list2: \(list2!.val)")
            if(list1!.val > list2!.val){
                finalResult.next = list2
                finalResult = finalResult.next!
                list2 = list2!.next ?? nil
            }else{
                finalResult.next = list1
                finalResult = finalResult.next!
                list1 = list1!.next ?? nil
            }
        }
        
        if(list1 == nil){
            finalResult.next = list2
        }else if(list2 == nil){
            finalResult.next = list1
        }
        
        return returnValue.next
    }
}
