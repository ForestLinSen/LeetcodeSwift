import Foundation

class Solution {
    // MARK: - Hashtable Solution
    func judgeSquareSum(_ c: Int) -> Bool {
        var dict: [Int: Int] = [:]
        
        for i in 0...c{
            
            // early return
            if i*i > c{
                return false
            }
            
            let residual = c - i*i
            
            if dict[residual] != nil || i*i*2 == c{
                return true
            }else{
                dict[i*i] = 1
            }
        }
        
        return false
    }
    
    // MARK: - Two Pointers Solution
    func judgeSquareSumTwoPointers(_ c: Int) -> Bool {
        var left = 0
        var right = Int(sqrt(Double(c)))
        
        while left <= right{
            let result = left*left + right*right
            
            if result == c{
                return true
            }else if result < c{
                left += 1
            }else{
                right -= 1
            }
        }
        
        return false

    }
    
}

import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test1(){
        let result = solver.judgeSquareSumTwoPointers(5)
        XCTAssertEqual(result, true)
    }
    
    func test2(){
        let result = solver.judgeSquareSumTwoPointers(3)
        XCTAssertEqual(result, false)
    }
    
    func test3(){
        let result = solver.judgeSquareSumTwoPointers(97)
        XCTAssertEqual(result, true)
    }
    
    func test4(){
        let result = solver.judgeSquareSumTwoPointers(11)
        XCTAssertEqual(result, false)
    }
    
    func test5(){
        let result = solver.judgeSquareSumTwoPointers(2)
        XCTAssertEqual(result, true)
    }
    
    func test6(){
        let result = solver.judgeSquareSumTwoPointers(8)
        XCTAssertEqual(result, true)
    }
}

Test.defaultTestSuite.run()
