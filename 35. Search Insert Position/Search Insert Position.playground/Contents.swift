class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        let index = binarySearch(nums, 0, nums.count-1, target)
        
        if index.0 == -1{
            if (nums[index.1] > target){
                return index.1
            }else{
                return index.1 + 1
            }
        }
        
        return index.0
    }
    
    func binarySearch(_ nums: [Int], _ low: Int, _ high: Int, _ target: Int) -> (Int, Int){

        
        let mid = (low + high)/2
        
        if(low > high){
            return (-1, mid)
        }
        
        if(nums[mid] == target){
            return (mid, mid)
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
        let result = solver.searchInsert([1,3,5,6], 5)
        XCTAssertEqual(result, 2)
    }
    
    func test1(){
        let result = solver.searchInsert([1,3,5,6], 2)
        XCTAssertEqual(result, 1)
    }
    
    func test2(){
        let result = solver.searchInsert([1,3,5,6], 7)
        XCTAssertEqual(result, 4)
    }
}

Tests.defaultTestSuite.run()
