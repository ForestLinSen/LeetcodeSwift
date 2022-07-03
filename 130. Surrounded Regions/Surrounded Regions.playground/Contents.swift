// https://leetcode.com/problems/surrounded-regions/

class Solution {
    func solve(_ board: inout [[Character]]) {
        
        guard board.count >= 3, board[0].count >= 3 else { return }
        
        func dfs(_ i: Int, _ j: Int){
            if i<0 || j<0 || i>=board.count || j>=board[0].count || board[i][j] != "O" {
                return
            }
            
            board[i][j] = "M"
            dfs(i+1, j)
            dfs(i-1, j)
            dfs(i, j+1)
            dfs(i, j-1)
        }
        
        // Mark from the edge
        // row
        for col in 0..<board[0].count{
            dfs(0, col) // first row
            dfs(board.count-1, col) // last row
        }
        
        // column
        for row in 0..<board.count{
            dfs(row, 0)
            dfs(row, board[0].count-1)
        }
        
        
        // Turn the remaining O into an X
        for i in 0..<board.count-1{
            for j in 0..<board[0].count-1{
                if board[i][j] == "O"{
                    board[i][j] = "X"
                }
            }
        }
        
        // Turn the marked M into O
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                if board[i][j] == "M"{
                    board[i][j] = "O"
                }
            }
        }
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
