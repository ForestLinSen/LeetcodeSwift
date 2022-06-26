// https://leetcode.com/problems/shortest-path-in-binary-matrix/submissions/

class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        if grid[0][0] == 1{
            return -1
        }
        
        var grid = grid
        
        let row = grid.count
        let column = grid[0].count
        var queue: [(Int, Int)] = [(0, 0)]
        var step = 0
        
        while !queue.isEmpty{
            step += 1
            var size = queue.count
            
            while size > 0{
                let firstMove = queue.removeFirst()
                let rowDirection = firstMove.0
                let colDirection = firstMove.1
                
                if rowDirection == row-1 && colDirection == column - 1{
                    return step
                }
                
                for rowNextMove in max(0, rowDirection-1)...min(rowDirection+1, row-1){
                    for colNextMove in max(0, colDirection-1)...min(colDirection+1, column-1){
                        if grid[rowNextMove][colNextMove] == 0{
                            grid[rowNextMove][colNextMove] = 1
                            queue.append((rowNextMove, colNextMove))
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

