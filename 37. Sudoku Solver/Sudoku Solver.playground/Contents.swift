
class Solution {
    
    private let allDigits: [Character] = {
        let array = Array(1...9)
        return array.map {Character(String($0))}
    }()
    
    func solveSudoku(_ board: inout [[Character]]) {
        search(&board)
    }
    
    func isValide(_ board: inout [[Character]]) -> Bool{
        let n = board.count
        var rows = Array(repeating: Set<Character>(), count: n)
        var cols = Array(repeating: Set<Character>(), count: n)
        var boxes = Array(repeating: Set<Character>(), count: n)
        
        for i in board.indices{
            for j in board[0].indices{
                let item = board[i][j]
                
                if item == "."{
                    continue
                }
                
                if rows[i].contains(item){
                    return false
                }else{
                    rows[i].insert(item)
                }
                
                if cols[j].contains(item){
                    return false
                }else{
                    cols[i].insert(item)
                }
                
                let boxIndex = i/3 * 3 + j/3
                if boxes[boxIndex].contains(item){
                    return false
                }else{
                    boxes[boxIndex].insert(item)
                }
            }
        }
        
        return true
    }
    
    func search(_ board: inout [[Character]]) -> Bool{
        if let emptyIndex = findEmpty(&board){
            let row = emptyIndex.0, col = emptyIndex.1
            
            for i in 1...9{
                if isValide(&board){
                    board[row][col] = Character(String(i))
                    
                    if search(&board){
                        return true
                    }
                    
                    board[row][col] = "."
                }
            }
        }

        return true
    }
    
    func findEmpty(_ board: inout [[Character]]) -> (Int, Int)?{
        for i in board.indices{
            for j in board[0].indices{
                if board[i][j] == "."{
                    print(i,j)
                    return (i, j)
                }
            }
        }
        
        print(board)
        return nil
    }
}

var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

let solver = Solution()
solver.solveSudoku(&board)
