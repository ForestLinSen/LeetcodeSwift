// https://leetcode.com/problems/range-sum-query-immutable/description/

class NumArray {

    let nums: [Int]
    var dp: [Int]
    
    init(_ nums: [Int]) {
        self.nums = nums
        self.dp = Array(repeating: 0, count: nums.count+1)
        dp[0] = 0
        dp[1] = nums[0]
        
        for i in 1...nums.count{
            
            dp[i] = dp[i-1] + nums[i-1]
            print(dp)
        }
        
        
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        return (dp[right+1] - dp[left])
    }
}

/**
 * Your NumArray object will be instantiated and called as such:
 * let obj = NumArray(nums)
 * let ret_1: Int = obj.sumRange(left, right)
 */

let obj = NumArray([-2, 0, 3, -5, 2, -1])
let ret_1: Int = obj.sumRange(2, 5)

// nums: 1 2 3 4 5
// dp: 0 1 3 6 10 15
