class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var results: [[Int]] = []
        let candidates = Array(1...9)
        
        func backtracking(_ curr: inout [Int], _ start: Int, _ residual: Int){
            if residual < 0{
                return
            }
            
            if curr.count == k{
                if residual == 0{
                    results.append(curr)
                }
                return
            }
            
            for i in start..<candidates.count where candidates[i] <= residual{
                curr.append(candidates[i])
                backtracking(&curr, i+1, residual-candidates[i])
                curr.removeLast()
            }
        }
        
        var curr: [Int] = []
        backtracking(&curr, 0, n)
        
        return results
    }
}

let solver = Solution()
solver.combinationSum3(3, 9)
