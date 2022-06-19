class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        
        while low <= high{
            let mid = low + (high - low)/2
            
            if nums[mid] == nums[mid-1]{
                if mid%2 == 0{
                    
                }else{
                    high = mid-2
                }
            }else if nums[mid] == nums[mid+1]{
                
            }else{
                return mid
            }
            
        }
    }
}
