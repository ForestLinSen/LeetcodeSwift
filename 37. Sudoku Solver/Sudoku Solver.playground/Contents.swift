
print("Begin")

class Solution {
    func solveSudoku(_ board: inout [[Character]]) {
        search(&board)
        print(board)
    }
    
    private func search(_ board: inout [[Character]]) -> Bool{
        for row in board.indices{
            for col in board[0].indices where board[row][col] == "."{
                for val in 1...9 where isValid(board, Character(String(val)), row, col){
                    board[row][col] = Character(String(val))
                    if search(&board){
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
            if board[row][i] == char || board[i][col] == char{
                return false
            }
            
            let boxRow = (row/3) * 3 + i/3
            let boxCol = (col/3) * 3 + i%3
            
            if(board[boxRow][boxCol] == char){
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
