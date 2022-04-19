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
    
    // MARK: - Solution 2: Two Pointers
    func twoSumTwoPointers(_ numbers: [Int], _ target: Int) -> [Int]{
        var left = 0
        var right = numbers.count-1
        
        while left < right{
            
            let sum = numbers[left] + numbers[right]
            
            if sum == target{
                return [left+1, right+1]
            }else if sum < target{
                left += 1
            }else{
                right -= 1
            }
        }
        
        return [-1, -1]
    }


}

import XCTest

class Test: XCTestCase{
    
    private let solver = Solution()
    
    func test1(){
        let result = solver.twoSumTwoPointers([2,7,11,15], 9)
        XCTAssertEqual(result, [1,2])
    }
    
    func test2(){
        let result = solver.twoSumTwoPointers([2,3,4], 6)
        XCTAssertEqual(result, [1,3])
    }
    
    func test3(){
        let result = solver.twoSumTwoPointers([-1,0], -1)
        XCTAssertEqual(result, [1,2])
    }
}

Test.defaultTestSuite.run()
