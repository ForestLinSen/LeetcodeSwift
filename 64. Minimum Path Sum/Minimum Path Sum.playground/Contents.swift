class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        
        if (grid.count == 0 || grid[0].count == 0){
            return 0
        }
        
        var dp: [Int] = Array(repeating: 0, count: grid[0].count)
        
        for i in 0..<grid.count{
            for j in 0..<grid[0].count{
                if j == 0{ // only arrive the location from the top
                    dp[j] = dp[j]
                }else if i == 0{
                    dp[j] = dp[j-1] // only arrive the location from the left
                }else{
                    dp[j] = min(dp[j-1], dp[j])
                }
                
                dp[j] += grid[i][j]
            }
        }
        
        return dp[grid[0].count-1]
    }
}

let solver = Solution()
solver.minPathSum([[1,2,3],[4,5,6]])
