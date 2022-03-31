class Solution {
    func isValidSudokuSlow(_ board: [[Character]]) -> Bool {
        for i in board.indices{
            let rows = board[i].filter{$0 != "."}
            let cols = board.map {$0[i]}.filter{$0 != "."}
            let blockPair = (3 * (i/3), 3 * (i%3))
            let block = board[blockPair.0..<blockPair.0+3].flatMap{$0[blockPair.1..<blockPair.1+3]}.filter{$0 != "."}
            
            if rows.count != Set(rows).count || cols.count != Set(cols).count || block.count != Set(block).count {
                return false
            }
        }
        
        return true
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        let n = board.count
        var rows = Array(repeating: Set<Character>(), count: n)
        var cols = Array(repeating: Set<Character>(), count: n)
        var boxes = Array(repeating: Set<Character>(), count: n)
        
        for row in board.indices{
            for col in board[row].indices{
                let item = board[row][col]
                
                if item == "."{
                    continue
                }
                
                if rows[row].contains(item){
                    return false
                }else{
                    rows[row].insert(item)
                }
                
                if cols[col].contains(item){
                    return false
                }else{
                    cols[col].insert(item)
                }
                
                let boxIndex = row/3 * 3 + col/3
                if boxes[boxIndex].contains(item){
                    return false
                }else{
                    boxes[boxIndex].insert(item)
                }
            }
        }

        return true
    }
    
}

import XCTest

class Tests: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let board: [[Character]] =
        [["5","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
        
        let result = solver.isValidSudoku(board)
        XCTAssertEqual(result, true)
    }
    
    func test1(){
        let board: [[Character]] =
        [["8","3",".",".","7",".",".",".","."]
        ,["6",".",".","1","9","5",".",".","."]
        ,[".","9","8",".",".",".",".","6","."]
        ,["8",".",".",".","6",".",".",".","3"]
        ,["4",".",".","8",".","3",".",".","1"]
        ,["7",".",".",".","2",".",".",".","6"]
        ,[".","6",".",".",".",".","2","8","."]
        ,[".",".",".","4","1","9",".",".","5"]
        ,[".",".",".",".","8",".",".","7","9"]]
        
        let result = solver.isValidSudoku(board)
        XCTAssertEqual(result, false)
    }
    
    func test2(){
        let board: [[Character]] =
        [[".",".",".",".","5",".",".","1","."],
         [".","4",".","3",".",".",".",".","."],
         [".",".",".",".",".","3",".",".","1"],
         ["8",".",".",".",".",".",".","2","."],
         [".",".","2",".","7",".",".",".","."],
         [".","1","5",".",".",".",".",".","."],
         [".",".",".",".",".","2",".",".","."],
         [".","2",".","9",".",".",".",".","."],
         [".",".","4",".",".",".",".",".","."]]
        
        let result = solver.isValidSudoku(board)
        XCTAssertEqual(result, false)
    }
}

Tests.defaultTestSuite.run()
