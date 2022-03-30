class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        let index = binarySearch(nums, 0, nums.count-1, target)
        if(index == -1){
            return [-1,-1]
        }else{
            var rightIndex = index
            var leftIndex = index
            
            while(rightIndex+1 <= nums.count-1 && nums[rightIndex+1] == target){
                rightIndex += 1
            }
            
            while(leftIndex-1 >= 0 && nums[leftIndex-1] == target){
                leftIndex -= 1
            }
            
            return [leftIndex, rightIndex]
        }

    }
    
    func binarySearch(_ nums: [Int], _ low: Int, _ high: Int, _ target: Int)->Int{
        if(low>high){
            return -1
        }
        
        let mid = (low+high)/2
        
        if(nums[mid] == target){
            return mid
        }else if nums[mid] > target{
            return binarySearch(nums, low, mid-1, target)
        }else{
            return binarySearch(nums, mid+1, high, target)
        }

    }
}


import XCTest

class Tests: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.searchRange([5,7,7,8,8,10], 8)
        XCTAssertEqual(result, [3,4])
    }
    
    func test1(){
        let result = solver.searchRange([5,7,7,8,8,10], 6)
        XCTAssertEqual(result, [-1, -1])
    }
    
    func test2(){
        let result = solver.searchRange([], 0)
        XCTAssertEqual(result, [-1, -1])
    }
}

Tests.defaultTestSuite.run()
