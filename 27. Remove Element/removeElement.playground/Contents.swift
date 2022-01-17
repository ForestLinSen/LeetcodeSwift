class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        if nums.isEmpty{
            return 0
        }
        
        var count = 0
        var i = 0
        
        for x in nums{
            if x == val {
                nums.remove(at: i-count)
                count += 1
            }
            
            i += 1
        }
        
        print(nums)
        return nums.count
    }
}

let solver = Solution()
// var nums = [0,1,2,2,3,0,4,2]
var nums = [Int]()
solver.removeElement(&nums, 2)
