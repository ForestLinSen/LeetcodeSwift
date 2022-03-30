import SwiftUI

//Input: nums = [4,5,6,7,0,1,2], target = 0
//Output: 4

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, low: 0, high: nums.count-1, target: target)
    }
    
    func binarySearch(_ nums: [Int], low: Int, high: Int, target: Int) -> Int{
        
        if low > high{
            return -1
        }
        
        let mid = (low+high)/2
        
        print(nums[mid])
        
        if nums[mid] == target{
            return mid
        }else{
            
            if(nums[mid] >= nums[low]){ // 左侧没问题
                if nums[mid] > target && target >= nums[low]{
                    return binarySearch(nums, low: low, high: mid-1, target: target) // Left
                }else{
                    return binarySearch(nums, low: mid+1, high: high, target: target) // Right
                }
            }else{ // 右侧没问题
                if target > nums[mid] && target <= nums[high]{
                    return binarySearch(nums, low: mid+1, high: high, target: target) // Right
                }else{
                    return binarySearch(nums, low: low, high: mid-1, target: target) // Left
                }
            }
        }
    }
    
}

import XCTest

class Tests: XCTestCase{
    private let solver = Solution()

    func test1(){
        let arr = [4,5,6,7,0,1,2]
        let res = solver.search(arr, 0)
        XCTAssertEqual(res, 4)
    }

    func test2() {
        let res = solver.search([4,5,6,7,0,1,2], 3)
        XCTAssertEqual(res, -1)
    }

    func test3() {
        let res = solver.search([1], 0)
        XCTAssertEqual(res, -1)
    }

    func test4(){
        let res = solver.search([3,5,1], 3)
        XCTAssertEqual(res, 0)
    }

    func test5(){
        let res = solver.search([3,1], 1)
        XCTAssertEqual(res, 1)
    }

    func test6(){
        let res = solver.search([4,5,6,7,0,1,2], 2)
        XCTAssertEqual(res, 6)
    }

    func test7(){
        let res = solver.search([4,5,6,7,0,1,2], 4)
        XCTAssertEqual(res, 0)
    }

    func test8(){
        let res = solver.search([5,1,3], 3)
        XCTAssertEqual(res, 2)
    }

    func test9(){
        let res = solver.search([5,1,3], 5)
        XCTAssertEqual(res, 0)
    }

    func test10(){
        let res = solver.search([6,7,1,2,3,4,5], 6)
        XCTAssertEqual(res, 0)
    }

    func test11(){
        let res = solver.search([1,2,3,4,5,6], 4)
        XCTAssertEqual(res, 3)
    }

    func test12(){
        let res = solver.search([5,1,2,3,4], 4)
        XCTAssertEqual(res, 4)
    }

    func test13(){
        let res = solver.search([4,5,6,7,8,1,2,3], 8)
        XCTAssertEqual(res, 4)
    }
    
    func test14(){
        let res = solver.search([5,1,2,3,4], 1)
        XCTAssertEqual(res, 1)
    }
}

Tests.defaultTestSuite.run()
