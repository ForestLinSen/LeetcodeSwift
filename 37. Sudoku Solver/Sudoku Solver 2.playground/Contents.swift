
//let row = 8
//let col = 0
//
//for i in 0...8{
//    let startRow = (row/3) * 3
//    let startCol = (col/3) * 3
//
//    print(startRow + i/3, startCol + i%3)
//
//}

// i/3 means we don't want the position to move within 3 steps: 0 0 0 1 1 1 2 2 2
// i%3 means we want to limit the position within 3 steps: 0 1 2 0 1 2 0 1 2


class Solution {
    

    func solveSudoku(_ board: inout [[Character]]) {
        guard board.count != 0 || board[0].count != 0 else { return }
        helper(&board)
    }
    
    private func helper(_ board: inout [[Character]]) -> Bool{
     
        for row in 0..<board.count{
            for col in 0..<board[0].count where board[row][col] == "." {
                for n in 1...9 where isValid(board, Character("\(n)"), row, col){
                    board[row][col] = Character("\(n)")
                    if helper(&board){
                        return true
                    }else{
                        board[row][col] = "."
                    }
                }
                
                return false
            }
        }
        
        return true
    }
    

    private func isValid(_ board: [[Character]], _ char: Character, _ row: Int, _ col: Int) -> Bool{
        for i in 0...8{
            if board[row][i] == char || board[i][col] == char { return false }
            
            let startRow = (row/3) * 3
            let startCol = (col/3) * 3
            
            if board[startRow + i/3][startCol + i%3] == char{
                return false
            }
        }
        
        return true
    }
    
}

var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],
                            ["6",".",".","1","9","5",".",".","."],
                            [".","9","8",".",".",".",".","6","."],
                            ["8",".",".",".","6",".",".",".","3"],
                            ["4",".",".","8",".","3",".",".","1"],
                            ["7",".",".",".","2",".",".",".","6"],
                            [".","6",".",".",".",".","2","8","."],
                            [".",".",".","4","1","9",".",".","5"],
                            [".",".",".",".","8",".",".","7","9"]]

let solver = Solution()
solver.solveSudoku(&board)
print(board)
