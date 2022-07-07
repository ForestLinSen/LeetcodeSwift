class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word)
        var isFound = false
        
        func backTracking(_ i: Int, _ j: Int, _ curr: String, _ visited: [[Bool]]){
            var visited = visited
 
            var curr = curr
            if curr.count == word.count{
                isFound = true
                return
            }
            
            let checkCharIndex = curr.count
            if board[i][j] != word[checkCharIndex]{
                return
            }
            
            curr = curr+String(board[i][j])
            print(curr)
            if curr.count == word.count{
                isFound = true
                return
            }

            visited[i][j] = true
            
            for delta in [(-1,0), (1, 0), (0, -1), (0, 1)]{
                let newX = i + delta.0
                let newY = j + delta.1
                //print(newX, newY)

                // boundary check
                if  newX < 0 || newY < 0 || newX >= board.count || newY >= board[0].count {
                    continue
                }
                
                if !visited[newX][newY]{
                    backTracking(newX, newY, curr, visited)
                }
  
            }


        }
        
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                if board[i][j] == word[0]{
                    let visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
                    backTracking(i, j, "", visited)
                }
            }
        }
        
        return isFound

        
    }
}

let solver = Solution()
//solver.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")
solver.exist([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]], "ABCESEEEFS")
