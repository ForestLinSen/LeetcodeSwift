class Solution {
    func climbStairs(_ n: Int) -> Int {
        var count = 0
        
        func backtracking(_ sum: inout Int){
            if sum == n {
                count += 1
                return
            }else if sum > n{
                return
            }
            
            for step in [1, 2]{
                sum += step
                backtracking(&sum)
                sum -= step
            }
        }
        
        var sum = 0
        backtracking(&sum)
        
        return count
    }
}

let solver = Solution()
solver.climbStairs(15)
