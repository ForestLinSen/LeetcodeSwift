class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        if grid[0][0] != 0{
            return -1
        }
        
        var grid = grid
        let m = grid.count // row
        let n = grid[0].count // column
        var q: [(Int, Int)] = [] // Queue (pair)
        q.append((0, 0))
        var step = 0
        
        while !q.isEmpty{
            step += 1
            var size = q.count // ??
            while(size > 0){
                let top = q.removeFirst()
                let r = top.0
                let c = top.1
                
                if r == m-1 && c == n-1{ // reach the end
                    return step
                }
                
                // one step each time (n-1) - (n) - (n+1)
                for nr in max(0, r-1)...min(m-1, r+1){
                    for nc in max(0, c-1)...min(n-1, c+1){
                        if grid[nr][nc] == 0{
                            grid[nr][nc] = 1
                            q.append((nr, nc))
                        }
                    }
                }
                size -= 1
            }
        }
        
        return -1
    }
}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.shortestPathBinaryMatrix([[0,0,0],[1,1,0],[1,1,0]])
        XCTAssertEqual(result, 4)
    }
    
    func test1(){
        let result = solver.shortestPathBinaryMatrix([[1,0,0],[1,1,0],[1,1,0]])
        XCTAssertEqual(result, -1)
    }
}

Test.defaultTestSuite.run()

