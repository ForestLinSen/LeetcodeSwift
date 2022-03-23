import Foundation

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var i = nums.count - 2
        
        while(i >= 0 && nums[i] >= nums[i+1]){
            i -= 1
            print(i)
        }
        
        
        if i >= 0{
            // find the smallest number that bigger than the value at index i
            print("i > 0")
            var j = i + 1
            if(j < nums.count-1){
                //print("nums j: \(j)")
                while(nums[j] >= nums[j+1] && nums[j+1] > nums[i]){
                    j += 1
                    
                    if(j+1 > nums.count-1){
                        break
                    }
                    
                    print("j: \(j)")
                }
            }
 
            nums.swapAt(i, j)
            nums[i+1...nums.count-1].reverse()
        }else{
            nums.reverse()
        }
        
        print(nums)
    }
}

// Example:
// arr = [1,2,3] -> [1,3,2]
// arr = [3,2,1] -> [1,2,3]
// arr = [1,1,5] -> [1,5,1]
// arr = [3,2,1,5] -> [3,2,5,1]

//var arr = [1,3,2]
//var arr = [5,1,1]
var arr = [4,2,4,4,3]

let solver = Solution()
solver.nextPermutation(&arr)
