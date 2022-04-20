class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var result = [Int]()
        var i = 0
        var j = 0
        
        while i <= m-1 && j <= n-1{
            if nums1[i] < nums2[j]{
                result.append(nums1[i])
                i += 1
            }else{
                result.append(nums2[j])
                j += 1
            }
        }
        
        if i <=  m-1{
            result.append(contentsOf: nums1[i...m-1])
        }else if j <= n-1{
            result.append(contentsOf: nums2[j...n-1])
        }
        
        nums1 = result 
    }
}


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test1(){
        var nums1 = [1,2,3,0,0,0]
        solver.merge(&nums1, 3, [2,5,6], 3)
        XCTAssertEqual(nums1, [1,2,2,3,5,6])
    }
    
    func test2(){
        var nums1 = [1]
        solver.merge(&nums1, 1, [], 0)
        XCTAssertEqual(nums1, [1])
    }
    
    func test3(){
        var nums1 = [0]
        solver.merge(&nums1, 0, [1], 1)
        XCTAssertEqual(nums1, [1])
    }
}

Test.defaultTestSuite.run()
