class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        
        for num in nums{
            dict[num, default: 0] += 1
        }
        
        var result = [Int]()
        dict.sorted{$0.value > $1.value}.forEach { keyVal in
            if result.count < k{
                result.append(keyVal.key)
            }
        }
        
        return result
    }
}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.topKFrequent([1,1,1,2,2,3], 2)
        XCTAssertEqual(result, [1,2])
    }
    
    func test1(){
        let result = solver.topKFrequent([1], 1)
        XCTAssertEqual(result, [1])
    }
}

Test.defaultTestSuite.run()
