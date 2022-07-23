class Solution {
    func rob(_ nums: [Int]) -> Int {
        
        guard nums.count > 2 else{
            return nums.max()!
        }
        
        return max(rob(nums, 0, nums.count-2), rob(nums, 1, nums.count-1))
    }
    
    func rob(_ nums: [Int], _ start: Int, _ end: Int) -> Int{
        
        var prev2 = 0
        var prev1 = 0
        
        for i in start...end{
            let curr = max(prev2 + nums[i], prev1)
            prev2 = prev1
            prev1 = curr
        }
        
        return prev1
    }
}

let solver = Solution()
solver.rob([2,3,2])
solver.rob([0])
