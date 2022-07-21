// https://gist.github.com/RuolinZheng08/cdd880ee748e27ed28e0be3916f56fa6
// https://www.youtube.com/watch?v=Ph95IHmRp5M

//var board = Array(repeating: Array(repeating: ".", count: 4), count: 4)
//var join: [String] = []
//// [".Q..","...Q","Q...","..Q."]
//for row in board{
//    join.append(row.joined())
//}
//
//print(join)

class Solution {
    
    func solveNQueens(_ n: Int) -> [[String]] {
        var colSet = Set<Int>()
        var posDiagSet = Set<Int>()
        var negDiagSet = Set<Int>()
        
        var res: [[String]] = []
        var board: [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        
        func backtracking(_ row: Int){
            // add result
            if row == n{
                var currResult: [String] = []
                for row in board{
                    currResult.append(row.joined())
                }
                res.append(currResult)
                return
            }
            
            for col in 0..<n{
                if colSet.contains(col) || posDiagSet.contains(row+col) || negDiagSet.contains(row-col){
                    continue
                }
                
                colSet.insert(col)
                posDiagSet.insert(row+col)
                negDiagSet.insert(row-col)
                board[row][col] = "Q"
                
                backtracking(row+1)
                
                // clear the board
                board[row][col] = "."
                colSet.remove(col)
                posDiagSet.remove(row+col)
                negDiagSet.remove(row-col)
                
            }
            
        }
        
        backtracking(0)
        return res
    }
}



let solver = Solution()
let res = solver.solveNQueens(8)
print(res, res.count)
