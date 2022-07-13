// https://stackoverflow.com/questions/67355764/why-do-we-pop-from-the-list-at-the-end-of-each-backtrack-iteration

class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results: [[Int]] = []
        let candidates = candidates.sorted()
        
        func backtracking(_ curr: inout [Int], _ residual: Int, _ start: Int, _ visited: inout [Bool]){
            
            if residual == 0{
                results.append(curr)
                return
            }else if residual < 0{
                return
            }
            
            for i in start..<candidates.count where candidates[i] <= residual{
                
                if i > 0 && candidates[i] == candidates[i-1] && i != start { continue }
                
                curr.append(candidates[i])
                backtracking(&curr, residual-candidates[i], i+1, &visited)
                curr.removeLast()
            }
        }
        
        var curr: [Int] = []
        var visited = Array(repeating: false, count: candidates.count)
        backtracking(&curr, target, 0, &visited)
        
        return results
    }
}

let solver = Solution()
solver.combinationSum2([10,1,2,7,6,1,5], 8)
