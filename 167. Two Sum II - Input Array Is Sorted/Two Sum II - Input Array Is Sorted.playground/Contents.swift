class Solution {
    // MARK: - Solution 1: hashtable
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        // Value: Index
        var dict: [Int: Int] = [:]
        
        for (i, num) in numbers.enumerated(){
            
            let residual = target - num
            
            if dict[residual] != nil{
                return [i+1, dict[residual]!+1].sorted()
            }else{
                dict[num] = i
            }
        }
        
        return [-1, -1]
    }


}

import XCTest

class Test: XCTestCase{
    
    private let solver = Solution()
    
    func test1(){
        let result = solver.twoSum([2,7,11,15], 9)
        XCTAssertEqual(result, [1,2])
    }
    
    func test2(){
        let result = solver.twoSum([2,3,4], 6)
        XCTAssertEqual(result, [1,3])
    }
    
    func test3(){
        let result = solver.twoSum([-1,0], -1)
        XCTAssertEqual(result, [1,2])
    }
}

Test.defaultTestSuite.run()
