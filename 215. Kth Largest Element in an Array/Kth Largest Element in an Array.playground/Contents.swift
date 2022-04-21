class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var left = 0
        var right = nums.count-1
        var nums = nums
        let k = k-1
        
        while left < right{
            let index = partition(nums: &nums, left: left, right: right)
            if index == k{
                return nums[k]
            }else if index > k{
                right = index-1
            }else{
                left = index+1
            }
        }
        
        return nums[k]
    }
    
    func partition(nums: inout [Int], left: Int, right: Int) -> Int{
        let index = right
        let pivot = nums[index]
        var j = left
        
        for i in left..<right{
            if nums[i] > pivot{
                nums.swapAt(i, j)
                j += 1
            }
        }

        nums.swapAt(j, index)

        return j
    }
}

// [8,6,5,4,3,1]
//var nums = [3,8,6,4,5,1]

//quickSort(nums: &nums, left: 0, right: nums.count-1)

//var nums = [3,2,1,5,6,4]
//let solver = Solution()
//solver.quickSort(nums: &nums, left: 0, right: nums.count-1)
//print(nums)


import XCTest

class Test: XCTestCase{
    private let solver = Solution()
    
    func test0(){
        let result = solver.findKthLargest([3,8,6,4,5,1], 2)
        XCTAssertEqual(result, 6)
    }

    func test1(){
        let result = solver.findKthLargest([3,2,1,5,6,4], 2)
        XCTAssertEqual(result, 5)
    }

    func test2(){
        let result = solver.findKthLargest([3,2,3,1,2,4,5,5,6], 4)
        XCTAssertEqual(result, 4)
    }

    func test3(){
        let result = solver.findKthLargest([-1,-1], 2)
        XCTAssertEqual(result, -1)
    }

    func test4(){
        let result = solver.findKthLargest([-1,2,0], 2)
        XCTAssertEqual(result, 0)
    }
}

Test.defaultTestSuite.run()
