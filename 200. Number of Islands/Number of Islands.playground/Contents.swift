class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        
        var grid = grid
        var count = 0
        
        for i in 0..<grid.count{
            for j in 0..<grid[0].count{
                if grid[i][j] == "1"{
                    count += 1
                    dfs(&grid, i, j)
                }
            }
        }
        
        return count
    }
    
    
    func dfs(_ grid: inout [[Character]], _ i: Int, _ j: Int){
        if i < 0 || j < 0 || i >= grid.count || j >= grid[0].count || grid[i][j] == "0"{
            return
        }
        
        grid[i][j] = "0"
        
        dfs(&grid, i, j+1)
        dfs(&grid, i, j-1)
        dfs(&grid, i+1, j)
        dfs(&grid, i-1, j)
    }
    
}


let solver = Solution()
solver.numIslands([
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
  ])
