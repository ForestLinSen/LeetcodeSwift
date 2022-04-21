class Solution{
    func quickSort(nums: inout [Int], left: Int, right: Int){
        
        if (left < right){
            
            let index = partition(nums: &nums, left: left, right: right)
            quickSort(nums: &nums, left: left, right: index-1)
            quickSort(nums: &nums, left: index, right: right)
        }
        
        print(nums)
        
    }
    
    func partition(nums: inout [Int], left: Int, right: Int) -> Int{

        
        
        let index = (left + right) / 2
        let pivot = nums[index]
        var j = left
        
        for i in left..<right{
            if nums[i] < pivot{
                nums.swapAt(i, j)
                j += 1
            }
        }

        nums.swapAt(j, index)

        return j + 1
        
    }
}

var nums = [3,2,1,5,6,4]
let solver = Solution()
solver.quickSort(nums: &nums, left: 0, right: nums.count)
print(nums)
