import SwiftUI

class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        var dp: [Int] = Array.init(repeating: 0, count: s.count)
        let chars = Array(s)
        
        for i in 0..<chars.count{
            
            if chars[i] == "("{
                dp[i] = 0
            }else{
                
                if i-1>=0 && chars[i-1] == "(" {
                    dp[i] = dp[i-1] + 2
                }
                
                // s = "())"
                if i-1>=0 && i-dp[i-1]-1>=0 && chars[i-dp[i-1]-1] == "("{
                    dp[i] = dp[i-1] + 2
                    
                    if (i-dp[i-1]-2)>=0 {
                        dp[i] += dp[i-dp[i-1]-2]
                    }
                }
            }
            
            print(dp)
        }
        
        return dp.max() ?? 0
    }
}

// Input: s = ")()())"
// Output: 4

import XCTest

class Tests: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let s = ")()()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(4, result)
    }

    func test1(){
        let s = "(()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(2, result)
    }

    func test2(){
        let s = ""
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(0, result)
    }

    func test3(){
        let s = ")()()()()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(8, result)
    }

    func test4(){
        let s = "()(())"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(6, result)
    }

    func test5(){
        let s = "()(()"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(2, result)
    }

    func test6(){
        let s = "(()())"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(6, result)
    }

    func test7(){
        let s = ")()())"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(4, result)
    }
    
    func test8(){
        let s = "())"
        let result = solver.longestValidParentheses(s)
        XCTAssertEqual(2, result)
    }
}

Tests.defaultTestSuite.run()
