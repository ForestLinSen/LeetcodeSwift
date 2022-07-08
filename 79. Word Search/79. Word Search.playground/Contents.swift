class Solution{
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        var isFound = false
        let word = Array(word)
        var board = board
        
        func dfs(_ index: Int, _ i: Int, _ j: Int){
            if isFound { return }
            
            if index == word.count {
                isFound = true
                return
            }
            
            if i < 0 || j < 0 || i >= board.count || j >= board[0].count{
                return
            }
            
            let tmp = board[i][j]
            if tmp != word[index] { return }
            
            board[i][j] = "#"
            for delta in [[0, -1], [0, 1], [1, 0], [-1, 0]]{
                let x = delta[0]
                let y = delta[1]
                
                dfs(index+1, i+x, j+y)
            }
            
            board[i][j] = tmp
        }
        
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                
                if isFound { return true }
                if board[i][j] == word[0]{
                    dfs(0, i, j)
                }
            }
        }
        
        return isFound
    }
}


let solver = Solution()
//solver.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")
solver.exist([["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","A"],["A","A","A","A","A","B"],["A","A","A","A","B","A"]], "AAAAAAAAAAAAABB")


// MARK: - The Original Solution
//class Solution {
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        let word = Array(word)
//        var isFound = false
//
//        func backTracking(_ i: Int, _ j: Int, _ curr: String, _ visited: [[Bool]]){
//            if isFound { return }
//
//            print(curr)
//
//            var visited = visited
//
//            var curr = curr
//            if curr.count == word.count{
//                isFound = true
//                return
//            }
//
//            let checkCharIndex = curr.count
//            if board[i][j] != word[checkCharIndex]{
//                return
//            }
//
//            curr = curr+String(board[i][j])
//            print(curr)
//            if curr.count == word.count{
//                isFound = true
//                return
//            }
//
//            visited[i][j] = true
//
//            for delta in [(-1,0), (1, 0), (0, -1), (0, 1)]{
//                let newX = i + delta.0
//                let newY = j + delta.1
//                //print(newX, newY)
//
//                // boundary check
//                if  newX < 0 || newY < 0 || newX >= board.count || newY >= board[0].count {
//                    continue
//                }
//
//                if !visited[newX][newY]{
//                    backTracking(newX, newY, curr, visited)
//                }
//
//            }
//
//
//        }
//
//        for i in 0..<board.count{
//            for j in 0..<board[0].count{
//                if board[i][j] == word[0]{
//                    let visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
//                    backTracking(i, j, "", visited)
//                }
//            }
//        }
//        return isFound
//    }
//}

