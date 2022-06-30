class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        
        var count = 0
        var grid = isConnected
        
        for i in 0..<grid.count{
            for j in 0..<grid[0].count{
                if grid[i][j] == 0{
                    continue
                }else{
                    count += 1
                    dfs(&grid, i, j)
                }
            }
        }
        
        
        return count
    }
    
    func dfs(_ grid: inout [[Int]], _ i: Int, _ j: Int){
        if i < 0 || j < 0 || i >= grid.count || j >= grid[0].count || grid[i][j] != 1{
            return
        }
        
        grid[i][j] = 0
        grid[j][i] = 0
        
        dfs(&grid, i-1, j)
        dfs(&grid, i+1, j)
        dfs(&grid, i, j-1)
        dfs(&grid, i, j+1)
    }
}


import XCTest

class Test: XCTestCase{
    let solver = Solution()
    
    func test0(){
        let result = solver.findCircleNum([[1,1,0],[1,1,0],[0,0,1]])
        XCTAssertEqual(result, 2)
    }
    
    func test1(){
        let result = solver.findCircleNum([[1,0,0],[0,1,0],[0,0,1]])
        XCTAssertEqual(result, 3)
    }
    
    func test2(){
        let result = solver.findCircleNum([[1,0,0,1],[0,1,1,0],[0,1,1,1],[1,0,1,1]])
        XCTAssertEqual(result, 1)
    }
}


