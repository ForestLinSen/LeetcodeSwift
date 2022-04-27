class Solution {
    func checkPossibility(_ nums: [Int]) -> Bool {
        guard nums.count != 0 else{ return true}
        
        var j = 0
        var currentNum = nums[0]
        
        for i in 0..<nums.count-1{
            if currentNum > nums[i+1]{
                var numsOne = nums
                var numsTwo = nums

                numsOne.remove(at: j)
                numsTwo.remove(at: j+1)
                
                print(numsOne, numsTwo)
                
                return checkArray(numsOne) || checkArray(numsTwo)
            }
            
            j += 1
            currentNum = nums[j]
        }
        
        return true
    }
    
    func checkArray(_ nums: [Int]) -> Bool{
        
        for i in 0..<nums.count{
            let currentNum = nums[i]
            
            if i+1 <= nums.count-1 && currentNum > nums[i+1]{
                return false
            }
        }
        
        return true
    }
}

import XCTest

class Test:XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.checkPossibility([3,4,2,3])
        XCTAssertEqual(result, false)
    }

    func test1(){
        let result = solver.checkPossibility([])
        XCTAssertEqual(result, true)
    }

    func test2(){
        let result = solver.checkPossibility([4,2,3])
        XCTAssertEqual(result, true)
    }

    func test3(){
        let result = solver.checkPossibility([4,2,1])
        XCTAssertEqual(result, false)
    }

    func test4(){
        let result = solver.checkPossibility([-1,4,2,3])
        XCTAssertEqual(result, true)
    }
}

Test.defaultTestSuite.run()
