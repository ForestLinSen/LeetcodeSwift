class Solution {
    // MARK: - hashtable solution
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

}

import XCTest
import Darwin

class Test: XCTestCase{
    private let solver = Solution()
    
    func test1(){
        let result = solver.judgeSquareSum(5)
        XCTAssertEqual(result, true)
    }
    
    func test2(){
        let result = solver.judgeSquareSum(3)
        XCTAssertEqual(result, false)
    }
    
    func test3(){
        let result = solver.judgeSquareSum(97)
        XCTAssertEqual(result, true)
    }
    
    func test4(){
        let result = solver.judgeSquareSum(11)
        XCTAssertEqual(result, false)
    }
    
    func test5(){
        let result = solver.judgeSquareSum(2)
        XCTAssertEqual(result, true)
    }
    
    func test6(){
        let result = solver.judgeSquareSum(8)
        XCTAssertEqual(result, true)
    }
}

Test.defaultTestSuite.run()
