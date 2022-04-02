// https://gist.github.com/RuolinZheng08/cdd880ee748e27ed28e0be3916f56fa6
class Solution {
    var currentState = [Int]()
    var solutions = [[String]]()
    
    func solveNQueens(_ n: Int) -> [[String]] {
        search(n: n)
        return solutions
    }
    
    func isValid(n: Int) -> Bool{
        return currentState.count == n
    }
    
    func getCandidates(n: Int) -> [Int]{
        
        var candidates = Array(0..<n)
        
        if currentState.isEmpty{
            return candidates
        }
        
        for (row, col) in currentState.enumerated(){

            if let index = candidates.firstIndex(of: col){
                candidates.remove(at: index)
            }

            let currentRow = currentState.count
            let dist = currentRow - row
            let removeValLeft = col - dist
            let removeValRight = col + dist
            
            //print("row: \(row), col: \(col) dist: \(dist) removeLeft: \(removeValLeft) removeRight: \(removeValRight)")

            if let leftIndex = candidates.firstIndex(of: removeValLeft){
                candidates.remove(at: leftIndex)
            }

            if let rightIndex = candidates.firstIndex(of: removeValRight){
                candidates.remove(at: rightIndex)
            }
        }

        
        return candidates
    }
    
    func search(n: Int){
        if isValid(n: n){
            solutions.append(helper(state: currentState, n: n))
            print(solutions)
        }
        
        for candidate in getCandidates(n: n){
            currentState.append(candidate)
            search(n: n)
            currentState.removeLast()
        }
        
    }
    
    func helper(state: [Int], n: Int) -> [String]{
        var board = Array(repeating: "....", count: n)
        
        for (i, j) in state.enumerated(){
            board[i] = String(repeating: ".", count: j) + "Q" + String(repeating: ".", count: n-j-1)
        }
        
        return board
        
    }
}


let solver = Solution()
//solver.currentState = [1,3,0]
solver.search(n:4)
