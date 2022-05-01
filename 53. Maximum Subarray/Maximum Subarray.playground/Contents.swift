class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }

        var prevSum = nums[0]
        var maxSum = prevSum
        
        for i in 1..<nums.count{
            prevSum = prevSum > 0 ? prevSum + nums[i] : nums[i]
            maxSum = max(prevSum, maxSum)
        }
        
        return maxSum
    }
}
