class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var results: [[Int]] = []
        
        func backtracking(_ curr: inout [Int], _ residual: Int, _ start: Int){
            if residual == 0{
                results.append(curr)
                return
            } else if residual < 0{
                return
            }
            
            for i in start..<candidates.count{
                curr.append(candidates[i])
                backtracking(&curr, residual-candidates[i], i)
                curr.removeLast()
            }
        }
        
        var curr: [Int] = []
        backtracking(&curr, target, 0)
        
        return results
        
    }
}

let solver = Solution()
solver.combinationSum([2, 3, 6, 7], 7)
