class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var results: [[Int]] = []
        let nums = nums.sorted()
        
        func backtracking(_ curr: inout [Int], _ size: Int, _ start: Int){
            if curr.count == size{
                results.append(curr)
                return
            }
            
            for i in start..<nums.count{
                if i > 0 && nums[i] == nums[i-1] && i != start{
                    continue
                }
                
                curr.append(nums[i])
                backtracking(&curr, size, i+1)
                curr.removeLast()
            }
        }
        
        for i in 0...nums.count{
            
            var curr: [Int] = []
            backtracking(&curr, i, 0)
        }
        
        return results
    }
}


let solver = Solution()
solver.subsetsWithDup([1,2,2])
