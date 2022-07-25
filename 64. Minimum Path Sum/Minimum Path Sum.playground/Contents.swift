// MARK: - Solution 2
class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var res = Array(repeating: Array(repeating: Int.max, count: grid[0].count + 1), count: grid.count + 1)
        res[grid.count-1][grid[0].count] = 0
        
        for i in stride(from: grid.count-1, to: -1, by: -1){
            for j in stride(from: grid[0].count-1, to: -1, by: -1){
                res[i][j] = grid[i][j] + min(res[i+1][j], res[i][j+1])
            }
        }
        
        print(res)
        return res[0][0]
    }
}

let solver2 = Solution()
solver2.minPathSum([[1,2,3],[4,5,6]])


// MARK: - Solution 1
class Solution1 {
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

let solver = Solution1()
solver.minPathSum([[1,2,3],[4,5,6]])
