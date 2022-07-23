class Solution {
    func rob(_ nums: [Int]) -> Int {
        var house1 = 0 // represents n-2
        var house2 = 0 // represents n-1
        // [house1, house2, n, n+1, n+2]
        
        for num in nums{
            var temp = max(num+house1, house2)
            house1 = house2
            house2 = temp
            
        }
        
        return house2
    }
}

let solver = Solution()
solver.rob([2,1,1,2])
