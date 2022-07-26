class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        dp[0][0] = 1
        
        for i in 0..<m{
            for j in 0..<n{
                if i == 0 || j == 0{
                    dp[i][j] = 1
                }else{
                    dp[i][j] = dp[i-1][j] + dp[i][j-1]
                }
            }
        }
        
        return dp[m-1][n-1]
    }
}

let solver = Solution()
solver.uniquePaths(3, 2)
