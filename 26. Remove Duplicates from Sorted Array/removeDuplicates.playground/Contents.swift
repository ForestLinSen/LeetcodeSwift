class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0
        {
            return 0
        }
        var index  = 1
        for i in 1..<nums.count
        {
            if nums[i - 1] != nums[i]{
                nums[index] = nums[i]
                index += 1
            }
        }
        return index
    }
}


let solver = Solution()
//var array = [0,0,1,1,1,2,2,3,3,4]
//var array = [1,2,3,4,5]
//var array = [Int]()
var array = [1,2]
solver.removeDuplicates(&array)
