class Solution {
    func climbStairs(_ n: Int) -> Int {
        var dp: [Int: Int] = [1: 1,
                              2: 2]
        
        if let res = dp[n] { return res }
        
        for i in 3...n{
            dp[i] = dp[i-1]! + dp[i-2]!
        }
        
        return dp[n]!
    }
}

let solver = Solution()
solver.climbStairs(20)


// MARK: - Backtracking
class Solution2 {
    func climbStairs(_ n: Int) -> Int {
        var count = 0
        
        func backtracking(_ sum: inout Int){
            if sum == n {
                count += 1
                return
            }else if sum > n{
                return
            }
            
            for step in [1, 2]{
                sum += step
                backtracking(&sum)
                sum -= step
            }
        }
        
        var sum = 0
        backtracking(&sum)
        
        return count
    }
}


