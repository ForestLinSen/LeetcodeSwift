import Foundation

class Solution {
    
    func generateParenthesis(_ n: Int) -> [String] {
        var dp = [[String]](repeating: [], count: n+1)
        dp[0] = [""]
        
        for i in 1...n{
            for j in 0..<i{
                for s1 in dp[j]{
                    for s2 in dp[i-j-1]{
                        dp[i].append("(" + s1 + ")" + s2)
                    }
                }
            }
        }
        
        print(dp[n])
        return dp[n]
        
    }
}

let solver = Solution()
solver.generateParenthesis(3)
