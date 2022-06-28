import Foundation

class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var maxCount = 0
        var grid = grid
        
        for i in 0..<grid.count{
            for j in 0..<grid[i].count{
                
                if grid[i][j] == 0{
                    continue
                }else{
                    // check the 4-directional number
                    var count = 0
                    area(&grid, i, j, &count)
                    maxCount = max(maxCount, count)
                }
            }
        }
        
        return maxCount
        
    }
    
    
    func area(_ grid: inout [[Int]], _ i: Int, _ j: Int, _ count: inout Int){
        if i < 0 || i >= grid.count || j < 0 || j >= grid[i].count || grid[i][j] != 1{
            return
        }
        
        count += 1
        grid[i][j] = 0
        
        area(&grid, i+1, j, &count)
        area(&grid, i-1, j, &count)
        area(&grid, i, j+1, &count)
        area(&grid, i, j-1, &count)
    }
}


let solver = Solution()

let res = solver.maxAreaOfIsland( [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]])
