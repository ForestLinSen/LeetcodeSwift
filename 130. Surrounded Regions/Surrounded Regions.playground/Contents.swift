// https://leetcode.com/problems/surrounded-regions/

class Solution {
    func solve(_ board: inout [[Character]]) {
        for r in board.indices{
            for c in board[r].indices where board[r][c] == "O"{
                var curr = board
                if dfs(&curr, r, c){
                    board = curr
                }
            }
        }
    }
    
    
    private func dfs(_ board: inout [[Character]], _ r: Int, _ c: Int) -> Bool{
        if r < 0 || r >= board.count || c < 0 || c >= board[r].count { return false }
        
        // base case
        if board[r][c] == "X" { return true }
        
        board[r][c] = "X"
        
        for (dx, dy) in [(1, 0), (-1, 0), (0, 1), (0, -1)]{
            let nr = r + dx
            let nc = c + dy
            if !dfs(&board, nr, nc){
                return false
            }
        }
        return true
    }
}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        var board: [[Character]] = [["X","X","X","X"],["X","O","O","X"],["X","X","O","X"],["X","O","X","X"]]
        solver.solve(&board)
        XCTAssertEqual(board, [["X","X","X","X"],["X","X","X","X"],["X","X","X","X"],["X","O","X","X"]])
    }
    
    func test1(){
        var board: [[Character]] = [["O","O","O"],["O","O","O"],["O","O","O"]]
        solver.solve(&board)
        XCTAssertEqual(board, [["O","O","O"],["O","O","O"],["O","O","O"]])
    }
}

Test.defaultTestSuite.run()
