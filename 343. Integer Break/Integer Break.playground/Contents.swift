// https://www.youtube.com/watch?v=in6QbUPMJ3I

class Solution {
    func integerBreak(_ n: Int) -> Int {
        return 0
    }
    
    
    // backtracking solution
    func integerBreakDfs(_ n: Int) -> Int{
        
        func dfs(_ num: Int) -> Int{
            
            if num == 1 { return 1 }
            print(num)
            
            var res = (num == n ? 0 : num)
            for i in 1..<num{
                //print(i, num-i)
                let val = dfs(i) * dfs(num-i)
                res = max(res, val)
            }
            
            return res
        }
        
        return dfs(n)
    }
}


var solver = Solution()
solver.integerBreakDfs(4)
