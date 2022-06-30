class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        
        var count = 0
        var grid = isConnected
        var visited = Array(repeating: false, count: grid.count)
        
        
        for i in 0..<grid[0].count{
            if !visited[i]{
                dfs(&grid, i, &visited)
                count += 1
            }
        }
        
        
        return count
    }
    
    func dfs(_ grid: inout [[Int]], _ i: Int, _ visited: inout [Bool]){
        for j in 0..<grid[i].count{
            if grid[i][j] == 1 && !visited[j]{
                visited[j] = true
                dfs(&grid, j, &visited)
            }
        }
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


Test.defaultTestSuite.run()
