// https://leetcode.com/problems/surrounded-regions/

class Solution {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        let columns = board[0].count
        
        guard rows >= 3, columns >= 3 else { return }
        
        func capture(_ row: Int, _ column: Int){
            if row < 0 || row >= rows || column < 0 || column >= columns || board[row][column] != "O"{
                return
            }
            
            board[row][column] = "T"
            
            // using the mark symbol "T"
            let deltas: [(Int, Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
            
            for delta in deltas {
                let newRow = row + delta.0
                let newColumn = column + delta.1
                capture(newRow, newColumn)
            }
        }
        
        // 1. (DFS) Capture unsurrounded regions (O -> T)
        for column in 0..<columns{
            capture(0, column)
            capture(rows-1, column)
        }
        
        for row in 0..<rows{
            capture(row, 0)
            capture(row, columns-1)
        }
        
        // 2. Capture surrounded regions (O -> X)
        for row in 1..<(rows-1){
            for column in 1..<(columns-1){
                if board[row][column] == "O"{
                    board[row][column] = "X"
                }
            }
        }
        
        // 3. Uncapture surrounded regions (T -> O)
        for row in 0..<rows{
            for column in 0..<columns{
                if board[row][column] == "T"{
                    board[row][column] = "O"
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
